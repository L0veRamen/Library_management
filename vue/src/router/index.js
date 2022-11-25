import Vue from 'vue'
import VueRouter from 'vue-router'
import AddUser from "../views/user/AddUser.vue";
import User from "../views/user/User.vue";
import EditUser from "@/views/user/EditUser";
import List from "@/views/admin/List";
import Edit from "@/views/admin/Edit";
import Add from "@/views/admin/Add";
import Login from "@/views/login/Login";
import Layout from "@/views/Layout";
import Home from "@/views/home/HomeView"

Vue.use(VueRouter)

const routes = [

    // ===== login =====
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
    // ====== home page ======
  {
    path: '/',
    name: 'Layout',
    component: Layout,
    redirect:'/home',
    children:[
      {
        path: 'home',
        name: 'Home',
        component: Home
      },
      // ======== User ===========
      {
        path: 'userList',
        name: 'UserList',
        component: User
      },
      {
        path: 'addUser',
        name: 'AddUser',
        component: AddUser
      },
      {
        path: 'editUser',
        name: 'EditUser',
        component: EditUser
      },
      // ======== Admin ===========
      {
        path: 'adminList',
        name: 'AdminList',
        component: List
      },
      {
        path: 'addAdmin',
        name: 'AddAdmin',
        component: Add
      },
      {
        path: 'editAdmin',
        name: 'EditAdmin',
        component: Edit
      },
    ]
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
