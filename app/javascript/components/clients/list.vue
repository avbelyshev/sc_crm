<template lang="pug">
  q-table(dense title="List of clients" :data="clients" :columns="columns" row-key="name" :pagination.sync="pagination")
</template>

<script>
  export default {
    props: {
      clients: {
        type: Array,
        required: true
      }
    },
    data () {
      return {
        pagination: {
          page: 1,
          rowsPerPage: 15,
        },
        columns: [
          { name: 'id', label: 'id', field: 'id', align: 'left' },
          { name: 'fullname', label: 'Full name', field: 'fullname', align: 'left' },
          { name: 'email', label: 'Email', field: 'email', align: 'left' },
          { name: 'phone', label: 'Phone', field: 'phone', align: 'left' }
        ]
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
