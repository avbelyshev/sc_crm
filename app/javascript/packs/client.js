import Vue from 'vue'
import App from '../client.vue'
import { backend } from '../api/index.js'

import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'

import '../assets/styles/quasar.styl'
import 'quasar/dist/quasar.ie.polyfills'

import {
  Quasar,
  QLayout,
  QHeader,
  QDrawer,
  QPageContainer,
  QPage,
  QToolbar,
  QToolbarTitle,
  QBtn,
  QSpace,
  QTable,
  QForm,
  QInput
} from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: {
    QLayout,
    QHeader,
    QDrawer,
    QPageContainer,
    QPage,
    QToolbar,
    QToolbarTitle,
    QBtn,
    QSpace,
    QTable,
    QForm,
    QInput
  },
  directives: {
  },
  iconSet: iconSet,
  plugins: {
  }
})

Vue.prototype.$backend = backend

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
