<?php
include('header.php');	
?> 
<div class="page-header d-print-none page_padding pb-3">		   		
	<div class="row g-2 align-items-center">        	
		<div class="col">            								
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				Pricing Section                				
			</h2>              			
		</div>			
	</div>	
</div>
 <script>      
	 function updateValues() {       
		 var input1_4p = parseFloat(document.getElementsByName("1-4p")[0].value);         
		 var percentage_1_4e = 1.2;  // 20%         
		 var percentage_5_6p = 1.3;  // 30%         
		 var percentage_7p = 1.4;    // 10%		
		 var percentage_8p = 1.5;    // 10%		
		 var percentage_9p = 1.6;    // 10%		
		 var percentage_10_14p = 1.7;		
		 var percentage_15_16p = 1.8;// 10%
            			         
		 // Perform calculations         
		 var result_1_4e = input1_4p * percentage_1_4e;         
		 var result_5_6p = input1_4p * percentage_5_6p;         
		 var result_7p = input1_4p * percentage_7p;		
		 var result_8p = input1_4p * percentage_8p;		
		 var result_9p = input1_4p * percentage_9p;
		 var result_10_14p = input1_4p * percentage_10_14p;		
		 var result_15_16p = input1_4p * percentage_15_16p;           
			      
		 // Update readonly input fields         
		 document.getElementsByName("1-4e")[0].value = result_1_4e.toFixed(2);         
		 document.getElementsByName("5-6p")[0].value = result_5_6p.toFixed(2);         
		 document.getElementsByName("7p")[0].value = result_7p.toFixed(2);		
		 document.getElementsByName("8p")[0].value = result_8p.toFixed(2);		
		 document.getElementsByName("9p")[0].value = result_9p.toFixed(2);		
		 document.getElementsByName("10_14p")[0].value = result_10_14p.toFixed(2);		
		 document.getElementsByName("15_16p")[0].value = result_15_16p.toFixed(2);                 
	 }   
</script>
<div class="row row-deck row-cards">          
	<div class="col-md-12">	
		<div class="card">		
			<div class="card-header">			
				<ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">				
					<li class="nav-item">					
						<a href="#tabs-mile" class="nav-link active" data-bs-toggle="tab">							
							<i class="ti ti-brand-speedtest" style="font-size: 28px;"></i>
							Price Per Mile						
						</a>										
					</li>					
					<li class="nav-item">					
						<a href="#tabs-loc" class="nav-link" data-bs-toggle="tab">						
							<i class="ti ti-map-pin" style="font-size: 28px;"></i>							
							Location Prices					
						</a>                     					
					</li>  
					<li class="nav-item">                       					
						<a href="#tabs-post" class="nav-link" data-bs-toggle="tab">
							<i class="ti ti-map-search" style="font-size: 28px;"></i>
							Postcode Area Prices					
						</a>                     					
					</li>  					
					<li class="nav-item">                       					
						<a href="#tabs-meet" class="nav-link" data-bs-toggle="tab">    						
							<i class="ti ti-route-alt-left" style="font-size: 28px;"></i>
							Meet & Greet Charges					
						</a>                     					
					</li> 
					<li class="nav-item">                       					
						<a href="#tabs-dates" class="nav-link" data-bs-toggle="tab">
							<i class="ti ti-route-alt-left" style="font-size: 28px;"></i>
							Special Dates					
						</a>                     					
					</li> 
					<li class="nav-item">                       					
						<a href="#tabs-peak" class="nav-link" data-bs-toggle="tab">
							<i class="ti ti-route-alt-left" style="font-size: 28px;"></i>
							Peak Hours					
						</a>                     					
					</li> 
				</ul>
			</div>
															
			<div class="card-body">
				<div class="tab-content">
					<div class="tab-pane active show" id="tabs-mile">					
						<?php
							include('price-by-mile.php')					
						?>																	
					</div>
					<div class="tab-pane" id="tabs-loc">					
						<?php					
							include('price-by-location.php')					
						?>																										
					</div>					
					<div class="tab-pane" id="tabs-post">
						<?php					
							include('postcode-price.php')					
						?>											
					</div>
					<div class="tab-pane" id="tabs-meet">
						<?php					
							include('meet-greet-price.php')					
						?>																	
					</div>																	
					<div class="tab-pane" id="tabs-dates">
						<?php					
							include('special-date-price.php')					
						?>										
					</div>													
					<div class="tab-pane" id="tabs-peak">                    												
						<?php					
							include('peak-hours-price.php')					
						?>                      										
					</div>															
				</div>                							
			</div>             		
		</div>           
	</div>
</div>
<?php
include('footer.php');
?>