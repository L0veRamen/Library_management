import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css';
import router from './router'
import '@/assets/global.css'

Vue.config.productionTip = false
Vue.use(ElementUI,{size:'small', locale});// medium, small, mini
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
