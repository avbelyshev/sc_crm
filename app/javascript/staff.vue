<template lang="pug">
  #app
    navbar(:user="user")
    dashboard
</template>

<script>
  import Navbar from 'components/navbar.vue'
  import Dashboard from 'components/dashboard.vue'

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
        this.$backend.staffs.user()
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

</style>
