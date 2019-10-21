<template lang="pug">
  q-table(
    dense
    title="List of organizations"
    :data="organizations"
    :columns="columns"
    row-key="id"
    :pagination.sync="pagination"
    separator="cell")
    template(slot="body-cell-action" slot-scope="props" :props="props")
      q-td(:props="props")
        q-btn(outline color="negative" icon="fas fa-times" @click="onDelete(props.row)")
</template>

<script>
  export default {
    props: {
      organizations: {
        type: Array,
        required: true
      }
    },
    data () {
      return {
        columns: [
          { name: 'id', label: 'id', field: 'id', align: 'left' },
          { name: 'name', label: 'Name', field: 'name', align: 'left' },
          { name: 'legal_form', label: 'Legal form', field: 'legal_form', align: 'left' },
          { name: 'inn', label: 'Inn', field: 'inn', align: 'left' },
          { name: 'ogrn', label: 'Ogrn', field: 'ogrn', align: 'left' },
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
        this.$backend.organizations.destroy(row.id)
          .then(() => {
            this.organizations.splice(row.__index, 1)
          })
          .catch(error => {
            console.log(error)
          })
        }
    }
  }
</script>

<style lang="scss" scoped>

</style>
