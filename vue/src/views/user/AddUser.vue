<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add User</div>
    <el-form :inline="true" :model="form" label-width="100px" >
      <el-form-item label="Name">
        <el-input v-model="form.name" placeholder="please enter name"></el-input>
      </el-form-item>
      <el-form-item label="Age">
        <el-input v-model="form.age" placeholder="please enter age"></el-input>
      </el-form-item>
      <el-form-item label="Sex">
        <el-radio v-model="form.sex" label="M">M</el-radio>
        <el-radio v-model="form.sex" label="F">F</el-radio>

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
  name: "AddUser",
  data(){
    return{
      form:{
        sex: 'M'
      }
    }
  },
  methods:{
    save(){
      request.post('/user/save', this.form).then(res =>{
        console.log("form data: "+this.form)
        if (res.code === '200'){
          this.$notify.success('Add User Successfully !!!')
          this.form = {sex: 'M'}
          this.$router.push("/user")
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