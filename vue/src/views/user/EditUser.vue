<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Edit User</div>
    <el-form :inline="true" :model="form" label-width="100px" >
      <el-form-item label="Name">
        <el-input v-model="form.name" placeholder="please enter name"></el-input>
      </el-form-item>
      <el-form-item label="Age">
        <el-input v-model="form.age" placeholder="please enter age"></el-input>
      </el-form-item>
      <el-form-item label="Sex">
        <el-input v-model="form.sex" placeholder="please enter sex"></el-input>
      </el-form-item>
      <el-form-item label="Phone">
        <el-input v-model="form.phone" placeholder="please enter phone"></el-input>
      </el-form-item>
      <el-form-item label="Address">
        <el-input v-model="form.address" placeholder="please enter address"></el-input>
      </el-form-item>
    </el-form>

    <!--    submit button and cancel button -->
    <div style="text-align: right; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">Submit</el-button>

    </div>
  </div>


</template>


<script>
import request from "@/utils/request"

export default {
  name: "EditUser",
  data(){
    return{
      form:{}
    }
  },
  created() {
    const id = this.$route.query.id;
    request.get("/user/"+ id).then(res=>{
      this.form = res.data
    })
  },
  methods:{
    save(){
      request.put('/user/update', this.form).then(res =>{
        console.log("form data: "+this.form)
        if (res.code === '200'){
          this.$notify.success('Update User Successfully !!!')
          this.$router.push("/userList")// direct to user list page
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