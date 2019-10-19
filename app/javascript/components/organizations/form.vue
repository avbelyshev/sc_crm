<template lang="pug">
  .container
    h6 Create new organization
    q-form(@submit.prevent="onSubmit" class="q-gutter-md")
      .control
        q-input(outlined ref="name" v-model="organization.name" label="Name" stack-label
          lazy-rules :rules="rules.name")
      .control
        q-select(outlined ref="legal_form" v-model="organization.legal_form" :options="legal_forms" label="Legal form" stack-label
          lazy-rules :rules="rules.legal_form")
      .control
        q-input(outlined ref="inn" v-model="organization.inn" label="Inn" stack-label
          lazy-rules :rules="rules.inn")
      .control
        q-input(outlined ref="ogrn" v-model="organization.ogrn" label="Ogrn" stack-label
          lazy-rules :rules="rules.ogrn")
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
        rules: {
          name: [ val => val && val.length > 0 || 'Name must be filled'],
          legal_form: [ val => val && val.length > 0 || 'Legal form must be filled'],
          inn: [ val => isNaN(val) === false || 'Inn: there should be only numbers',
                 val => val.length === 10 || val.length === 12 || 'Inn: must be 10 or 12 characters' ],
          ogrn: [ val => isNaN(val) === false || 'Ogrn: there should be only numbers',
                  val => val.length === 13 || 'Ogrn: must be 13 characters' ]
        }
      }
    },
    created() {
      this.getLegalForms()
    },
    methods: {
      getLegalForms() {
        this.$backend.organizations.legal_forms()
          .then(response => { this.legal_forms = response.data })
      },
      clearErrors() {
        this.$refs.name.resetValidation()
        this.$refs.legal_form.resetValidation()
        this.$refs.inn.resetValidation()
        this.$refs.ogrn.resetValidation()
      },
      onSubmit() {
        this.clearErrors()
        this.$refs.name.validate()
        this.$refs.legal_form.validate()
        this.$refs.inn.validate()
        this.$refs.ogrn.validate()
        if (this.$refs.name.hasError || this.$refs.legal_form.hasError || this.$refs.inn.hasError || this.$refs.ogrn.hasError) {
          this.formHasError = true
        }
        else {
          this.$backend.organizations.create(this.organization)
            .then(response => {
              this.organization = {}
              this.clearErrors()
              this.$emit('new-organization', response.data)
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
