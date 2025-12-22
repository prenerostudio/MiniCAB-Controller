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

<!-- DataTables Core + Bootstrap 5 Integration -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<!-- DataTables Responsive Extension -->
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap5.min.css">
<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>
<!-- DataTables Buttons Extension -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.bootstrap5.min.css">
<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.flash.min.js"></script>
<!-- FixedHeader Extension -->
<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.4.0/css/fixedHeader.bootstrap5.min.css">
<script src="https://cdn.datatables.net/fixedheader/3.4.0/js/dataTables.fixedHeader.min.js"></script>
<!-- Export Dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<!-- DataTables Initialization -->
<!-- comment -->
<!--<script src="js/demo.datatable-init.js"></script>-->
<script src="js/datatable-init.js"></script>
<!-- Tabler + Other Libraries -->
<script src="libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="libs/jsvectormap/dist/js/jsvectormap.min.js"></script>
<script src="libs/jsvectormap/dist/maps/world.js"></script>
<script src="libs/jsvectormap/dist/maps/world-merc.js"></script>
<script src="libs/list.js/dist/list.min.js"></script>
<!-- Tabler Core JS -->
<script src="js/tabler.min.js"></script>
<script src="js/demo.min.js"></script>
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