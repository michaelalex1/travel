<template>
  <div>
      <div class="container-fluid">
                        <ol class="breadcrumb mb-4" style="margin-top: 10px;">
                            <li class="breadcrumb-item active">
                                 <router-link :to="{ name: 'ListCategory' }" class="nav-link" id="activo">
                                              <b-icon icon="chevron-right"></b-icon> Listar categoria
                                </router-link>
                            </li>          
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                              
                                <span>
                                <b-button variant="success" id="toggle-btn-create" @click="modalChildrenCreateCategory()"><i class="ik ik-save"></i>
                                 CREAR
                                </b-button>  
                                
                             </span>
                            </div>
                            <div class="card-body">
                                <b-container class="bv-example-row">
                                    
                                                <vue-bootstrap4-table :rows="rowsChildrenCategory" :columns="columnsChildrenCategory" :config="configChildre" >
                                                  <template slot="action-slot" slot-scope="props">

                                                        <button type="button" class="btn btn-primary btn-sm" @click="modaleditCategory(props.row)"><i class="fa fa-edit" aria-hidden="true"></i></button>
                                                        <button type="button" class="btn btn-danger btn-sm" @click="deleteCategory(props.row)">
                                                            
                                                                        <b-icon icon="trash-fill"></b-icon>
                                                                        </button>
                                                        
                                                                
                                                         
                                                    </template>
                                                </vue-bootstrap4-table>


                                </b-container>
                                
                            </div>
                        </div>

    </div>
     <b-modal ref="my-modal-category" id="my-modal-category" hide-footer title="CREAR CATEGORÍA">
          <div class="d-block text-center">
            <b-card bg-variant="light">
            <form class="forms-sample" @submit.prevent="create" enctype="multipart/form-data">

                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Nombre</label>
                                <input type="text" class="form-control" v-model="Crear.name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Descripción</label>
                                <input type="text" class="form-control" v-model="Crear.description">
                            </div>
                        </div>
                        <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                    </div>
            </form>
             </b-card>
        </div>
  
          
    </b-modal>

     <b-modal ref="my-modal-category-edit" id="my-modal-category-edit" hide-footer title="EDITAR CATEGORÍA">
        <div class="d-block text-center">
            <form class="forms-sample" @submit.prevent="update" enctype="multipart/form-data">
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Nombre</label>
                                <input type="text" class="form-control" v-model="Crear.name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Descripción</label>
                                <input type="text" class="form-control" v-model="Crear.description">
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
                
                Crear:
                {
                    name:'',
                    id:'',
                    description:'',
                    state:'',
                    parent_id:''
                },
                id:0,
                rowsChildrenCategory:[],
                columnsChildrenCategory: [
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
                        name: "description",
                      },
                      {
                        label: "Acción",
                        name: "id",
                        slot_name: "action-slot",
                        },
                     
                      
                    ],
                configChildre: {
                    show_refresh_button: false,
                    show_reset_button: false,
                    rows_selectable: true,
                    card_title: "SUB CATEGORIA",
                     global_search: {
                        placeholder: "BUSCAR CATEGORIA",
                        visibility: false,
                        case_sensitive: false
                    },
                },
                 fullPage: false,
                
            };
        },
        mounted () {
          this.childrenCategory();
        },
        created() {

            this.id=this.$route.params.id;

        },
        methods: {
                
                childrenCategory:function()
                {
               
                  axios.get('/admin/category/childreCategory/'+this.id).then(response => {
                        
                        this.rowsChildrenCategory= response.data;
                        this.Create='';
                           
                    });
                },

              modalChildrenCreateCategory() {
                    
                     let loader = this.$loading.show({
                          container: this.fullPage ? null : this.$refs.formContainer,
                          canCancel: true,
                          onCancel: this.onCancel,
                            });
                        setTimeout(() => {
                          
                            this.$refs['my-modal-category'].toggle('#toggle-btn-create')
                               loader.hide()
                         },500)
                    
                },
                create()
                {
                    
                    this.Crear.parent_id=this.id;

                    axios.post('/category/creare', this.Crear)
                    .then((res) =>{
                       
                       this.Crear.name='';
                       this.Crear.description='';

                    }).catch(error => {
                      
                    })
                    this.$root.$emit('bv::hide::modal', 'my-modal-category')
                    this.childrenCategory();
                   
                 

                },

                 deleteCategory(category) {
                   let me = this;
                           axios.get('/category/remove/'+category.id).then(response => 
                                {  

                                    me.category = '';
                                    me.childrenCategory();
                    
                                });

             
                    
                },
                modaleditCategory(category) {

                     let loader = this.$loading.show({
                          container: this.fullPage ? null : this.$refs.formContainer,
                          canCancel: true,
                          onCancel: this.onCancel,
                            });
                        setTimeout(() => {
                            
                            this.Crear.name=category.name;
                            this.Crear.description=category.description;
                            this.Crear.id=category.id;
                            this.$refs['my-modal-category-edit'].toggle('#toggle-btn-edit')

                               loader.hide()
                         },500)

                   

                },
                update()
                {
                    
                    let me = this;
                    axios.post('/category/update', this.Crear).then((res) =>{
                        me.childrenCategory();

                    }).catch(error => {
                    
                    })
                
                    this.$root.$emit('bv::hide::modal', 'my-modal-category-edit')
                         
                },

        }
    }
</script>
