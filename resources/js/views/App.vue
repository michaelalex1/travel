<template>
    <div>
       <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                           
                            <div class="nav">
                                
                                <div class="sb-sidenav-menu-heading">ALMACEN</div>
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    PRODUCTO
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                         <router-link :to="{ name: 'ListCategory' }" class="nav-link">
                                              <b-icon icon="chevron-right"></b-icon> Categoría
                                         </router-link>
                                         <router-link :to="{ name: 'ListProduct' }" class="nav-link">
                                            <b-icon icon="chevron-right"></b-icon> Producto
                                        </router-link>  
                                      
                                    </nav>
                                </div>
                                <div class="sb-sidenav-menu-heading">CLIENTES</div>
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#clientes" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    CLIENTES
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="clientes" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                         <router-link :to="{ name: 'ListClient' }" class="nav-link" id="activo">
                                              <b-icon icon="chevron-right"></b-icon> Listar
                                         </router-link>
                                      
                                    </nav>
                                </div>

                                 <div class="sb-sidenav-menu-heading">VENTAS</div>
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#ventas" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    VENTAS
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="ventas" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                         <router-link :to="{ name: 'ListVenta' }" class="nav-link" id="activo">
                                              <b-icon icon="chevron-right"></b-icon> Ventas
                                         </router-link>
                                      
                                    </nav>
                                </div>
                              
                               
                            </div>
                          
                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Ecomer</div>
                             Sistema ecomer
                        </div>
                    </nav>
                </div>
                <div id="layoutSidenav_content">
                    <main>
                          <transition name="slide-fade">

                            <router-view></router-view>
                          </transition>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright © 2020</div>
                                <div>
                                    <a href="#">Spaziour.com</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>

          
    </div>
</template>
<script>
    export default {}
</script>

<style>

   nav li:hover,
   nav li:active{
      background-color: indianred;
      cursor: pointer;
    }
/* Las animaciones de entrada y salida pueden usar */
/* funciones de espera y duración diferentes.      */
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>
