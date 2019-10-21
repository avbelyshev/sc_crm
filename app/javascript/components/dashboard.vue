<template lang="pug">
  q-drawer(show-if-above :width="200" :breakpoint="500" bordered content-class="bg-grey-3")
    q-scroll-area.fit
      q-list(padding class="text-primary")
        q-item(clickable :to="{ name: 'Clients' }")
          q-item-section Clients
        q-item(clickable :to="{ name: 'Organizations' }")
          q-item-section Organizations
</template>

<script>

</script>

<style scoped lang="scss">

</style>
