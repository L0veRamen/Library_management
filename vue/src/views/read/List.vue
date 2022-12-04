<template>
  <div >

    <el-table :data="FavList" stripe >
      <el-table-column prop="id" label="id" width="50"></el-table-column>
      <el-table-column prop="name" label="name" width="150"></el-table-column>
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
          <el-image :src="scope.row.cover" ></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="author" label="author"></el-table-column>
      <el-table-column prop="publisher" label="publisher"></el-table-column>
      <el-table-column prop="category" label="category"></el-table-column>
<!--      <el-table-column prop="bookNo" label="bookNo"></el-table-column>-->



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
  name: 'readList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      FavList: [],
      FavIds:[],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
        bookNo: ''
      },


    }
  },
  created() {
    this.load()
  },
  methods: {

    load() {
      request.get('/book/allBook').then(res => {
        if (res.code === '200') {
          console.log(res)
          this.tableData = res.data
          this.total = res.data.total
          this.getFav()
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
    getFav() {
          this.FavList = []
            for(let j= 0; j<this.tableData.length;j++){
              if (this.tableData[j].finishread){
                this.FavList.push(this.tableData[j])
              }
            }

          this.FavList.sort((a,b)=>{
            if(a.id<b.id){
              return 1;
            }else {
              return -1;
            }
          })
          console.log(this.FavList.length)
    },
    AddFav(row) {
      row.userid = this.admin.id
      console.log(row)
      request.post('/book/update', row).then(res=>{
        if (res.code === '200') {
          this.$notify.success("modify Fav list successfully")
         this.getFav()
        } else {
          this.$notify.error(res.msg)
        }
      })
    }

  }
}
</script>

<style scoped>

</style>