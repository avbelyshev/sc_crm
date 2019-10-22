<template lang="pug">
  .row
    .col-lg-8.q-pa-md
      div.flex.justify-center(v-if="loading")
        q-spinner-hourglass(color="primary" size="8em" :thickness="10")
      div(v-else)
        StaffsList(:staffs="staffs")
      q-separator(vertical)
    .col-lg-3.q-pa-md
      StaffForm(@new-staff="addNewStaff")
</template>

<script>
  import StaffsList from './list.vue'
  import StaffForm from './form.vue'

  export default {
    data() {
      return {
        loading: true,
        staffs: []
      }
    },
    created() {
      this.fetchStaffs()
    },
    methods: {
      fetchStaffs() {
        this.$backend.staffs.index()
          .then(response => { this.staffs = response.data })
          .finally(() => this.loading = false)
      },
      addNewStaff(staff) {
        this.staffs.push(staff)
      }
    },
    components: {
      StaffsList,
      StaffForm
    }
  }
</script>
