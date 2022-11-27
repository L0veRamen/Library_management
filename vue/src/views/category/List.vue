<template>
  <div>

    <!--    search panel-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="Please enter category name" v-model="params.name"></el-input>

      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset
      </el-button>

    </div>


    <el-table :data="tableData" stripe>
      <el-table-column prop="id" label="id" width="80"></el-table-column>
      <el-table-column prop="name" label="name"></el-table-column>
      <el-table-column prop="remark" label="comment"></el-table-column>
      <el-table-column prop="createtime" label="createtime"></el-table-column>
      <el-table-column prop="updatetime" label="updatetime"></el-table-column>

      <el-table-column label="Edit" width="230">
        <template v-slot="scope">
          <!--  scope.row is current row data-->
          <el-button type="primary" @click="$router.push('/editCategory?id='+scope.row.id)">Edit</el-button>

          <el-popconfirm
              style="margin-left: 10px"
              title="Are you sure you want to Delete ?"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">Delete</el-button>
          </el-popconfirm>
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
  name: 'CategoryList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
      },


    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/category/page', {
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
        username: '',
        phone: '',
        email: ''
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
      request.delete("/category/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("Delete category successfully")
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },

  }
}
</script>

<style scoped>

</style>