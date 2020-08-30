<template>
  <div>
      <div class="container-fluid">
                        <ol class="breadcrumb mb-4" style="margin-top: 10px;">
                            <li class="breadcrumb-item active">CATEGORÍA</li>
                            
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                              
                                <span>
                                <b-button variant="success" id="toggle-btn-create" @click="modalCreateCategory('0')"><i class="ik ik-save"></i>
                                 CREAR
                                </b-button>  
                                
                             </span>
                            </div>
                            <div class="card-body">
                                <b-container class="bv-example-row">
                                    
                                                <vue-bootstrap4-table :rows="rows" :columns="columns" :config="config" 
                                                    @on-change-query="onChangeQuery"
                                                    :total-rows="total_rows">
                                                    <template slot="action-slot" slot-scope="props">

                                                        <button type="button" class="btn btn-primary btn-sm" @click="modaleditCategory(props.row)"><i class="fa fa-edit" aria-hidden="true"></i></button>
                                                        <button type="button" class="btn btn-danger btn-sm" @click="deleteCategory(props.row)">
                                                            
                                                                        <b-icon icon="trash-fill"></b-icon>
                                                                        </button>
                                                     
                                                         <b-button class="btn btn-success btn-sm"  @click="childrenComponet(props.row)">
                                                                <i class="fa fa-bars" aria-hidden="true"></i>
                                                                
                                                        </b-button> 
                                                    </template>
                                                </vue-bootstrap4-table>
                                           

                                        </b-col>
                                       
                                           
                                            


                                </b-container>
                                
                            </div>
                        </div>

    </div>
   <div class="row">
    <b-modal ref="my-modal-category" id="my-modal-category" hide-footer title="CREAR CATEGORÍA">
          <div class="d-block text-center">
            <b-card bg-variant="light">
            <form class="forms-sample" @submit.prevent="create" enctype="multipart/form-data">

                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Nombre</label>
                                <input type="text" class="form-control" v-model="Create.name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Descripción</label>
                                <input type="text" class="form-control" v-model="Create.description">
                            </div>
                        </div>
                        <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                    </div>
            </form>
             </b-card>
        </div>
  
          
    </b-modal>
    </div>
    <b-modal ref="my-modal-category-edit" id="my-modal-category-edit" hide-footer title="EDITAR CATEGORÍA">
        <div class="d-block text-center">
            <form class="forms-sample" @submit.prevent="update" enctype="multipart/form-data">
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Nombre</label>
                                <input type="text" class="form-control" v-model="Create.name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Descripción</label>
                                <input type="text" class="form-control" v-model="Create.description">
                            </div>
                        </div>
                        <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                    </div>
            </form>
        </div>
    </b-modal>
         
      
    </div>
  
</template>
<script>
 import VueBootstrap4Table from 'vue-bootstrap4-table'

     export default {
        components: {
                VueBootstrap4Table,
            },
        data () {
            return {
                idParend:null,
                Create:
                {
                    name:'',
                    description:'',
                    state:'',
                    id:'',
                    parent_id:''
                },
                 fullPage: false,
                 rows: [],
                 columns: [
                      {
                          label: "N°",
                          name: "id",
                      },
                      {
                          label: "Nombre",
                          name: "name",
                          filter: 
                          {
                            type: "simple",
                            placeholder: "Buscar por nombre"
                         },
                      },
                      {
                          label: "Descripción",
                          name: "description"
                      },
                      {
                        label: "Acción",
                        name: "id",
                        slot_name: "action-slot",
                        },
                      
                    ],
                  config: {
                    card_mode: true,
                    highlight_row_hover: true, 
                    rows_selectable: true, 
                    highlight_row_hover_color:"grey",
                    card_title: "LISTADO DE CATEGORIA",
                    global_search: {
                        placeholder: "BUSCAR CATEGORIA",
                        visibility: false,
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
            this.listCategory();
        },
        methods: {

                onChangeQuery(queryParams) {
                    this.queryParams = queryParams;
                    this.listCategory();
                },
                listCategory:function()
                    {
                      
                            let self = this;
                            axios.get('/category/list', {
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
                create()
                {
                 this.Create.parent_id='';
                  axios.post('/category/creare', this.Create)
                    .then((res) =>{
                       
                       this.Create.name='';
                       this.Create.description='';

                    }).catch(error => {
                      
                    })
                    this.$root.$emit('bv::hide::modal', 'my-modal-category')
                    this.category = '';
                    this.listCategory();
                   
                 

                },
                update()
                {
                    
                    let me = this;
                    console.log(this.Create);
                    axios.post('/category/update', this.Create).then((res) =>{
                        this.category = '';
                        me.listCategory();

                    }).catch(error => {
                    
                    })
                
                    this.$root.$emit('bv::hide::modal', 'my-modal-category-edit')
                         
                },
                modalCreateCategory(parent_id) {
                    
                     let loader = this.$loading.show({
                          container: this.fullPage ? null : this.$refs.formContainer,
                          canCancel: true,
                          onCancel: this.onCancel,
                            });
                        setTimeout(() => {
                           if(parent_id==0)
                           {

                           }else{
                             this.Create.parent_id=parent_id.id;
                           }
                           
                            this.$refs['my-modal-category'].toggle('#toggle-btn-create')
                               loader.hide()
                         },500)
                    // console.log( this.Create);
                    
                },
                modaleditCategory(category) {

                     let loader = this.$loading.show({
                          container: this.fullPage ? null : this.$refs.formContainer,
                          canCancel: true,
                          onCancel: this.onCancel,
                            });
                        setTimeout(() => {
                            
                            this.Create.name=category.name;
                            this.Create.description=category.description;
                            this.Create.id=category.id;
                            this.$refs['my-modal-category-edit'].toggle('#toggle-btn-edit')

                               loader.hide()
                         },500)

                   

                },
                deleteCategory(category) {
                   let me = this;
                           axios.get('/category/remove/'+category.id).then(response => 
                                {   
                                    me.category = '';
                                    me.listCategory();
                                        
                                });

             
                    
                },
               
                childrenComponet:function(category)
                {
                    this.idParend=category.id;
                    this.$router.replace({ path: '/admin/category/listChildren/'+category.id})

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
