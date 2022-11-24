<template>
  <div id="app">
<!--    Header-->
    <div style="height: 60px; line-height: 60px; background-color: white " >
      <img src="@/assets/logo.png" alt="logo" style="width: 40px; height: 40px; position:relative; top: 10px; left: 20px;">
      <span style="margin-left: 40px; font-size: 24px">My Book Library</span>
    </div>

<!--    left panel and main body -->
    <div style="display: flex">
<!--      left panel navigation-->
      <div style="width: 200px; min-height: calc(100vh - 62px);overflow: hidden; margin-right: 2px; background-color: white">
        <el-menu :default-active="$router.path" :default-openeds="['/']"  router class="el-menu-demo"  >
          <el-menu-item index="/">
            <i class="el-icon-collection"></i>
            <span>Main Page</span>
          </el-menu-item>
          <el-submenu index="/">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>Bookshelf1</span>
            </template>
            <el-menu-item index="about">Find</el-menu-item>
          </el-submenu>
          <el-submenu index="/">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>Bookshelf2</span>
            </template>
            <el-menu-item index="about">Find</el-menu-item>
          </el-submenu>
          <el-submenu index="/">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>Bookshelf3</span>
            </template>
            <el-menu-item index="about">Find</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>

<!--      main body-->
      <div style="flex:1; background-color: white; padding: 10px">
        <router-view/>
      </div>
    </div>


  </div>
</template>


