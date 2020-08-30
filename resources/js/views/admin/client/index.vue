<template>
      <div class="container-fluid">
                       
                         
                       
                      
                        <div class="card mb-4" style="margin-top: 27px;">
                            
                            <div class="card-body">
                                
                                <div class="overflow-auto">
                             
                                             
                                 <router-link :to="{ name: 'CreateClient' }" variant="success" id="toggle-btn-create">
                                                        <b-button variant="success">
                                                        <i class="ik ik-save"></i> Crear
                                                        </b-button> 
                                                </router-link>
                                     

                                     <vue-bootstrap4-table :rows="rows" :columns="columns" :config="config" 
                                     @on-change-query="onChangeQuery"
                                    :total-rows="total_rows">

                                    <template slot="action-slot" slot-scope="props">
                                        <button type="button" class="btn btn-primary btn-sm" @click="onEdit(props.row)"><i class="fa fa-edit" aria-hidden="true"></i></button>
                                        <button type="button" class="btn btn-danger btn-sm" @click="onDelete(props.row)"><i class="fa fa-trash" aria-hidden="true"></i></button>

                                    </template>

                                      </vue-bootstrap4-table>
                                   

                                </div>
                                
                            </div>
                        </div>
       <b-modal ref="my-modal-category" id="my-modal-category" size="lg" hide-footer title="EDITAR CLIENTE">
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
  
          
    </b-modal>

    </div>

      
     
</template>
<script>

 import VueBootstrap4Table from 'vue-bootstrap4-table'

 export default {
        components: {
            VueBootstrap4Table
        },
        data () {
            return {
                Create:
                  {
                    id  :'',
                    name:'',
                    dni:'',
                    email:'',
                    phone:'',
                    direction:'',
                    birth_date:'',
                    total_purchases:''

                  },
                rows: [],
                columns: [
                      {
                          label: "Id", name: "id",
                      },
                      {
                          label: "Nombre",name: "name",
                          filter: 
                          {
                            type: "simple",
                            placeholder: "Ingrese el nombre"
                         },
                       
                      },
                      {
                          label: "Dni", name: "dni",
                          filter: 
                          {
                            type: "simple",
                            placeholder: "Ingrese su dni"
                         },
                        
                      },
                      {
                          label: "Email",name: "email",
                      },
                       {
                          label: "Teléfono",name: "phone",
                      },
                      {
                          label: "direction",name: "direccion",
                      },
                      {
                        label: "Accion",name: "id",
                        slot_name: "action-slot",
                        },
                      
                    ],
                      config: {
                        card_mode: true,
                        highlight_row_hover: true, 
                        rows_selectable: true, 
                        highlight_row_hover_color:"grey",
                        card_title: "LISTADO DE CLIENTES",
                        global_search: {
                            placeholder: "BUSCAR CLIENTE",
                            visibility: true,
                            case_sensitive: false
                        },
                        per_page_options: [5, 10, 20, 30],
                        show_refresh_button: false,
                        show_reset_button: false,
                        server_mode: true,
                        preservePageOnDataChange: true
                      },
                      queryParams: {
                        sort: [],
                        filters: [],
                        global_search: "",
                        per_page: 10,
                        page: 1,
                    },
                    total_rows: 0,
               
               
                
            };
        },
        mounted () {
            this.listClient();
        },
        computed: {
            rows() {
                return this.items.length
            }
        },
        methods: {
            onChangeQuery(queryParams) {
                this.queryParams = queryParams;
                this.listClient();
            },
            onEdit(row) {
             
                   

                    this.Create.id          =row.id;
                    this.Create.name        =row.name;
                    this.Create.dni         =row.dni;
                    this.Create.email       =row.email;
                    this.Create.phone       =row.phone;
                    this.Create.direction         =row.direction;
                    this.Create.birth_date        =row.birth_date;
                    this.Create.total_purchases   =row.total_purchases;
                   
                    this.$refs['my-modal-category'].show('#toggle-btn-create')

             
            },
            store:function()
            {

                    this.$refs['my-modal-category'].toggle('#toggle-btn-create')
                    axios.post('/admin/clients/update',this.Create).then((res)=>
                    {
                      
                         this.listClient();
                         
                    }).catch(error=>{


                    });
                   
            },
            onDelete(row) {
              
              let self = this;
              axios.get('/admin/clients/remove/'+row.id).then(response => 
                    {   
                     
                        self.listClient();
                            
                    });

            } ,
             listClient:function()
                    {
                      let self = this;
                       axios.get('/admin/clients/list', {
                        params: {
                            "queryParams": this.queryParams,
                            "page": this.queryParams.page
                        }
                    })
                    .then(function(response) {
                         
                         self.rows = response.data.data;
                        
                         self.total_rows = response.data.total;
                        
                        
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                    
                },
               
        }
    }
</script>

<style type="text/css">
    .modal-backdrop
    {
        opacity:0.5 !important;
    }
</style>
