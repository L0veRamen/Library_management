<template>
  <div>
    <div class="item"> Username: {{admin.username}}</div>
    <div class="item">Phone: {{admin.phone}}</div>
    <div class="item">Email: {{admin.email}}</div>
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
.item{
  margin: 10px 0
}
</style>