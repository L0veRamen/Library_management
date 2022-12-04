<template>
  <div>

    <!--    search panel-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="Please enter book name" v-model="params.name"></el-input>
<!--      <el-input style="width: 240px" placeholder="Please enter book number" v-model="params.bookNo"></el-input>-->

      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset
      </el-button>

    </div>


    <el-table :data="tableData" stripe>
      <el-table-column prop="id" label="id" width="50"></el-table-column>
      <el-table-column prop="name" label="name" width="100"></el-table-column>
      <el-table-column prop="description"  label="description" width="200"></el-table-column>
      <el-table-column label="favourite" width="100">
        <template v-slot="scope">
          <el-switch
              v-model="scope.row.favourite"
              @change="AddFav(scope.row)"
              active-color="#13ce66"
              inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column prop="cover" label="cover">
        <template v-slot="scope">
          <el-image :src="scope.row.cover" ></el-image><!--:preview-src-list="scope.row.cover "-->
        </template>
      </el-table-column>
      <el-table-column prop="author" label="author"></el-table-column>
      <el-table-column prop="publisher" label="publisher" width="150"></el-table-column>
      <el-table-column prop="category" label="category" width="120"></el-table-column>
<!--      <el-table-column prop="bookNo" label="bookNo"></el-table-column>-->
<!--      <el-table-column prop="createtime" label="createtime"></el-table-column>-->
<!--      <el-table-column prop="updatetime" label="updatetime"></el-table-column>-->

      <el-table-column label="Edit" width="400">
        <template v-slot="scope">
          <!--  scope.row is current row data-->
          <el-button type="primary" @click="$router.push('/editBook?id='+scope.row.id)">Edit</el-button>

          <el-popconfirm
              style="margin-left: 10px"
              title="Are you sure you want to Delete ?"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">Delete</el-button>
          </el-popconfirm>
          <div style="margin-top: 20px">
            <el-radio-group  v-model="scope.row.readstatus" size="small" @input="updateReadState(scope.row)">
            <el-radio-button label="To Read" ></el-radio-button>
            <el-radio-button label="Reading" ></el-radio-button>
            <el-radio-button label="Read" ></el-radio-button>
          </el-radio-group></div>
        </template>
      </el-table-column>


    </el-table>

    <!--    Pagination-->
    <div style="margin-top: 20px">
      <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          layout="prev, pager, next"
          @current-change="handleCurrentChange"
          :total="total">
        <!--        :total="tableData.length">-->
      </el-pagination>
    </div>

  </div>
</template>

<script>

import request from "@/utils/request";
import Cookies from "js-cookie";

export default {
  name: 'BookList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
        bookNo: ''
      },
      radio: ""


    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/book/page', {
        params: this.params
      }).then(res => {
        if (res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
          console.log("data",res.data)
        }
      })
    },
    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        name: '',
        bookNo: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      // click page number button
      console.log(pageNum)
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/book/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("Delete book successfully")
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    AddFav(row) {
      row.userid = this.admin.id
      console.log(row)
      request.post('/book/update', row).then(res=>{
        if (res.code === '200') {
          this.$notify.success("modify Fav list successfully")
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    updateReadState(row){

      if(row.readstatus ==='To Read'){
        // console.log(row.readStatus);
        row.toread = 'true'
        row.reading = 'false'
        row.finishread = 'false'
      } else if (row.readstatus ==='Reading') {
        // console.log(row.readStatus);
        row.toread = 'false'
        row.reading = 'true'
        row.finishread = 'false'
      } else{
        // console.log(row.readStatus);
        row.toread = 'false'
        row.reading = 'false'
        row.finishread = 'true'
      }
      console.log(row);
      request.post('/book/updateStatus', row).then(res=>{
        row.userid = this.admin.id
        if (res.code === '200') {
          this.$notify.success("update read status successfully")
        } else {
          this.$notify.error(res.msg)
        }
      })
      // request.post('/book/updateReadState', row).then(res=>{
      //   if (res.code === '200') {
      //     this.$notify.success("modify Fav list successfully")
      //   } else {
      //     this.$notify.error(res.msg)
      //   }
      // })
    }
  }
}
</script>

<style scoped>

</style>