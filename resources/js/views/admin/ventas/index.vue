<template>
  <div>
      <div class="container-fluid">
            <b-breadcrumb style="margin-top: 10px;">
                <b-breadcrumb-item :to="{name: 'ListProduct'}">
                  <b-icon icon="house-fill" scale="1.25" shift-v="1.25" aria-hidden="true"></b-icon>
                  Inicio
                </b-breadcrumb-item>
                    <b-breadcrumb-item :to="{name: 'ListVenta'}">Ventas</b-breadcrumb-item>
                    
              </b-breadcrumb>
                      
                  <b-row>
                    <b-col>

                     <div>
                      <b-card no-body>
                        <b-tabs card>
                          <b-tab title="Procesos" active>
                           
                            <form class="forms-sample"  enctype="multipart/form-data" @submit.prevent='store'>
                              <b-row>
                                    <b-col>
                                      <b-form-group label-cols-sm="2" label="Vendedor:" label-align-sm="right" label-for="nested-street">
                                          <b-input-group prepend="☺">
                                            <b-form-input size="lg" :value="vendedor"></b-form-input>
                                          </b-input-group>
                                      </b-form-group>
                                    </b-col>

                                    <b-col>
                                      <b-form-group label-cols-sm="2" label="Codigo:" label-align-sm="right" label-for="nested-street">
                                          <b-input-group prepend="☺">
                                            <b-form-input size="lg" ></b-form-input>
                                          </b-input-group>
                                      </b-form-group>
                                    </b-col>
                              </b-row>
                              
                              <b-row>
                                    <b-col>
                                                                         
                                          <b-form-group label-cols-sm="2" label="Cliente:" label-align-sm="right" label-for="nested-street">
                                                <v-select label="name"  @input="setSelectedClient" :options="optionsClient" @search="fetchOptionsClient" ></v-select>
                                          </b-form-group>
                                     
                                    </b-col>

                                    <b-col>
                                      <b-form-group label-cols-sm="2" label="Codigo:" label-align-sm="right" label-for="nested-street">
                                        
                                        <b-col lg="4" class="pb-2"><b-button variant="info" @click="Product()">Producto</b-button></b-col>
                                        
                                      </b-form-group>
                                    </b-col>
                              </b-row>
                              <hr>
                              <b-row>
                                <b-col>
                                   <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                     <tr>
                                                        <th>Descripción</th>
                                                        <th>Precio</th>
                                                        <th>cantidad</th>
                                                        <th>Acción</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                    <tr v-for="arrayProducVenta in arrayProducVenta" :key="arrayProducVenta.id">
                                                        <td v-text="arrayProducVenta.categoria"></td>
                                                        <td v-text="arrayProducVenta.price_venta"></td>
                                                        <td>
                                                              <input type="number"  class="form-control" name="fname" :value=" arrayProducVenta.cantidad ">

                                                        </td>
                                                        <td>
                                                            
                                                            <button type="button" class="btn btn-danger btn-sm" @click="removerProduct()">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </button>
                                                        </td>

                                                    </tr>
                                                   
                                                </tbody>
                                            </table>

                                              
                                        </div>
                                    </div>
                                </b-col>
                                 <b-col>
                                     <b-row>
                                         <b-col>
                                                <h5>Total: <b-badge>{{total}}</b-badge></h5>
                                              
                                           </b-col>
                                            <b-col>
                                              <h5>Inpuesto: <b-badge>{{imp}}</b-badge></h5>
                                              

                                             </b-col>

                                      </b-row>
                                     
                                 </b-col>
                              </b-row>
                              <hr>
                              <b-row>
                                    
                                   <b-col>
                                              <b-form-group label-cols-sm="2" label="Pago:" label-align-sm="right" label-for="nested-street">

                                               <b-form-select v-model="selected" :options="options"  class="mb-2 mr-sm-2 mb-sm-0" value-field="item" text-field="name" disabled-field="notEnabled"
                                                  >
                                                      
                                                  </b-form-select>
                                              
                                              </b-form-group>
                                     
                                      </b-col>
                                      <b-col>
                                        </b-col>
                                  
                              </b-row>
                              <button style="margin-left: 15px;" type="submit" class="btn btn-primary mr-2">Guardar</button>
                            </form> 

                          </b-tab>
                         
                        </b-tabs>
                      </b-card>
                    </div>

                    </b-col>

                   
                   
                  </b-row>
        </div>
    
           <b-modal ref="my-modal-product" id="my-modal-product" size="lg" hide-footer title="PRODUCTO CLIENTE">
              <div class="d-block text-center">
                     
                     <vue-bootstrap4-table :rows="rows" :columns="columns" :config="config" @on-change-query="onChangeQuery" :show-loader="showLoader"
                                    :total-rows="total_rows"  :classes="classes">

                         <template slot="action-slot" slot-scope="props">


                             <b-img thumbnail center :src="props.row.img" style="height: 50px;" alt="Center image"></b-img>

                            
                        </template>
                         <template slot="action" slot-scope="props">
                                        <button type="button" class="btn btn-primary btn-sm" @click="addProductVenta(props.row)"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                        </button>


                        </template>

                     </vue-bootstrap4-table>

              </div>
      
              
        </b-modal>
          
    </div>
  
</template>
<script> 
 import VueBootstrap4Table from 'vue-bootstrap4-table'
import vSelect from 'vue-select'
import 'vue-select/dist/vue-select.css';

     export default {
        components: {
                VueBootstrap4Table,
                vSelect
            },
        data () {
            return {
                arrayProducVenta:[],
                arrayProducVentaTemp:[],
                total:0,
                imp:19,
                vendedor:'',
                rows: [],
                columns: [
                    {
                        label: "image",name: "img",
                        slot_name: "action-slot",
                    },
                    {
                        label: "Código",
                        name: "codigo",
                          filter: {
                            type: "simple",
                            placeholder: "Buscar por código"
                        },
                    },
                     {
                        label: "Categoria",
                        name: "categoria"
                    },
                    {
                        label: "Descripción",
                        name: "description",
                        filter: {
                            type: "simple",
                            placeholder: "Buscar por Descripción"
                        },
                    },
                     {
                        label: "Stock",
                        name: "stock",
                    },
                     {
                        label: "Accion",name: "id",
                        slot_name: "action",
                    },
                    ],
                config: {
                        card_mode: true,
                        highlight_row_hover: true, 
                        rows_selectable: true, 
                        highlight_row_hover_color:"grey",
                        card_title: "LISTADO DE PRODUCTO",
                        global_search: {
                            placeholder: "BUSCAR PRODUCTO",
                            visibility: true,
                            case_sensitive: false
                        },
                        per_page_options: [5, 10, 20, 30],
                        show_refresh_button: false,
                        show_reset_button: false,
                        server_mode: true,
                        preservePageOnDataChange: true,
                        loaderText: 'Updating...',

                      },
                      queryParams: {
                        sort: [],
                        filters: [],
                        global_search: "",
                        per_page: 10,
                        page: 1,
                    },
                    total_rows: 0,
                    showLoader: true,
                    classes: {
                    tableWrapper: "outer-table-div-class wrapper-class-two", 
                    table : {
                        "table-striped my-class" : true,
                        "table-bordered my-class-two" : function(rows) {
                            return true
                        }
                    },
                    row : {
                        "my-row my-row2" : true,
                        "function-class" : function(row) {

                            return row.id == 1
                        }
                    },
                    cell : {
                        "my-cell my-cell2" : true,
                        "text-danger" : function(row,column,cellValue) {
                            return column.name == "salary" && row.salary > 2500
                        }
                    }
                },
                selected: 'efectivo',
                options: [
                  { item: 'efectivo', name: 'Efectivo' },
                  { item: 'tarjeta-credito', name: 'Tarjeta Crédito' }
                ],
                optionsClient: [
                        
                ],
                myValueClient:'',
                
            };
        },
        mounted () {
          this.Listvendedor();
        },
        computed: {
            rows() {
                return this.items.length
            }
        },
        methods: 
        {
            
             onChangeQuery(queryParams) 
             {
                this.queryParams = queryParams;
                this.showLoader = true;
                this.Product();
            },
            Product()
            {
                let self = this;
                       axios.get('/admin/Product/list', {
                        params: {
                            "queryParams": this.queryParams,
                            "page": this.queryParams.page
                        }
                    })
                    .then(function(response) {
                         
                         self.rows = response.data.data;
                         self.total_rows = response.data.total;
                         self.showLoader = false;
                        
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                    
                this.$refs['my-modal-product'].show('#my-modal-product')

            },
            addProductVenta (data)
            {
                      
            
              if(this.arrayProducVenta.length==0)
                {   
    
                    this.arrayProducVenta.push({'id':data.id,'categoria':data.categoria,'cantidad': 1,'price_venta':data.price_venta});

                }else
                {
                     let cantidad=0;
                     let total=0;
                     this.arrayProducVenta.forEach((value, index) => 
                       {
                            if(value.id==data.id)
                            {
                                value.cantidad   =value.cantidad+1; 
                                cantidad         =cantidad +1;

                                value.price_venta=parseFloat(value.price_venta)*parseFloat(cantidad);
                
                            }
                       });
                      if(cantidad==0)
                      {

                        this.arrayProducVenta.push({'id':data.id,'categoria':data.categoria,'cantidad': 1,'price_venta':data.price_venta});
                      }


                }
                 let tempTotal=0;
                 this.arrayProducVenta.forEach((value, index) => 
                   {
                       tempTotal= tempTotal + parseFloat(value.price_venta)*parseFloat(value.cantidad);
                   });
                
                this.total = tempTotal + parseFloat((tempTotal*this.imp)/100);
            
                    
            },
          setSelectedClient(value)
           {
                    console.log(value); 
           },
           fetchOptionsClient(value)
           { 
              
                  this.optionsClient=[];
                    
                       axios.get('/admin/clients/list/buscar/'+ value).then(response => {
                        this.optionsClient=response.data;
                        
                      
                    }).catch(function(error) {
                        console.log(error);
                    });
           },
           Listvendedor(){

                 axios.get('/admin/clients/vendedor/').then(response =>{
                    
                    
                    this.vendedor=response.data;
                   
                 });
           }

           
    }
}
</script>

<style type="text/css">
    .modal-backdrop
    {
        opacity:0.5 !important;
    }
    img {
  height: auto;
  max-width: 2.5rem;
  margin-right: 1rem;
}

.d-center {
  display: flex;
  align-items: center;
}

.selected img {
  width: auto;
  max-height: 23px;
  margin-right: 0.5rem;
}

.v-select .dropdown li {
  border-bottom: 1px solid rgba(112, 128, 144, 0.1);
}

.v-select .dropdown li:last-child {
  border-bottom: none;
}

.v-select .dropdown li a {
  padding: 10px 20px;
  width: 100%;
  font-size: 1.25em;
  color: #3c3c3c;
}

.v-select .dropdown-menu .active > a {
  color: #fff;
}
</style>
