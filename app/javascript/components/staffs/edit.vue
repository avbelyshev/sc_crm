<template lang='pug'>
  q-dialog(:value="true" @hide="$router.go(-1)")
    q-card
      q-card-section.row.items-center.q-py-sm
        .text-h6 Edit staff
        q-space
        q-btn(color="brown" icon="fas fa-times" flat round dense v-close-popup)
      q-card-section
        StaffForm(@update-staff="updateStaff" :id="id")
</template>

<script>
  import StaffForm from './form.vue'

  export default {
    components: {
      StaffForm,
    },
    computed: {
      id() {
        return this.$route.params.id
      }
    },
    methods: {
      updateStaff(staff) {
        this.$router.go(-1)
        this.$emit('update-staff-row', staff)
      }
    }
  }
</script>

<style scoped lang="scss">
  .q-card {
    width: 600px;
  }
</style>
