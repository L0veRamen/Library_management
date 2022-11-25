<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add User</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" label-width="100px" >
      <el-form-item label="Name" prop="name">
        <el-input v-model="form.name" placeholder="please enter name"></el-input>
      </el-form-item>
      <el-form-item label="Age" prop="age" >
        <el-input v-model="form.age" placeholder="please enter age"></el-input>
      </el-form-item>
      <el-form-item label="Sex" prop="sex">
        <el-radio v-model="form.sex" label="M">M</el-radio>
        <el-radio v-model="form.sex" label="F">F</el-radio>
      </el-form-item>
      <el-form-item label="Phone" prop="phone">
        <el-input v-model="form.phone" placeholder="please enter phone"></el-input>
      </el-form-item>
      <el-form-item label="Address" prop="address">
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
    const checkAge = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('age is null'));
      }
      if (!/^[0-9]+$/.test(value)) {
        callback(new Error('please enter number'));
      }
      if (parseInt(value)>120 || parseInt(value)<=0){
        callback(new Error('please valid number'));
      }
      callback()
    }
    return{
      form:{
        sex: 'M'
      },
      rules: {
        name: [
          {required: true, message: 'please enter name', trigger: 'blur'},
        ],
        age:[
          {validator: checkAge,trigger:'blur'}
        ]
      }
      }
    },
  methods:{
    save(){
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/user/save', this.form).then(res =>{
            console.log("form data: "+this.form)
            if (res.code === '200'){
              this.$notify.success('Add User Successfully !!!')
              // this.form = {sex: 'M'}
              this.$refs['ruleForm'].resetFields()
              this.$router.push("/userList")
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