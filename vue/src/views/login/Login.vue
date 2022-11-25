<template>
  <div style="height: 100vh; overflow: hidden">
    <div style="width: 500px; height: 400px; background-color: #434242; border-radius: 10px; margin: 150px auto; padding: 50px">
      <el-form :model="admin" ref="loginForm">
        <div style="margin: 30px; text-align: center; font-size: 30px; font-weight: bold; color:#F7F7F7">Log In</div>
        <el-form-item prop="username">
          <el-input placeholder="Please enter username" size="medium" prefix-icon="el-icon-user" v-model="admin.username" ></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input placeholder="Please enter password" size="medium" prefix-icon="el-icon-lock" v-model="admin.password" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button style=" width: 100%; margin-top: 30px; " size="medium"  type="primary" @click="login" >Log in</el-button>
        </el-form-item>
      </el-form>

    </div>
  </div>
</template>

<script>
import request from "@/utils/request"

export default {
  name: "Login",
  data(){
    return{
      admin:{

      }
    }
  },
  methods:{
    login(){
      request.post('/admin/login', this.admin).then(res=>{
        if (res.code === '200'){
          this.$notify.success("Log In Successfully !!!")
          this.$router.push('/')
        }else{
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>

<style scoped>

</style>