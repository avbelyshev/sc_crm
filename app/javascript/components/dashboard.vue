<template lang="pug">
  div
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
