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
import Cookies from "js-cookie";

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
      {path: 'userList', name: 'UserList', component: User},
      {path: 'addUser', name: 'AddUser', component: AddUser},
      {path: 'editUser', name: 'EditUser', component: EditUser},

      // ======== Admin ===========
      {path: 'adminList', name: 'AdminList', component: List},
      {path: 'addAdmin', name: 'AddAdmin', component: Add},
      {path: 'editAdmin', name: 'EditAdmin', component: Edit},

      // ======== Category ===========
      {path: 'categoryList', name: 'CategoryList', component: ()=> import('@/views/category/List.vue')},
      {path: 'addCategory', name: 'AddCategory', component: ()=> import('@/views/category/Add.vue')},
      {path: 'editCategory', name: 'EditCategory', component: ()=> import('@/views/category/Edit.vue')},

      // ======== Book ===========
      {path: 'bookList', name: 'BookList', component: ()=> import('@/views/book/List.vue')},
      {path: 'addBook', name: 'AddBook', component: ()=> import('@/views/book/Add.vue')},
      {path: 'editBook', name: 'EditBook', component: ()=> import('@/views/book/Edit.vue')},
    ]
  },

    // ===== 404 =====
  {
    path: '*',
    component: ()=> import('@/views/404')
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to,from,next)=>{
  if (to.path === '/login') next()
  const admin = Cookies.get('admin')
  if (!admin && to.path !== '/login') return next('/login') //back to login page
  // visit /home, cookies has admin data, then go to page
  next()
})

export default router
