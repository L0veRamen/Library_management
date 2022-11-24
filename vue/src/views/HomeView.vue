<template>
  <div>

    <!--    search panel-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="Please enter Book name" v-model="params.name"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="Please enter phone"
                v-model="params.phone"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load" ><i class="el-icon-search" ></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset
      </el-button>

    </div>


    <el-table :data="tableData" stripe>
      <el-table-column prop="id" label="id"></el-table-column>
      <el-table-column prop="name" label="name"></el-table-column>
      <el-table-column prop="age" label="age"></el-table-column>
      <el-table-column prop="sex" label="sex"></el-table-column>
      <el-table-column prop="phone" label="phone"></el-table-column>
      <el-table-column prop="address" label="address"></el-table-column>
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

export default {
  name: 'HomeView',
  data() {
    return {
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
        phone: ''
      }

    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      // fetch('http://localhost:9090/user/list').then(res=>res.json()).then(res=>{
      //   console.log(res)
      //   this.tableData = res
      // })
      request.get('/user/page', {
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
        phone: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      // click page number button
      console.log(pageNum)
      this.params.pageNum = pageNum
      this.load()
    }
  }
}
</script>
