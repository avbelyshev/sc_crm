<template lang="pug">
  div.table
    h4 List of clients
    table
      thead
        tr
          th id
          th Full name
          th Email
          th Phone
      tbody
        tr(v-for="client in clients" :key="client.id")
          td {{ client.id }}
          td {{ client.fullname }}
          td {{ client.email }}
          td {{ client.phone }}
</template>

<script>
  export default {
    props: {
      clients: {
        type: Array,
        required: true
      }
    }
  }
</script>

<style lang="scss" scoped>
  th {
    border: 2px solid #000000;
  }
  td {
    border: .5px solid #000000;
  }
</style>
