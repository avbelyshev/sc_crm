<template lang="pug">
  .row
    .col-lg-8.q-pa-md
      div.flex.justify-center(v-if="loading")
        q-spinner-hourglass(color="primary" size="8em" :thickness="10")
      div(v-else)
        StaffsList(:staffs="staffs")
    q-separator(vertical)
    .col-lg-3.q-pa-md
      h6 Create new staff
      StaffForm(@new-staff="addNewStaff")
    router-view(@update-staff-row="updateStaffRow")
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
      },
      updateStaffRow(staff) {
        let index = this.staffs.findIndex(item => item.id == staff.id)
        this.staffs.splice(index, 1, staff)
      }
    },
    components: {
      StaffsList,
      StaffForm
    }
  }
</script>
