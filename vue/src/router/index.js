import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AddUser from "../views/user/AddUser.vue";
import User from "../views/user/User.vue";
import EditUser from "@/views/user/EditUser";


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
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
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
