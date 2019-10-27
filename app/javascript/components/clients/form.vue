<template lang="pug">
  .container
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
      .control(v-if="viewPassword")
        q-input(outlined ref="password" type="text" v-model="client.password" label="Password" stack-label
          lazy-rules :rules="rules.password")
      .action
        q-btn(type="submit") {{ id ? "Edit client" : "Add client" }}
        q-btn(v-if="id" @click="passwordVisible") Password
</template>

<script>
  let emailRegex = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,})$/

  export default {
    props: {
      id: {
        type: Number
      }
    },
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
        },
        viewPassword: false
      }
    },
    created() {
      if (!this.id) { this.viewPassword = true }
      this.fillFormFields(this.id)
    },
    methods: {
      passwordVisible() {
        if (this.viewPassword) { this.viewPassword = false }
        else { this.viewPassword = true }
      },
      fetchClient(id) {
        this.$backend.clients.edit(id)
          .then(response => { this.client = response.data })
      },
      fillFormFields(id) {
        if (!id) { return }
        this.fetchClient(this.id)
      },
      clearErrors() {
        this.$refs.fullname.resetValidation()
        this.$refs.email.resetValidation()
        this.$refs.phone.resetValidation()
        if (this.viewPassword) { this.$refs.password.resetValidation() }
      },
      onSubmit() {
        this.clearErrors()
        this.$refs.fullname.validate()
        this.$refs.email.validate()
        this.$refs.phone.validate()
        let passwordError = false
        if (this.viewPassword) {
          this.$refs.password.validate()
          passwordError = this.$refs.password.hasError
        }
        if (this.$refs.fullname.hasError || this.$refs.email.hasError || this.$refs.phone.hasError || passwordError) {
          this.formHasError = true
        }
        else {
          if (this.id) { this.updateClient() }
          else { this.createClient() }
        }
      },
      createClient() {
        this.$backend.clients.create(this.client)
          .then(response => {
            this.client = {}
            this.clearErrors()
            this.$emit('new-client', response.data)
          })
          .catch((error) => {
            this.fillBackendErrors(error.response.data)
            this.$forceUpdate()
          })
      },
      updateClient() {
        this.$backend.clients.update(this.id, this.client)
          .then(response => {
            this.client = {}
            this.clearErrors()
            this.$emit('update-client', response.data)
          })
          .catch((error) => {
            this.fillBackendErrors(error.response.data)
            this.$forceUpdate()
          })
      },
      fillBackendErrors(responseErrors) {
        Object.keys(responseErrors).forEach(key => {
          let fieldRef = this.$refs[key]
          fieldRef.innerError = true
          fieldRef.innerErrorMessage = responseErrors[key]
        })
      }
    }
  }
</script>
