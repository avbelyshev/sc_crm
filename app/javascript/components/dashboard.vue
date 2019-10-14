<template lang="pug">
  div
    .loading(v-if="loading")
      q-spinner-hourglass.fixed-center(color="primary" size="8em" :thickness="10")
    div(class="q-pa-md")
      ClientsList(:clients="clients")
    div(class="q-pa-md" style="max-width: 400px")
      ClientForm(@new-client="addNewClient")
</template>

<script>
  import ClientsList from './clients/list.vue'
  import ClientForm from './clients/form.vue'

  export default {
    data() {
      return {
        loading: true,
        clients: []
      }
    },
    created() {
      this.fetchClients()
    },
    methods: {
      fetchClients() {
        this.$backend.staffs.clientsList()
          .then(response => {
            this.clients = response.data
          })
          .finally(() => this.loading = false)
      },
      addNewClient(client) {
        this.clients.push(client)
      }
    },
    components: {
      ClientsList,
      ClientForm
    }
  }
</script>

<style scoped lang="scss">

</style>
