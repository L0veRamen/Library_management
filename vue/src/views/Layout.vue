<template>
  <div>
    <!--    Header-->
    <div style="height: 60px; line-height: 60px; background-color: white; margin-bottom: 2px; display: flex ">
      <div style="width: 300px">
        <img src="@/assets/logo.png" alt="logo"
             style="width: 40px; height: 40px; position:relative; top: 10px; left: 20px;">
        <span style="margin-left: 40px; font-size: 24px">My Book Library</span>
      </div>
      <div style="flex:1; text-align: right; padding-right: 20px">
        <el-dropdown size="medium">
              <span class="el-dropdown-link" style="cursor: pointer">
                  {{admin.username}}<i class="el-icon-arrow-down el-icon--right"></i>
              </span>
          <el-dropdown-menu slot="dropdown" style="margin-top: -5px">
            <el-dropdown-item>
              <div style="width: 50px; text-align: center;" @click="logout">Exit</div>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>

      </div>
    </div>

    <!--    left panel and main body -->
    <div style="display: flex">
      <!--      left panel navigation-->
      <div
          style="width: 200px; min-height: calc(100vh - 62px);overflow: hidden; margin-right: 2px; background-color: white">
        <el-menu :default-active="$route.path" router class="el-menu-demo">
          <el-menu-item index="/">
            <i class="el-icon-collection"></i>
            <span>Main Page</span>
          </el-menu-item>
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>User</span>
            </template>
            <el-menu-item index="/addUser">User Add</el-menu-item>
            <el-menu-item index="/userList">User List</el-menu-item>
          </el-submenu>
          <el-submenu index="admin">
            <template slot="title">
              <i class="el-icon-s-custom"></i>
              <span>Admin</span>
            </template>
            <el-menu-item index="/addAdmin">Admin Add</el-menu-item>
            <el-menu-item index="/adminList">Admin List</el-menu-item>
          </el-submenu>
          <el-submenu index="category">
            <template slot="title">
              <i class="el-icon-document"></i>
              <span>Category</span>
            </template>
            <el-menu-item index="/addCategory">Add Category</el-menu-item>
            <el-menu-item index="/categoryList">Category List</el-menu-item>
          </el-submenu>
          <el-submenu index="book">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>Book</span>
            </template>
            <el-menu-item index="/addBook">Add Book</el-menu-item>
            <el-menu-item index="/bookList">Book List</el-menu-item>
          </el-submenu>

        </el-menu>
      </div>

      <!--      main body-->
      <div style="flex:1; background-color: white; padding: 10px">
        <!--      open children router-->
        <router-view/>
      </div>
    </div>
  </div>


</template>

<script>
import Cookies from 'js-cookie'

export default {
  name: "Layout",
  data(){
    return{
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
    }
  },
  methods: {
    logout() {
      // clear browser user data
      Cookies.remove('admin')
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>

</style>