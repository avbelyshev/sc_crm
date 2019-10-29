<template lang='pug'>
  q-dialog(:value="true" @hide="$router.go(-1)")
    q-card
      q-card-section.row.items-center.q-py-sm
        .text-h6 Edit organization
        q-space
        q-btn(color="brown" icon="fas fa-times" flat round dense v-close-popup)
      q-card-section
        OrganizationForm(@update-organization="updateOrganization" :id="id")
</template>

<script>
  import OrganizationForm from './form.vue'

  export default {
    components: {
      OrganizationForm,
    },
    computed: {
      id() {
        return this.$route.params.id
      }
    },
    methods: {
      updateOrganization(organization) {
        this.$router.go(-1)
        this.$emit('update-organization-row', organization)
      }
    }
  }
</script>

<style scoped lang="scss">
  .q-card {
    width: 600px;
  }
</style>
