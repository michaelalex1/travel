<template>
   
        <ol class="breadcrumb mb-4" style="margin-top: 10px;">
            <li class="breadcrumb-item active">{{title}}</li>
            
        </ol>
                       
                      
</template>
<script>
export default {
  props: {
    title: {
      type: String,
      default: 'Inicio'
    },
   
  },
  computed: {
    totalMonths() {
      return this.columns * this.rows;
    }
  }
};
</script>

<style type="text/css">
    .modal-backdrop
    {
        opacity:0.5 !important;
    }
</style>
