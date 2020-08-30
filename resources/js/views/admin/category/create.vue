<template>
  <div>
   <div class="row">
        <div class="col-md-12">
            <div class="card">
                 <div class="card-header"><h3>CATEGORÍA</h3></div>
                    <div class="card-body">
                        <form class="forms-sample" @submit.prevent="create" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleInputUsername1">Nombre</label>
                                <input type="text" class="form-control" v-model="Create.name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputUsername1">Descripción</label>
                                <input type="text" class="form-control" v-model="Create.description">
                            </div>
                            
                            <button type="submit" class="btn btn-primary mr-2">Guardar</button>
                                <router-link :to="{ name: 'ListCategory' }" class="btn btn-light">Cancelar</router-link>
                            </form>
                    </div>
            </div>
         
           
        </div>
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
                    description:'',
                    state:''
                }
                
            };
        },
        mounted () {
          
        },
        methods: {
                create()
                {

                  axios.post('/category/creare', this.Create)
                    .then((res) =>{
                        console.log(res.data);
                       
                    }).catch(error => {
                      
                    })

                },
              

        }
    }
</script>
