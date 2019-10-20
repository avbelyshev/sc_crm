<template lang="pug">
  q-header(elevated class="text-white")
    q-toolbar(class="q-py-sm q-px-md")
      q-btn(dense flat no-caps type="a" href="/")
        img(:src="require('images/logo.png')")
      q-toolbar-title(shrink class="text-weight-bold") Service center CRM
      q-space
      q-toolbar-title(shrink class="text-weight-light") {{ user.email }}
      q-btn(dense flat no-caps class="bg-negative" type="a" label="Sign out" :href="user.sign_out_link" data-method="delete")
</template>

<script>
  export default {
    props: ['user']
  }
</script>

<style scoped lang="scss">

</style>
