<template>
  <div>

    <!--    search panel-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="Please enter username" v-model="params.username"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="Please enter phone"
                v-model="params.phone"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="Please enter email"
                v-model="params.email"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset
      </el-button>

    </div>


    <el-table :data="tableData" stripe>
      <el-table-column prop="id" label="id" width="80"></el-table-column>
      <el-table-column prop="username" label="username"></el-table-column>
      <el-table-column prop="phone" label="phone"></el-table-column>
      <el-table-column prop="email" label="email"></el-table-column>
      <el-table-column prop="createtime" label="createtime"></el-table-column>
      <el-table-column prop="updatetime" label="updatetime"></el-table-column>

      <el-table-column label="Status">
        <template v-slot="scope">
          <el-switch
              v-model="scope.row.status"
              @change="changeStatus(scope.row)"
              active-color="#13ce66"
              inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>

      <el-table-column label="Edit" width="230">
        <template v-slot="scope">
          <!--  scope.row is current row data-->
          <el-button type="primary" @click="$router.push('/editAdmin?id='+scope.row.id)">Edit</el-button>

          <el-popconfirm
              style="margin-left: 10px"
              title="Are you sure you want to Delete ?"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">Delete</el-button>
          </el-popconfirm>

          <el-button style="margin-left: 5px" type="warning" @click="handleChangePassword(scope.row)">Reset</el-button>

        </template>
      </el-table-column>


    </el-table>

    <!--    Pagination-->
    <div style="margin-top: 20px">
      <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          layout="prev, pager, next"
          @current-change="handleCurrentChange"
          :total="total">
        <!--        :total="tableData.length">-->
      </el-pagination>
    </div>

    <el-dialog title="Reset Password" :visible.sync="dialogFormVisible" width="40%">
      <el-form :model="form" label-width="150px" ref="formRef" :rules="rules">
        <el-form-item label="New Password" prop="newPassword">
          <el-input v-model="form.newPassword" autocomplete="off" show-password></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="savePass">Confirm</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>

import request from "@/utils/request";
import Cookies from "js-cookie";

export default {
  name: 'AdminList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      form: {},
      dialogFormVisible: false,
      params: {
        pageNum: 1,
        pageSize: 10,
        username: '',
        phone: '',
        email: ''
      },
      rules: {
        newPassword: [
          {required: true, message: 'please enter new password', trigger: 'blur'},
          {min: 3, max: 10, message: ' 3 to 10 characters or numbers', trigger: 'blur'}
        ],
      }

    }
  },
  created() {
    this.load()
  },
  methods: {
    changeStatus(row) {
      // cannot change current admin status
      if (this.admin.id === row.id && !row.status){
        row.status = true
        this.$notify.warning('You cannot change current admin status !!!')
        return
      }
      request.put('/admin/update', row).then(res => {
        console.log("row data: " + row)
        if (res.code === '200') {
          this.$notify.success('Update status successfully')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    load() {
      request.get('/admin/page', {
        params: this.params
      }).then(res => {
        if (res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },
    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        username: '',
        phone: '',
        email: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      // click page number button
      console.log(pageNum)
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/admin/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("Delete admin successfully")
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    handleChangePassword(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    savePass() {
      this.$refs['formRef'].validate((valid) => {
        if (valid) {
          request.put('/admin/password', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success("new Password save successfully")
              if (this.form.id === this.admin.id) {// edit password for current user id  redirect to login page
                Cookies.remove('admin')
                this.$router.push('/login')
              } else {
                this.load()
                this.dialogFormVisible = false;
              }
            } else {
              this.$notify.error("reset password fail")
            }
          })
        }
      })
    }
  }
}
</script>

<style scoped>

</style>