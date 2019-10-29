<template lang='pug'>
  q-dialog(:value="true" @hide="$router.go(-1)")
    q-card
      q-card-section.row.items-center.q-py-sm
        .text-h6 Edit equipment
        q-space
        q-btn(color="brown" icon="fas fa-times" flat round dense v-close-popup)
      q-card-section
        EquipmentForm(@update-equipment="updateEquipment" :id="id")
</template>

<script>
  import EquipmentForm from './form.vue'

  export default {
    components: {
      EquipmentForm,
    },
    computed: {
      id() {
        return this.$route.params.id
      }
    },
    methods: {
      updateEquipment(equipment) {
        this.$router.go(-1)
        this.$emit('update-equipment-row', equipment)
      }
    }
  }
</script>

<style scoped lang="scss">
  .q-card {
    width: 600px;
  }
</style>
