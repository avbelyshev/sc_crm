<template lang="pug">
  #app
    q-layout(view='hHh Lpr fFf' class="bg-grey-1")
      navbar(:user="user")
      q-page-container
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
          .then(response => { this.user = response.data.user })
          .catch(error => { console.log(error) })
      }
    },
    components: {
      Navbar
    }
  }
</script>

<style scoped lang="scss">

</style>
