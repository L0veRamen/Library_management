<template>
  <div>

    <!--    search panel-->
<!--    <div style="margin-bottom: 20px">-->
<!--      <el-input style="width: 240px" placeholder="Please enter book name" v-model="params.name"></el-input>-->
<!--      <el-input style="width: 240px" placeholder="Please enter book number" v-model="params.bookNo"></el-input>-->

<!--      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>-->
<!--      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset-->
<!--      </el-button>-->

<!--    </div>-->


    <el-table :data="tableData" stripe>
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
          <el-image :src="scope.row.cover" :preview-src-list="scope.row.cover " ></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="author" label="author"></el-table-column>
      <el-table-column prop="publisher" label="publisher"></el-table-column>
      <el-table-column prop="category" label="category"></el-table-column>
      <el-table-column prop="bookNo" label="bookNo"></el-table-column>
<!--      <el-table-column prop="createtime" label="createtime"></el-table-column>-->
<!--      <el-table-column prop="updatetime" label="updatetime"></el-table-column>-->

<!--      <el-table-column label="Edit" width="200">-->
<!--        <template v-slot="scope">-->
<!--          &lt;!&ndash;  scope.row is current row data&ndash;&gt;-->
<!--          <el-button type="primary" @click="$router.push('/editBook?id='+scope.row.id)">Edit</el-button>-->

<!--          <el-popconfirm-->
<!--              style="margin-left: 10px"-->
<!--              title="Are you sure you want to Delete ?"-->
<!--              @confirm="del(scope.row.id)"-->
<!--          >-->
<!--            <el-button type="danger" slot="reference">Delete</el-button>-->
<!--          </el-popconfirm>-->
<!--        </template>-->
<!--      </el-table-column>-->


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
  name: 'RecommendationList',
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
      request.put('/book/update', row).then(res => {
        console.log("row data: " + row)
        if (res.code === '200') {
          this.$notify.success('Add to favourite Book List')
          this.load()
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