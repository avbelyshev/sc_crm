import Vue from 'vue'
import VueRouter from 'vue-router'

const Clients = () => import('../components/clients/view.vue')
const Organizations = () => import('../components/organizations/view.vue')

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/', redirect: '/staffs' },
    { name: 'Clients', path: '/clients', component: Clients },
    { name: 'Organizations', path: '/organizations', component: Organizations }
  ]
})
