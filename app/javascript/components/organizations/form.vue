<template lang="pug">
  .container
    h6 Create new organization
    q-form(@submit.prevent="onSubmit" class="q-gutter-md")
      .control
        q-input(outlined id="name" type="text" v-model="organization.name" label="Name" stack-label)
        span.error(v-if="isInvalidField('name')" ) {{ fieldError('name') }}
      .control
        q-select(outlined id="legal_form" type="email" v-model="organization.legal_form" :options="legal_forms" label="Legal form" stack-label)
        span.error(v-if="isInvalidField('legal_form')" ) {{ fieldError('legal_form') }}
      .control
        q-input(outlined id="inn" type="text" v-model="organization.inn" label="Inn" stack-label)
        span.error(v-if="isInvalidField('inn')" ) {{ fieldError('inn') }}
      .control
        q-input(outlined id="ogrn" type="text" v-model="organization.ogrn" label="Ogrn" stack-label)
        span.error(v-if="isInvalidField('ogrn')" ) {{ fieldError('ogrn') }}
      .action
        q-btn(type="submit") Add organization
</template>

<script>
  export default {
    data: function () {
      return {
        organization: {
          name: '',
          legal_form: '',
          inn: '',
          ogrn: ''
        },
        legal_forms: [],
        errors: {
          name: [],
          legal_form: [],
          inn: [],
          ogrn: []
        }
      }
    },
    created() {
      this.getLegalForms()
    },
    methods: {
      getLegalForms() {
        this.$backend.organizations.legal_forms()
          .then(response => {
            this.legal_forms = response.data
          })
      },
      checkName(name) {
        return name.length >= 5
      },
      checkLegalForm(legal_form) {
        return legal_form.length >= 0
      },
      checkInn(inn) {
        let regex = /^\d+$/
        return regex.test(String(inn))
      },
      checkOgrn(ogrn) {
        let regex = /^\d+$/
        return regex.test(String(ogrn))
      },
      clearErrors() {
        this.errors = {}
        this.errors.name = []
        this.errors.legal_form = []
        this.errors.inn = []
        this.errors.ogrn = []
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
        if (!this.checkName(this.organization.name)) { this.errors.name.push('Name: must be at least 5 characters') }
        if (!this.checkLegalForm(this.organization.legal_form)) { this.errors.legal_form.push('Legal form: must be filled') }
        if (!this.checkInn(this.organization.inn)) { this.errors.inn.push('Inn: there should be only numbers') }
        if (!this.checkOgrn(this.organization.ogrn)) { this.errors.ogrn.push('Ogrn: there should be only numbers') }
        if (!this.invalidParams()) {
          this.$backend.organizations.create(this.organization)
            .then(response => {
              this.organization = {}
              this.clearErrors()
              this.$emit('new-organization', response.data)
            })
            .catch((error) => {
              //console.log(error, error.response.data)
              let responseErrors = error.response.data
              Object.keys(responseErrors).forEach(key => { this.errors[key] = responseErrors[key] })
              this.$forceUpdate()
            })
        }
      }
    }
  }
</script>

<style lang="scss">
  span.error {
    font-size: 15px;
    color: red;
  }
</style>
