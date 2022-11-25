import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AddUser from "../views/user/AddUser.vue";
import User from "../views/user/User.vue";
import EditUser from "@/views/user/EditUser";
import List from "@/views/admin/List";
import Edit from "@/views/admin/Edit";
import Add from "@/views/admin/Add";


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
    // ======== User ===========
  {
    path: '/user',
    name: 'User',
    component: User
  },
  {
    path: '/addUser',
    name: 'AddUser',
    component: AddUser
  },
  {
    path: '/editUser',
    name: 'EditUser',
    component: EditUser
  },
  // ======== User ===========
  {
    path: '/admin',
    name: 'Admin',
    component: List
  },
  {
    path: '/addAdmin',
    name: 'AddAdmin',
    component: Add
  },
  {
    path: '/editAdmin',
    name: 'EditAdmin',
    component: Edit
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
