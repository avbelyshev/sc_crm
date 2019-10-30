import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

import organization from './modules/organization'

export default new Vuex.Store({
  state: {},
  mutations: {},
  actions: {},
  modules: {
    organization
  },
  plugins: [createPersistedState()]
})
