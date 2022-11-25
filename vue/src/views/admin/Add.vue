<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add Admin</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" label-width="100px" >
      <el-form-item label="UserName" prop="username">
        <el-input v-model="form.username" placeholder="please enter username"></el-input>
      </el-form-item>
      <el-form-item label="Phone" prop="phone">
        <el-input v-model="form.phone" placeholder="please enter phone"></el-input>
      </el-form-item>
      <el-form-item label="Email" prop="email">
        <el-input v-model="form.email" placeholder="please enter email"></el-input>
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
  name: "Add",
  data(){
    return{
      form:{
      },
      rules: {
        username: [
          {required: true, message: 'please enter username', trigger: 'blur'},
          {min:3, max:10,message: ' 3 to 10 length', trigger: 'blur'}
        ],
      }
      }
    },
  methods:{
    save(){
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/admin/save', this.form).then(res =>{
            console.log("form data: "+this.form)
            if (res.code === '200'){
              this.$notify.success('Add Admin Successfully !!!')
              // this.form = {sex: 'M'}
              this.$refs['ruleForm'].resetFields()
              this.$router.push("/adminList")
            }else{
              this.$notify.error(res.msg)
            }
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });


    }
  }
}
</script>

<style scoped>

</style>