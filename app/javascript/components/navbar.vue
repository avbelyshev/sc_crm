<template lang="pug">
  nav
    ul
      li
        a(href="/")
          img(src="../../assets/images/logo.png")
      li
        span {{ user.email }}
      li
        a(:href="user.sign_out_link", data-method="delete") Sign out
</template>

<script>
  export default {
    props: ['user']
  }
</script>

<style scoped lang="scss">
  nav {
    font-size: 25px;
    background-color: #fff;
    padding: 0px;
    margin: 0px;
  }
  ul li {
    display:inline-block;
    margin-left: 15px;
  }
</style>
