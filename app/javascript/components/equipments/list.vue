<template lang="pug">
  q-table(
    dense
    title="List of equipments"
    :data="equipments"
    :columns="columns"
    row-key="id"
    :pagination.sync="pagination"
    separator="cell")
    template(slot="body-cell-action" slot-scope="props" :props="props")
      q-td(:props="props")
        q-btn(outline color="info" icon="fas fa-marker" :to="{ name: 'EquipmentEdit', params: { id: props.row.id } }")
        q-btn(outline color="negative" icon="fas fa-times" @click="onDelete(props.row)")
</template>

<script>
  export default {
    props: {
      equipments: {
        type: Array,
        required: true
      }
    },
    data () {
      return {
        columns: [
          { name: 'id', label: 'id', field: 'id', align: 'left' },
          { name: 'name', label: 'Name', field: 'name', align: 'left' },
          { name: 'kind', label: 'Kind', field: 'kind', align: 'left' },
          { name: 'serial_number', label: 'Serial number', field: 'serial_number', align: 'left' },
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
        this.$backend.equipments.destroy(row.id)
          .then(() => { this.equipments.splice(row.__index, 1) })
          .catch(error => { console.log(error) })
        }
    }
  }
</script>

<style lang="scss" scoped>

</style>
