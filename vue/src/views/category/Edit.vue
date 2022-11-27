<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Edit Category</div>
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
  name: "EditCategory",
  data(){
    return{
      form:{},
      rules: {
        name: [
          {required: true, message: 'please enter category name', trigger: 'blur'},
        ],
      }
    }
  },
  created() {
    const id = this.$route.query.id;
    request.get("/category/"+ id).then(res=>{
      this.form = res.data
    })
  },
  methods:{
    save(){
      request.put('/category/update', this.form).then(res =>{
        console.log("form data: "+this.form)
        if (res.code === '200'){
          this.$notify.success('Update category Successfully !!!')
          this.$router.push("/categoryList")// direct to admin list page
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