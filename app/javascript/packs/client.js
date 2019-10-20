import Vue from 'vue'
import App from '../client.vue'
import { backend } from '../api/index.js'
import Quasar from '../quasar/index.js'

Vue.prototype.$backend = backend

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
