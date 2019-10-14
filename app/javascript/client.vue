<template lang="pug">
  #app
    navbar(:user="user")
</template>

<script>
  import Navbar from 'components/navbar.vue'

  export default {
    data: function () {
      return {
        user: {}
      }
    },
    created() {
      this.fetchUser()
    },
    methods: {
      fetchUser() {
        this.$backend.clients.user()
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

</style>
