<template lang="pug">
  .row
    .col-lg-8.q-pa-md
      div.flex.justify-center(v-if="loading")
        q-spinner-hourglass(color="primary" size="8em" :thickness="10")
      div(v-else)
        EquipmentsList(:equipments="equipments")
    q-separator(vertical)
    .col-lg-3.q-pa-md
      h6 Create new equipment
      EquipmentForm(@new-equipment="addNewEquipment")
    router-view(@update-equipment-row="updateEquipmentRow")
</template>

<script>
  import EquipmentsList from './list.vue'
  import EquipmentForm from './form.vue'

  export default {
    data() {
      return {
        loading: true,
        equipments: []
      }
    },
    created() {
      this.fetchEquipments()
    },
    methods: {
      fetchEquipments() {
        this.$backend.equipments.index()
          .then(response => { this.equipments = response.data })
          .finally(() => this.loading = false)
      },
      addNewEquipment(equipment) {
        this.equipments.push(equipment)
      },
      updateEquipmentRow(equipment) {
        let index = this.equipments.findIndex(item => item.id == equipment.id)
        this.equipments.splice(index, 1, equipment)
      }
    },
    components: {
      EquipmentsList,
      EquipmentForm
    }
  }
</script>
