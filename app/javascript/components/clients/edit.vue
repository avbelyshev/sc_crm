<template lang='pug'>
  q-dialog(:value="true" @hide="$router.go(-1)")
    q-card
      q-card-section.row.items-center.q-py-sm
        .text-h6 Edit client
        q-space
        q-btn(color="brown" icon="fas fa-times" flat round dense v-close-popup)
      q-card-section
        ClientForm(@update-client="updateClient" :id="id")
</template>

<script>
  import ClientForm from './form.vue'

  export default {
    components: {
      ClientForm,
    },
    computed: {
      id() {
        return this.$route.params.id
      }
    },
    methods: {
      updateClient(client) {
        this.$router.go(-1)
        this.$emit('update-client-row', client)
      }
    }
  }
</script>

<style scoped lang="scss">
  .q-card {
    width: 600px;
  }
</style>
