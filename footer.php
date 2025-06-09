<footer class="footer footer-transparent d-print-none">
    <div class="container-xl">
        <div class="row text-center align-items-center flex-row-reverse">
            <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                    <li class="list-inline-item">		
                        <a href="#" target="_blank" class="link-secondary" rel="noopener">			
                            Documentation			
                        </a>			
                    </li>                 		
                    <li class="list-inline-item">		
                        <a href="#" class="link-secondary">License</a>			
                    </li>                  		
                    <li class="list-inline-item">		
                        <a href="#" target="_blank" class="link-secondary" rel="noopener">			
                            Source code			
                        </a>			
                    </li>                 							
                    <li class="list-inline-item">                    		
                        <a href="#" target="_blank" class="link-secondary" rel="noopener">			
                            <i class="ti ti-heart"></i>                    			
                            Sponsor                  							
                        </a>                			
                    </li>              		
                </ul>            		
            </div>            	
            <div class="col-12 col-lg-auto mt-3 mt-lg-0">            	
                <ul class="list-inline list-inline-dots mb-0">                		
                    <li class="list-inline-item">                    		
                        Copyright &copy; 2024                    			
                        <a href="https://www.eurodatatech.com" class="link-secondary">Euro Data Technology</a>.			
                        All rights reserved.                  			
                    </li>                  		
                    <li class="list-inline-item">		
                        <a href="#" class="link-secondary" rel="noopener">                      			
                            v1.0.1-beta2.0                    			
                        </a>                  			
                    </li>                		
                </ul>              		
            </div>	
        </div>	
    </div>
</footer>      
</div>  
</div>
<!-- Libs JS -->
<script src="libs/apexcharts/dist/apexcharts.min.js" defer></script>
<script src="libs/jsvectormap/dist/js/jsvectormap.min.js" defer></script>
<script src="libs/jsvectormap/dist/maps/world.js" defer></script>
<script src="libs/jsvectormap/dist/maps/world-merc.js" defer></script>

<script src="vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="vendor/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
<script src="vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="vendor/datatables.net-buttons/js/buttons.print.min.js"></script>

<!-- Datatables js -->
<script src="vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>

<!-- Datatable Init js -->
<script src="js/demo.datatable-init.js"></script>

<!-- Tabler Core -->
<script src="js/tabler.min.js" defer></script>
<script src="js/demo.min.js" defer></script>
<script src="libs/list.js/dist/list.min.js" defer></script>
 <script>
	
    $(document).ready(function() {    

        $('.toggle-password').click(function() {        
	
        $(this).toggleClass('active');        
	
        var input = $($(this).closest('.input-group').find('input'));        
	
        if (input.attr('type') == 'password') {            
	
            input.attr('type', 'text');        
	
        } else {            
	
            input.attr('type', 'password');        
	
        }    
	
    });

    });

        </script>  

</body>
</html>