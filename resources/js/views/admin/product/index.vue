<template>
  <div>
        <div class="container-fluid">
                    <ol class="breadcrumb mb-4" style="margin-top: 10px;">
                        <li class="breadcrumb-item active">CATEGORÍA</li>
                    </ol>
                   
                    <div class="card mb-4">
                        <div class="card-header">
                          
                            <span>
                            
                                 <b-button v-b-modal.modal-lg variant="success" id="toggle-btn-create" @click="modalCreateproducto">
                                    <i class="ik ik-save"></i> 
                                    Crear
                                 </b-button>

                            </span> 
                            
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
                                            <th>Categoria</th>
                                            <th>Descripción</th>
                                            <th>Imagen</th>
                                            <th>Codigo</th>
                                            <th>stock</th>
                                            <th>Precio de compra</th>
                                            <th>Precio de venta</th>
                                            <th>Fecha de Ingreso</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Categoria</th>
                                            <th>Descripción</th>
                                            <th>Imagen</th>
                                            <th>Codigo</th>
                                            <th>stock</th>
                                            <th>Precio de compra</th>
                                            <th>Precio de venta</th>
                                            <th>Fecha de Ingreso</th>
                                            <th>Acción</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                          <tr v-for="producto in producto" :key="producto.id">
                                            <td v-text="producto.name"></td>
                                            <td v-text="producto.description"></td>
                                            <th scope="row">
                                               <b-img thumbnail fluid :src=producto.img alt="Image 1" style="height: 50px;width: 100px;" ></b-img>
                                            </th>
                                            <td v-text="producto.codigo"></td>
                                            <td v-text="producto.stock"></td>
                                            <td v-text="producto.price_compra"></td>
                                            <td v-text="producto.price_venta"></td>
                                            <td v-text="producto.date"></td>
                                            <td>
                                                <b-button variant="info" class="btn btn-success" id="toggle-btn-edit" @click="modalGaleriaproducto(producto)">
                                                   <b-icon icon="camera"></b-icon>
                                                </b-button> 
                                                <b-button variant="info" id="toggle-btn-edit" ref="btnShow" @click="modaleditproducto(producto)">
                                                   <b-icon icon="brush"></b-icon>
                                                </b-button>   
                                                <button type="button" class="btn btn-danger" @click="deleteproducto(producto,producto.id)">
                                                  <b-icon icon="trash-fill"></b-icon>
                                                </button>

                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>

                                  <b-button @click="showModal" ref="btnShow">Open Modal</b-button>

                              <b-modal id="modal-1">
                                <div class="d-block">Hello From My Modal!</div>
                                <b-button @click="hideModal">Close Me</b-button>
                                <b-button @click="toggleModal">Toggle Me</b-button>
                              </b-modal>
                            </div>
                        </div>
                    </div>
        </div>
     
        <b-modal  size="lg" ref="my-modal-producto"  hide-footer title="CREAR PRODUCTO">
            <div class="d-block text-center">
               
                <div>

                  <b-card bg-variant="light">
                     <form class="forms-sample" @submit.prevent="create"  method="POST" enctype="multipart/form-data">
                      <b-form-group
                        label-cols-sm="2"
                        label="Descripción:"
                        label-align-sm="right"
                        label-for="nested-street"
                      >
                        <b-form-input v-model="Create.description"></b-form-input>
                      </b-form-group>

                      <b-form-group
                        label-cols-sm="2"
                        label="Codigo:"
                        label-align-sm="right"
                        label-for="nested-city"
                      >
                        <b-form-input v-model="Create.codigo"></b-form-input>
                      </b-form-group>

                      <b-form-group
                        label-cols-sm="2"
                        label="Stock:"
                        label-align-sm="right"
                        label-for="nested-state"
                      >
                        <b-form-input v-model="Create.stock"></b-form-input>
                      </b-form-group>

                      <b-form-group
                        label-cols-sm="2"
                        label="Precio compra:"
                        label-align-sm="right"
                        label-for="nested-country"
                      >
                        <b-form-input v-model="Create.price_compra"></b-form-input>
                      </b-form-group>
                      <b-form-group
                        label-cols-sm="2"
                        label="Precio venta:"
                        label-align-sm="right"
                        label-for="nested-country"
                      >
                        <b-form-input v-model="Create.price_venta"></b-form-input>
                      </b-form-group>

                      <b-form-group
                        label-cols-sm="2"
                        label="Fecha:"
                        label-align-sm="right"
                        label-for="nested-country"
                      >
                      <input type="date" v-model="Create.date" class="form-control">
                    
                      </b-form-group>

                        <b-form-group
                        label-cols-sm="2"
                        label="Categoria:"
                        label-align-sm="right"
                        label-for="nested-country"
                      >
                      <b-form-select v-model="Create.category_id" :options="options"  v-on:change="addparentHijo(Create.category_id)"></b-form-select>
                      </b-form-group>

                      <b-form-group
                        label-cols-sm="2"
                        label="Sub Categoria:"
                        label-align-sm="right"
                        label-for="nested-country"
                      >
                      <b-form-select v-model="Create.parent_id" :options="options1"></b-form-select>
                      </b-form-group>

                       <b-form-group>
                             <input type="file" class="form-control" @change="loadImage">
                      </b-form-group>
                        


                      <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                    </form> 
                  </b-card>
                
                </div>
            </div>
        </b-modal>
            <b-modal ref="my-modal-producto-edit" id="my-modal-producto-edit" hide-footer title="EDITAR CATEGORÍA">
        <div class="d-block text-center">
            <div>
                <b-card bg-variant="light">
                 <form class="forms-sample" @submit.prevent="update" method="POST" enctype="multipart/form-data">
                  <b-form-group
                    label-cols-sm="2"
                    label="Descripción:"
                    label-align-sm="right"
                    label-for="nested-street"
                  >
                    <b-form-input v-model="Create.description"></b-form-input>
                  </b-form-group>

                  <b-form-group
                    label-cols-sm="2"
                    label="Codigo:"
                    label-align-sm="right"
                    label-for="nested-city"
                  >
                    <b-form-input v-model="Create.codigo"></b-form-input>
                  </b-form-group>

                  <b-form-group
                    label-cols-sm="2"
                    label="Stock:"
                    label-align-sm="right"
                    label-for="nested-state"
                  >
                    <b-form-input v-model="Create.stock"></b-form-input>
                  </b-form-group>

                  <b-form-group
                    label-cols-sm="2"
                    label="Precio compra:"
                    label-align-sm="right"
                    label-for="nested-country"
                  >
                    <b-form-input v-model="Create.price_compra"></b-form-input>
                  </b-form-group>
                  <b-form-group
                    label-cols-sm="2"
                    label="Precio venta:"
                    label-align-sm="right"
                    label-for="nested-country"
                  >
                    <b-form-input v-model="Create.price_venta"></b-form-input>
                  </b-form-group>

                  <b-form-group
                    label-cols-sm="2"
                    label="Fecha:"
                    label-align-sm="right"
                    label-for="nested-country"
                  >
                  <input type="date" v-model="Create.date" class="form-control">
                  </b-form-group>

                    <b-form-group
                    label-cols-sm="2"
                    label="Categoria:"
                    label-align-sm="right"
                    label-for="nested-country"
                  >
                     <b-form-select v-model="Create.category_id" :options="options" v-on:change="addparentHijo(Create.category_id)"></b-form-select>
                  </b-form-group>
                  <b-form-group
                    label-cols-sm="2"
                    label="Sub Categoria:"
                    label-align-sm="right"
                    label-for="nested-country"
                  >
                  <b-form-select v-model="Create.parent_id" :options="options1" ></b-form-select>
                  </b-form-group>
         
                  </b-form-group>
                         <input type="file" class="form-control" @change="loadImage"> 
                         <b-container fluid class="p-4 bg-dark">
                           <b-col>
                              <b-img thumbnail fluid :src="Create.image" alt="Image 1"></b-img>
                            </b-col>
                         </b-container><br><br>
                  </b-form-group>

                  <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                </form> 
              </b-card>
            </div>
        </div>
    </b-modal>
    <b-modal ref="my-modal-producto-galery-img" hide-footer title="GALERIA IMAGEN PRODUCTO">
        <div class="d-block text-center">
            <div>
                <b-card bg-variant="light">
                 
                  <vue-dropzone ref="myVueDropzone" id="dropzone"   v-on:vdropzone-sending="sendingEvent" :options="dropzoneOptions" v-on:vdropzone-success="showSuccess">
                  </vue-dropzone>
                     
                <div class="card-body p-1 table-border-style">
                    <div class="table-responsive">
                      <b-card bg-variant="dark" text-variant="white" title="GALERIA">
                          <table class="table table-hover">
                              <tbody>
                                  <tr v-for="galery in galery" :key="galery.id">
                                      <th scope="row">
                                         <b-img thumbnail fluid :src=galery.img alt="Image 1" style="height: 50px;width: 100px;" ></b-img>
                                      </th>
                                      
                                      <td>
                                          <b-button variant="info" class="btn btn-danger" id="toggle-btn-edit" @click="eliminarGaleriaImagen(galery)">
                                            <b-icon icon="trash-fill"></b-icon></b-button> 
                                          

                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                       </b-card>
                    </div>
                </div>


              </b-card>
            </div>
        </div>
    </b-modal>
         
    
  </div>
</template>
<script>


import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

     export default {
        components: {
          vueDropzone: vue2Dropzone
        },
        data () {
            return {
                
                producto:[],
                galery:[],
                Create:
                {
                    description:'',
                    codigo:'',
                    stock:'',
                    price_compra:'',
                    price_venta:'',
                    date:'',
                    category_id:'',
                    parent_id:'',
                    id:'',
                    image:'',
                },
                // select:
                // {
                //     idCategory:'',
                //     parent_id:'',
                // },
                 fullPage: false,
                   id_producto:null,
                   category_id: null,
                    options: [
                      { },
                    ],
                    options1: [
                      { },
                    ],
                    dropzoneOptions: {
                        url: '/ubload/galery',
                        method: 'POST',
                        headers: {    
                         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),

                       },
                         addRemoveLinks: true,
                         dictDefaultMessage: "<i class='ik ik-save'></i> SUBIR GALERIA DE PRODUCTO",    
                        

                    },

                
              
                
            };
        },
        mounted () {
            this.listproducto();
           
        },
        methods: {
          
    
                //subir imagen drapzone
                sendingEvent (file, xhr, formData) {

                  formData.append('product_id', this.id_producto);
                   this.SelectGalery();
                },
              'showSuccess': function (file) {
                 this.SelectGalery();
                },
                //fin drpazone
                loadImage(e)
                {
                    let file=e.target.files[0];
                    this.Create.image=file;
                },

                //Subir imagen
                listproducto()
                {
                  
                  axios.get('/product/list?page').then(response => {
                        
                        let loader = this.$loading.show({
                      container: this.fullPage ? null : this.$refs.formContainer,
                      canCancel: true,
                          onCancel: this.onCancel,
                      });
                      setTimeout(() => {
                         this.producto = response.data 
                         loader.hide()
                     },500)
                           
                     
                    });
                },
                create()
                {
                  

                   let formData = new FormData();
                   formData.append('description',this.Create.description);
                   formData.append('codigo',this.Create.codigo);
                   formData.append('stock',this.Create.stock);
                   formData.append('price_compra',this.Create.price_compra);
                   formData.append('price_venta',this.Create.price_venta);
                   formData.append('date',this.Create.date);
                   formData.append('parent_id',this.Create.parent_id);
                   formData.append('img',this.Create.image);

                  axios.post('/product/create', formData)
                    .then((res) =>{
                       
                        this.producto.push(res.data.data);
                        console.log(this.producto);
                        
                        this.Create.description='';
                        this.Create.codigo='';
                        this.Create.stock='';
                        this.Create.price_compra='';
                        this.Create.price_venta='';
                        this.Create.date='';
                        this.Create.category_id='';

                    }).catch(error => {
                      
                    })

                },
                update()
                {   
                   
                   let formData = new FormData();
                   formData.append('description',this.Create.description);
                   formData.append('codigo',this.Create.codigo);
                   formData.append('stock',this.Create.stock);
                   formData.append('price_compra',this.Create.price_compra);
                   formData.append('price_venta',this.Create.price_venta);
                   formData.append('date',this.Create.date);
                   formData.append('parent_id',this.Create.parent_id);
                   formData.append('img',this.Create.image);
                   formData.append('id',this.Create.id);

                   axios.post('/product/update',formData)
                    .then((res) =>{
                        
                      this.listproducto();
                     
                      // this.$root.$emit('bv::hide::modal', 'my-modal-producto-edit')

                    }).catch(error => {
                      
                    })
                     
                },
                modalCreateproducto() {
                    
                    this.Create.name='';
                    this.Create.description='';
                    this.SelectCategory();
                    this.$refs['my-modal-producto'].toggle('#toggle-btn-create')
                },
                modaleditproducto(producto) {
                    this.SelectCategory();

                    this.Create.description=producto.description;
                    this.Create.codigo=producto.codigo;
                    this.Create.stock=producto.stock;
                    this.Create.price_compra=producto.price_compra;
                    this.Create.price_venta=producto.price_venta;
                    this.Create.date=producto.date;
                    this.Create.category_id=producto.parent_id;
                    this.Create.id=producto.id;
                    this.Create.image=producto.img;
                    
                    this.addparentHijo(producto.parent_id);

                    this.Create.parent_id=producto.category_id;
                    
                    this.$root.$emit('bv::show::modal', 'my-modal-producto-edit', '#btnShow')



                },
                modalGaleriaproducto(producto) {
                    
                    this.id_producto=producto.id;
                    this.$refs['my-modal-producto-galery-img'].toggle('#toggle-btn-edit');
                    this.SelectGalery();

                },
                deleteproducto: function(producto,id) {
                    let me = this;
                    axios.get('/product/remove/'+producto.id).then(response => 
                        {   
                            
                            me.listproducto();
                                
                        });
                },
                 SelectCategory:function()
                    {
                      this.options=[];
                      axios.get('/category/list_category').then(response => {
                            
                         const versions = response.data;
                                
                                versions.forEach((version) => {
                                  this.options.push(version);
                                });   
                               
                               
                        });
                    },

                SelectGalery:function()
                {
                  
                  axios.get('/list/galery/'+this.id_producto).then(response => {
                     
                         this.galery= response.data;
                        
                           
                    });
                },

                addparentHijo:function(id)
                {
                 this.options1=[];
                  axios.get('/category/list_category/sub/'+ id).then(response => {
                     
                            

                            const versions = response.data;
                            
                            versions.forEach((version) => {
                              this.options1.push(version);
                            });  
                        
                           
                    });
                },

                eliminarGaleriaImagen: function (galery) {
                   
                    axios.get('/list/galery/delete/'+galery.id).then(response => 
                        {   
                            

                              this.SelectGalery();
                                
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
