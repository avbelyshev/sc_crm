<template lang="pug">
  #app
    navbar(:user="user")
    p {{ message }}
</template>

<script>
  import { backend } from 'api/index.js'
  import Navbar from 'components/navbar.vue'

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
        backend.user('/staffs/user')
          .then(response => {
            this.user = response.data.user
          })
          .catch(error => {
            console.log(error)
          })
      }
    },
    components: {
      Navbar
    }
  }
</script>

<style scoped lang="scss">
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
