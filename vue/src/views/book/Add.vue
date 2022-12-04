<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add Book</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" label-width="150px" >
      <el-form-item label="Book name" prop="name">
        <el-input v-model="form.name" placeholder="please enter book name"></el-input>
      </el-form-item>
      <el-form-item label="description" prop="description">
        <el-input style=" width: 400px" type="textarea" v-model="form.description" placeholder="please enter description"></el-input>
      </el-form-item>
      <el-form-item label="author" prop="author">
        <el-input v-model="form.author" placeholder="please enter author"></el-input>
      </el-form-item>
      <el-form-item label="publisher" prop="publisher">
        <el-input v-model="form.publisher" placeholder="please enter publisher"></el-input>
      </el-form-item>
      <el-form-item label="category" prop="category">
        <el-cascader
            :props="{value:'name', label:'name'}"
            v-model="form.categories"
            :options="categories"
           ></el-cascader>
      </el-form-item>
      <el-form-item label="book Number" prop="bookNo">
        <el-input v-model="form.bookNo" placeholder="please enter book Number"></el-input>
      </el-form-item>
      <el-form-item label="cover" prop="cover">
        <el-input v-model="form.cover" placeholder="please enter cover"></el-input>
      </el-form-item>


    </el-form>

<!--    submit button and cancel button -->
    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">Submit</el-button>

    </div>
  </div>


</template>


<script>
import request from "@/utils/request"

export default {
  name: "AddBook",
  data(){
    return{
      form:{},
      categories:[],
      rules: {
        name: [
          {required: true, message: 'please enter book name', trigger: 'blur'},
        ],
      }
      }
    },
  created() {
    request.get('/category/list').then(res=>{
      this.categories = res.data
    })
  },
  methods:{
    save(){
      this.form.toread = true
      this.form.rankscore = 1
      // this.form.readstatus = 'To Read'
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/book/save', this.form).then(res =>{
            console.log("form data: "+this.form)
            if (res.code === '200'){
              this.$notify.success('Add book Successfully !!!')
              this.$refs['ruleForm'].resetFields()
              this.$router.push("/bookList")
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