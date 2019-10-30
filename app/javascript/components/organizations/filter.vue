<template lang="pug">
  q-input(
    v-model="filter"
    debounce="500"
    label="Search")
</template>

<script>
  export default {
    computed: {
      filter: {
        get() {
          return this.$store.state.organization.filter
        },
        set(value) {
          this.$store.commit('updateFilter', value)
        }
      }
    }
  }
</script>
