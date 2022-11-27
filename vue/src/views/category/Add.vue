<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add Category</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" label-width="150px" >
      <el-form-item label="Category name" prop="name">
        <el-input v-model="form.name" placeholder="please enter category name"></el-input>
      </el-form-item>
      <el-form-item label="remark" prop="remark">
        <el-input v-model="form.remark" placeholder="please enter comment"></el-input>
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
  name: "AddCategory",
  data(){
    return{
      form:{
      },
      rules: {
        name: [
          {required: true, message: 'please enter category name', trigger: 'blur'},
        ],
      }
      }
    },
  methods:{
    save(){
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/category/save', this.form).then(res =>{
            console.log("form data: "+this.form)
            if (res.code === '200'){
              this.$notify.success('Add category Successfully !!!')
              // this.form = {sex: 'M'}
              this.$refs['ruleForm'].resetFields()
              this.$router.push("/categoryList")
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