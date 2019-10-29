<template lang="pug">
  .container
    q-form(ref="organizationForm" @submit.prevent="onSubmit" class="q-gutter-md")
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
        q-btn(type="submit") {{ id ? "Edit organization" : "Add organization" }}
</template>

<script>
  export default {
    props: {
      id: {
        type: Number
      }
    },
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
      this.fillFormFields(this.id)
    },
    methods: {
      getLegalForms() {
        this.$backend.organizations.legal_forms()
          .then(response => { this.legal_forms = response.data })
      },
      fetchOrganization(id) {
        this.$backend.organizations.edit(id)
          .then(response => { this.organization = response.data })
      },
      fillFormFields(id) {
        if (!id) { return }
        this.fetchOrganization(this.id)
      },
      onSubmit() {
        this.$refs.organizationForm.resetValidation()
        this.$refs.organizationForm.validate().then(success => {
          if (success) {
            if (this.id) { this.updateOrganization() }
            else { this.createOrganization() }
          }
        })
      },
      createOrganization() {
        this.$backend.organizations.create(this.organization)
          .then(response => {
            this.organization = {}
            this.$refs.organizationForm.resetValidation()
            this.$emit('new-organization', response.data)
          })
          .catch((error) => {
            this.fillBackendErrors(error.response.data)
            this.$forceUpdate()
          })
      },
      updateOrganization() {
        this.$backend.organizations.update(this.id, this.organization)
          .then(response => {
            this.organization = {}
            this.$refs.organizationForm.resetValidation()
            this.$emit('update-organization', response.data)
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
