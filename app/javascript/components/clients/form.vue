<template lang="pug">
  .container
    h6 Create new client
    q-form(@submit.prevent="onSubmit" class="q-gutter-md")
      .control
        q-input(outlined ref="fullname" v-model="client.fullname" label="Full name" stack-label
          lazy-rules :rules="rules.fullname")
      .control
        q-input(outlined ref="email" type="email" v-model="client.email" label="Email" stack-label
          lazy-rules :rules="rules.email")
      .control
        q-input(outlined ref="phone" v-model="client.phone" label="Phone" stack-label
          lazy-rules :rules="rules.phone")
      .control
        q-input(outlined ref="password" type="text" v-model="client.password" label="Password" stack-label
          lazy-rules :rules="rules.password")
      .action
        q-btn(type="submit") Add client
</template>

<script>
  let emailRegex = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,})$/

  export default {
    data: function () {
      return {
        client: {
          fullname: '',
          email: '',
          phone: '',
          password: ''
        },
        rules: {
          fullname: [ val => val && val.length >= 5 || 'Fullname: must be at least 5 characters'],
          email: [ val => emailRegex.test(String(val)) === true || 'Email: wrong format'],
          phone: [ val => isNaN(val) === false || 'Phone: there should be only numbers'],
          password: [val => val && val.length >= 8 || 'Password: must be at least 8 characters']
        }
      }
    },
    methods: {
      clearErrors() {
        this.$refs.fullname.resetValidation()
        this.$refs.email.resetValidation()
        this.$refs.phone.resetValidation()
        this.$refs.password.resetValidation()
      },
      onSubmit() {
        this.clearErrors()
        this.$refs.fullname.validate()
        this.$refs.email.validate()
        this.$refs.phone.validate()
        this.$refs.password.validate()
        if (this.$refs.fullname.hasError || this.$refs.email.hasError || this.$refs.phone.hasError || this.$refs.password.hasError) {
          this.formHasError = true
        }
        else {
          this.$backend.staffs.createClient(this.client)
            .then(response => {
              this.client = {}
              this.clearErrors()
              this.$emit('new-client', response.data)
            })
            .catch((error) => {
              let responseErrors = error.response.data
              Object.keys(responseErrors).forEach(key => {
                let fieldRef = this.$refs[key]
                fieldRef.innerError = true
                fieldRef.innerErrorMessage = responseErrors[key] })
              this.$forceUpdate()
            })
        }
      }
    }
  }
</script>
