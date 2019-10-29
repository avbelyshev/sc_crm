<template lang="pug">
  .row
    .col-lg-8.q-pa-md
      div.flex.justify-center(v-if="loading")
        q-spinner-hourglass(color="primary" size="8em" :thickness="10")
      div(v-else)
        ClientsList(:clients="clients")
    q-separator(vertical)
    .col-lg-3.q-pa-md
      h6 Create new client
      ClientForm(@new-client="addNewClient")
    router-view(@update-client-row="updateClientRow")
</template>

<script>
  import ClientsList from './list.vue'
  import ClientForm from './form.vue'

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
        this.$backend.clients.index()
          .then(response => { this.clients = response.data })
          .finally(() => this.loading = false)
      },
      addNewClient(client) {
        this.clients.push(client)
      },
      updateClientRow(client) {
        let index = this.clients.findIndex(item => item.id == client.id)
        this.clients.splice(index, 1, client)
      }
    },
    components: {
      ClientsList,
      ClientForm
    }
  }
</script>
