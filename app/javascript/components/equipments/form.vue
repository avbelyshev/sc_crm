<template lang="pug">
  .container
    q-form(ref="equipmentForm" @submit.prevent="onSubmit" class="q-gutter-md")
      .control
        q-input(outlined ref="name" v-model="equipment.name" label="Name" stack-label
          lazy-rules :rules="rules.name")
      .control
        q-select(outlined ref="kind" v-model="equipment.kind" :options="kinds" label="Kind" stack-label
          lazy-rules :rules="rules.kind")
      .control
        q-input(outlined ref="serial_number" v-model="equipment.serial_number" label="Serial number" stack-label
          lazy-rules :rules="rules.serial_number")
      .control
        q-select(outlined ref="organization_id" v-model="equipment.organization_id" :options="organizations"
          option-value="id" option-label="name" emit-value map-options label="Organization" stack-label
          lazy-rules :rules="rules.organization_id")
      .action
        q-btn(type="submit") {{ id ? "Edit equipment" : "Add equipment" }}
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
        equipment: {
          name: '',
          kind: '',
          serial_number: '',
          organization_id: ''
        },
        kinds: [],
        organizations: [],
        rules: {
          name: [ val => val && val.length > 0 || 'Name must be filled'],
          kind: [ val => val && val.length > 0 || 'Kind must be filled'],
          serial_number: [ val => val && val.length > 0 || 'Serial number must be filled'],
          organization_id: [ val => !!val || 'Organization must be filled']
        }
      }
    },
    created() {
      this.getKinds()
      this.getOrganizations()
      this.fillFormFields(this.id)
    },
    methods: {
      getKinds() {
        this.$backend.equipments.kinds()
          .then(response => { this.kinds = response.data })
      },
      getOrganizations() {
        this.$backend.organizations.index('')
          .then(response => { this.organizations = response.data })
      },
      fetchEquipment(id) {
        this.$backend.equipments.edit(id)
          .then(response => { this.equipment = response.data })
      },
      fillFormFields(id) {
        if (!id) { return }
        this.fetchEquipment(this.id)
      },
      onSubmit() {
        this.$refs.equipmentForm.resetValidation()
        this.$refs.equipmentForm.validate().then(success => {
          if (success) {
            if (this.id) { this.updateEquipment() }
            else { this.createEquipment() }
          }
        })
      },
      createEquipment() {
        this.$backend.equipments.create(this.equipment)
          .then(response => {
            this.equipment = {}
            this.$refs.equipmentForm.resetValidation()
            this.$emit('new-equipment', response.data)
          })
          .catch((error) => {
            this.fillBackendErrors(error.response.data)
            this.$forceUpdate()
          })
      },
      updateEquipment() {
        this.$backend.equipments.update(this.id, this.equipment)
          .then(response => {
            this.equipment = {}
            this.$refs.equipmentForm.resetValidation()
            this.$emit('update-equipment', response.data)
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
