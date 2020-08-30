<template>
      <div class="container-fluid">
                        <header-conteiner title="CREAR CLIENTE"> </header-conteiner> 
                       
                        <div class="card mb-4">
                            <div class="card-header">
                              <span>
                                 <router-link :to="{ name: 'ListClient' }" variant="success" id="toggle-btn-create">
                                            <b-button variant="success">
                                              <i class="ik ik-save"></i> Listar
                                             </b-button> 
                                    </router-link>  
                                
                             </span>
                            </div>
                            
                        </div>
                        <div class="d-block text-center">
               

                          <b-card bg-variant="light">

                            <form class="forms-sample"  enctype="multipart/form-data" @submit.prevent='store'>
                              <b-row>
                                <b-col>
                                  <b-form-group
                                    label-cols-sm="2"
                                    label="Nombre:"
                                    label-align-sm="right"
                                    label-for="nested-street"
                                  >
                                    <b-form-input v-model="Create.name" class="mb-2 mr-sm-2 mb-sm-0"></b-form-input>
                                  </b-form-group>
                                </b-col>

                                <b-col>
                                    
                                 <b-form-group
                                    label-cols-sm="2"
                                    label="Dni:"
                                    label-align-sm="right"
                                    label-for="nested-city"
                                  >
                                    <b-form-input v-model="Create.dni"></b-form-input>
                                  </b-form-group>
                                </b-col>

                              
                              </b-row>
                              
                              <b-row>
                                <b-col>
                                    <b-form-group
                                  label-cols-sm="2" 
                                  label="Email:"
                                  label-align-sm="right"
                                  label-for="nested-country"
                                >
                                  <b-form-input v-model="Create.email"></b-form-input>
                                </b-form-group>
                                </b-col>
                                <b-col>
                                    <b-form-group
                                    label-cols-sm="2"
                                    label="Teléfono:"
                                    label-align-sm="right"
                                    label-for="nested-country"
                                  >
                                    <b-form-input v-model="Create.phone"></b-form-input>
                                  </b-form-group>
                                </b-col>
                              </b-row>
                              <b-row>
                                <b-col>
                                    <b-form-group
                                  label-cols-sm="2" 
                                  label="Dirección:"
                                  label-align-sm="right"
                                  label-for="nested-country"
                                >
                                  <b-form-input v-model="Create.direction"></b-form-input>
                                </b-form-group>
                                </b-col>
                                <b-col>
                                    <b-form-group
                                    label-cols-sm="4"
                                    label="Fecha de nacimiento:"
                                    label-align-sm="right"
                                    label-for="nested-country"
                                  >
                                    <b-form-input v-model="Create.birth_date"></b-form-input>
                                  </b-form-group>
                                </b-col>
                              </b-row>
                              <b-row>
                                <b-col>
                                    <b-form-group
                                  label-cols-sm="2" 
                                  label="T. compra:"
                                  label-align-sm="right"
                                  label-for="nested-country"
                                >
                                  <b-form-input v-model="Create.total_purchases"></b-form-input>
                                </b-form-group>
                                </b-col>
                                
                              </b-row>
                              


                              
                              
                              <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                            </form> 
                          </b-card>
                
                      </div>
                        
        </div>
      
</template>
<script>

 export default {

        data () {
            return {
              Create:
              {
                name:'',
                dni:'',
                email:'',
                phone:'',
                direction:'',
                birth_date:'',
                total_purchases:''
              }
  
            };
        },
        computed: {
              
        },
        methods: {

               store:function()
               {
                  axios.post('/admin/clients/store',this.Create).then((res)=>
                  {

                     this.Create=[];

                  }).catch( error =>
                  {

                  } );

               }
        }
    }
</script>

<style type="text/css">
    .modal-backdrop
    {
        opacity:0.5 !important;
    }
</style>
