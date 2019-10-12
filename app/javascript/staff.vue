<template lang="pug">
  #app
    navbar(:user="user")
    p {{ message }}
    dashboard
</template>

<script>
  import { backend } from 'api/index.js'
  import Navbar from 'components/navbar.vue'
  import Dashboard from 'components/dashboard.vue'

  export default {
    data: function () {
      return {
        user: {},
        message: "Hello Staff!"
      }
    },
    created() {
      this.fetchUser()
    },
    methods: {
      fetchUser() {
        backend.staffs.user()
          .then(response => {
            this.user = response.data.user
          })
          .catch(error => {
            console.log(error)
          })
      }
    },
    components: {
      Navbar,
      Dashboard
    }
  }
</script>

<style scoped lang="scss">
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
