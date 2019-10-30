<template lang="pug">
  .row
    .col-lg-8.q-pa-md
      div.flex.justify-center(v-if="loading")
        q-spinner-hourglass(color="primary" size="8em" :thickness="10")
      div(v-else)
        OrganizationsFilter
        OrganizationsList(:organizations="organizations")
    q-separator(vertical)
    .col-lg-3.q-pa-md
      h6 Create new organization
      OrganizationForm(@new-organization="addNewOrganization")
    router-view(@update-organization-row="updateOrganizationRow")
</template>

<script>
  import OrganizationsFilter from './filter.vue'
  import OrganizationsList from './list.vue'
  import OrganizationForm from './form.vue'

  export default {
    data() {
      return {
        loading: true,
        organizations: []
      }
    },
    created() {
      this.fetchOrganizations()
    },
    computed: {
      filter() {
        return this.$store.state.organization.filter
      }
    },
    watch: {
      filter() {
        this.fetchOrganizations()
      }
    },
    methods: {
      fetchOrganizations() {
        let filter = ''
        if (this.filter) {filter = '?filter=' + this.filter }
        this.$backend.organizations.index(filter)
          .then(response => { this.organizations = response.data })
          .finally(() => this.loading = false)
      },
      addNewOrganization(organization) {
        this.organizations.push(organization)
      },
      updateOrganizationRow(organization) {
        let index = this.organizations.findIndex(item => item.id == organization.id)
        this.organizations.splice(index, 1, organization)
      }
    },
    components: {
      OrganizationsFilter,
      OrganizationsList,
      OrganizationForm
    }
  }
</script>
