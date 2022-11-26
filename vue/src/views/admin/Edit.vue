<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Edit Admin</div>
    <el-form :inline="true" :model="form" label-width="100px" >
      <el-form-item label="UserName">
        <el-input v-model="form.username" placeholder="please enter username"></el-input>
      </el-form-item>
      <el-form-item label="Email">
        <el-input v-model="form.email" placeholder="please enter email"></el-input>
      </el-form-item>
      <el-form-item label="Phone">
        <el-input v-model="form.phone" placeholder="please enter phone"></el-input>
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
  name: "EditAdmin",
  data(){
    return{
      form:{}
    }
  },
  created() {
    const id = this.$route.query.id;
    request.get("/admin/"+ id).then(res=>{
      this.form = res.data
    })
  },
  methods:{
    save(){
      request.put('/admin/update', this.form).then(res =>{
        console.log("form data: "+this.form)
        if (res.code === '200'){
          this.$notify.success('Update Admin Successfully !!!')
          this.$router.push("/adminList")// direct to admin list page
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