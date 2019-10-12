<template lang="pug">
  .container
    h4 Create new client
    form(@submit.prevent="onSubmit")
      .control
        label(for="fullname") Full name
        input(id="fullname" type="text" v-model="client.fullname")
        span.error(v-if="isInvalidField('fullname')" ) {{ fieldError('fullname') }}
      .control
        label(for="email") Email
        input(id="email" type="email" v-model="client.email")
        span.error(v-if="isInvalidField('email')" ) {{ fieldError('email') }}
      .control
        label(for="phone") Phone
        input(id="phone" type="text" v-model="client.phone")
        span.error(v-if="isInvalidField('phone')" ) {{ fieldError('phone') }}
      .control
        label(for="password") Password
        input(id="password" type="text" v-model="client.password")
        span.error(v-if="isInvalidField('password')" ) {{ fieldError('password') }}
      .action
        button(type="submit") Add client
</template>

<script>
  import { backend } from '../../api/index.js'

  export default {
    data: function () {
      return {
        client: {
          fullname: '',
          email: '',
          phone: '',
          password: ''
        },
        errors: {
          fullname: [],
          email: [],
          phone: [],
          password: []
        }
      }
    },
    methods: {
      checkFullname(fullname) {
        return fullname.length >= 5
      },
      checkEmail(email) {
        let regex = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,})$/
        return regex.test(String(email))
      },
      checkPhone(phone) {
        let regex = /^\d+$/
        return regex.test(String(phone))
      },
      checkPassword(password) {
        return password.length >= 8
      },
      clearErrors() {
        this.errors = {}
        this.errors.fullname = []
        this.errors.email = []
        this.errors.phone = []
        this.errors.password = []
      },
      invalidParams() {
        let errorsCount = 0
        Object.keys(this.errors).forEach(key => { errorsCount = errorsCount + this.errors[key].length })
        return errorsCount > 0
      },
      isInvalidField(name) {
        return this.errors[name].length > 0
      },
      fieldError(name) {
        return this.errors[name][0]
      },
      onSubmit() {
        this.clearErrors()
        if (!this.checkFullname(this.client.fullname)) { this.errors.fullname.push('Fullname: must be at least 5 characters') }
        if (!this.checkEmail(this.client.email)) { this.errors.email.push('Email: wrong format') }
        if (!this.checkPhone(this.client.phone)) { this.errors.phone.push('Phone: there should be only numbers') }
        if (!this.checkPassword(this.client.password)) { this.errors.password.push('Password: must be at least 8 characters') }
        if (!this.invalidParams()) {
          backend.staffs.createClient(this.client)
            .then(response => {
              this.client = {}
              this.clearErrors()
              this.$emit('new-client', response.data)
            })
            .catch((error) => {
              console.log(error, error.response.data)
            })
        }
      }
    }
  }
</script>

<style lang="scss">
  input {
    display: block;
    padding: 5px;
    margin: 5px;
    font-size: 20px;
  }
  button {
    padding: 10px;
    font-size: 20px;
  }
  span.error {
    font-size: 15px;
    color: red;
  }
</style>
