<template lang="pug">
  q-table(
    dense
    title="List of staffs"
    :data="staffs"
    :columns="columns"
    row-key="name"
    :pagination.sync="pagination"
    separator="cell")
    template(slot="body-cell-action" slot-scope="props" :props="props")
      q-td(:props="props")
        q-btn(outline color="info" icon="fas fa-marker" :to="{ name: 'StaffEdit', params: { id: props.row.id } }")
        q-btn(outline color="negative" icon="fas fa-times" @click="onDelete(props.row)")
</template>

<script>
  export default {
    props: {
      staffs: {
        type: Array,
        required: true
      }
    },
    data () {
      return {
        columns: [
          { name: 'id', label: 'id', field: 'id', align: 'left' },
          { name: 'fullname', label: 'Full name', field: 'fullname', align: 'left' },
          { name: 'email', label: 'Email', field: 'email', align: 'left' },
          { name: 'phone', label: 'Phone', field: 'phone', align: 'left' },
          { name: 'action', label: 'Action', align: 'center' }
        ],
        pagination: {
          page: 1,
          rowsPerPage: 15,
        }
      }
    },
    methods: {
      onDelete(row) {
        if (!confirm('You definitely want to delete the entry?')) { return }
        this.$backend.staffs.destroy(row.id)
          .then(() => { this.staffs.splice(row.__index, 1) })
          .catch(error => { console.log(error) })
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
