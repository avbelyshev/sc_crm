import Vue from 'vue'
import VueRouter from 'vue-router'

const Staffs = () => import('../components/staffs/view.vue')
const Clients = () => import('../components/clients/view.vue')
const Organizations = () => import('../components/organizations/view.vue')

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/', redirect: '/staffs' },
    {
      name: 'Staffs', path: '/staffs', component: Staffs,
      children: [
        {
          name: 'StaffEdit',
          path: '/staffs/:id/edit',
          component: () => import('../components/staffs/edit.vue')
        }
      ]
    },
    {
      name: 'Clients', path: '/clients', component: Clients,
      children: [
        {
          name: 'ClientEdit',
          path: '/clients/:id/edit',
          component: () => import('../components/clients/edit.vue')
        }
      ]
    },
    {
      name: 'Organizations', path: '/organizations', component: Organizations,
      children: [
        {
          name: 'OrganizationEdit',
          path: '/organizations/:id/edit',
          component: () => import('../components/organizations/edit.vue')
        }
      ]
    }
  ]
})
