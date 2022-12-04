<template>
  <div>
    <el-card class="box-card">
      <h1 class="title">Welcome to My Book Library</h1>

      <div class="item"> username: {{admin.username}}</div>
      <div class="item"> Phone: {{admin.phone}}</div>
      <div class="item"> Email: {{admin.email}}</div>
    </el-card>
  </div>

</template>

<script>
import Cookies from 'js-cookie'
import request from '@/utils/request'

export default {
  data(){
    return{
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
    }
  },
  created() {
   // request.get('/admin/' + this.admin.id).then(res=>{
   //   this.admin = res.data
   // })
  }
}

</script>

<style>


.item {
  padding: 18px 0;
  margin:10px 0;
}

.box-card {
  width: 600px;
}

</style>