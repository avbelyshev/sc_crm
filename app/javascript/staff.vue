<template lang="pug">
  #app
    q-layout(view='hHh Lpr fFf' class="bg-grey-1")
      navbar(:user="user")
      //q-tabs(v-model="tab" class="text-white shadow-2")
        q-tab(name="clients" label="Clients")
        q-tab(name="organizations" label="Organizations")
      q-page-container
        dashboard
</template>

<script>
  import Navbar from 'components/navbar.vue'
  import Dashboard from 'components/dashboard.vue'

  export default {
    data: function () {
      return {
        user: {},
        tab: 'clients'
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
