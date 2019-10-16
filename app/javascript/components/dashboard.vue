<template lang="pug">
  div
    .loading(v-if="loading")
      q-spinner-hourglass.fixed-center(color="primary" size="8em" :thickness="10")
    div(class="q-pa-md")
      //ClientsList(:clients="clients")
      OrganizationsList(:organizations="organizations")
    div(class="q-pa-md" style="max-width: 400px")
      //ClientForm(@new-client="addNewClient")
      OrganizationForm(@new-organization="addNewOrganization")
</template>

<script>
  import ClientsList from './clients/list.vue'
  import ClientForm from './clients/form.vue'
  import OrganizationsList from './organizations/list.vue'
  import OrganizationForm from './organizations/form.vue'

  export default {
    data() {
      return {
        loading: true,
        clients: [],
        organizations: []
      }
    },
    created() {
      //this.fetchClients()
      this.fetchOrganizations()
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
      },
      fetchOrganizations() {
        this.$backend.organizations.index()
          .then(response => {
            this.organizations = response.data
          })
          .finally(() => this.loading = false)
      },
      addNewOrganization(organization) {
        this.organizations.push(organization)
      }
    },
    components: {
      ClientsList,
      ClientForm,
      OrganizationsList,
      OrganizationForm
    }
  }
</script>

<style scoped lang="scss">

</style>
