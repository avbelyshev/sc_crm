import Vue from 'vue'
import App from '../staff.vue'
import { backend } from '../api/index.js'
import '../quasar/index.js'
import router from '../router/index.js'
import store from '../store/index'
import '../sockets/index'

Vue.prototype.$backend = backend

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
    router,
    store
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
