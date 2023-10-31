</div>
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
						<a href="#" class="link-secondary">
							License
						</a>
					</li>                 
					<li class="list-inline-item">
						<a href="#" target="_blank" class="link-secondary" rel="noopener">
							Source code
						</a>					
					</li>                 										               				
				</ul>             
			</div>              
			<div class="col-12 col-lg-auto mt-3 mt-lg-0">              
				<ul class="list-inline list-inline-dots mb-0">                
					<li class="list-inline-item">                    
						Copyright &copy; 2023                    
						<a href="#" class="link-secondary">Euro Data Technologies</a>.                    
						All rights reserved.                  
					</li>                  
					<li class="list-inline-item">
						<a href="#" class="link-secondary" rel="noopener">                      
							v1.0.0-beta20                    
						</a>                  
					</li>                
				</ul>              
			</div>            
		</div>        
	</div>    
</footer>
</div>	
</div>



<!-------------------------------
----------Add Booking-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-booking" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document" >    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Booking</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 			
			<form method="post" action="booking-process.php" enctype="multipart/form-data">
				<div class="modal-body">								
					<div class="row">              					
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Pickup </label>              					
								<input type="text" class="form-control" name="pickup">            				
							</div> 						
						</div>              					
						<div class="col-lg-6">                
							<div class="mb-3">                  							
								<label class="form-label">Destination</label>              					
								<input type="text" class="form-control" name="destination">      						
							</div>             					
						</div>            				
					</div>								
					<div class="row">              
						<div class="col-lg-6">				
							<div class="mb-3">              					
								<label class="form-label">Vehicle</label>              					
								<select class="form-select" name="v_id">			
									<option value="" selected>Select Vehicle</option>  						
									<?php														
									$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");																	
									while($vrow = mysqli_fetch_array($vsql)){																		
									?>
									<option value="<?php echo $vrow['v_id']; ?>">									
										<?php echo $vrow['v_name'] ?>								
									</option>								
									<?php																	
									}																		
									?>									 																			
								</select>            				
							</div> 												
							<div class="mb-3">                            
								<div class="form-label">Journey Type</div>                            
								<div>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="radio" name="journey_type" checked="" value="One Way">                                
										<span class="form-check-label">One Way</span>                              
									</label>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="radio" name="journey_type" value="Return">                                
										<span class="form-check-label">Return</span>                              
									</label>                             
								</div>                          
							</div>												
							<div class="row">              										
								<div class="col-lg-6">									
									<div class="mb-3">              												
										<label class="form-label">No. of Passenger</label>				
										<input type="number" class="form-control" name="passenger">				 						
									</div> 											
								</div>              										
								<div class="col-lg-6">                											
									<div class="mb-3">                  													
										<label class="form-label">Luggage</label>              												
										<input type="text" class="form-control" name="luggage">      												
									</div>             										
								</div>            								
							</div>					
							<div class="mb-3">                 							
								<label class="form-label">Special Note</label>                  															
								<textarea class="form-control" rows="3" name="note"></textarea>               													
							</div>  																									
						</div>              					
						<div class="col-lg-6"> 
							<h4>Passenger Details:</h4>						
							<div class="mb-3">                  
								<label class="form-label">Name</label>              												
								
								<select class="form-control" name="c_id">
									<option>Select Customer</option>
									<?php
									$clsql=mysqli_query($connect,"SELECT * FROM `clients`");																	
									while($clrow = mysqli_fetch_array($clsql)){	
									?>
									<option value="<?php echo $clrow['c_id'] ?>"><?php echo $clrow['c_name'] ?></option>
								<?php
									}
										?>
								
								</select>
							</div> 												
													
							<div class="row">
								<div class="col-md-6">						
									<div class="mb-3">                  							
										<label class="form-label">Pickup Date</label>							
										<input type="date" class="form-control" name="pdate">      						
									</div>							
								</div>
								<div class="col-md-6">						
									<div class="mb-3">                  							
										<label class="form-label">Pickup Time</label>              					
										<input type="time" class="form-control" name="ptime">      						
									</div>																															
								</div>							
							</div>						
							<!--<div class="mb-3">
								<div class="form-label">Bidding</div>                            
								<div>                              
									<label class="form-check form-check-inline">                                
										<input class="form-check-input" type="checkbox" name="bidding" value="Yes">                                
										<span class="form-check-label">Yes</span>                              
									</label>                              									
									<label class="form-check form-check-inline">                                									
										<input class="form-check-input" type="checkbox" name="bidding" value="No">                                
										<span class="form-check-label">No</span>                              
									</label>                              
								</div>                          
							</div>-->												
						</div>            									
					</div>					
				</div>          			
							      							
				<div class="modal-footer">           									
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">             											
						Cancel           									
					</a>           																			
					<button type="submit" class="btn ms-auto" data-bs-dismiss="modal">												
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>						
						Add New Booking  											
					</button>					     							
				</div> 							
			</form>		
		</div>      	
	</div>    
</div>




<!-- Libs JS -->    
<script src="libs/apexcharts/dist/apexcharts.min6a55.js?1695847769" defer></script>  
<script src="libs/jsvectormap/dist/js/jsvectormap.min6a55.js?1695847769" defer></script>  
<script src="libs/jsvectormap/dist/maps/world6a55.js?1695847769" defer></script> 
<script src="libs/jsvectormap/dist/maps/world-merc6a55.js?1695847769" defer></script>


<!-- Tabler Core -->
<script src="js/tabler.min.js" defer></script> 
<script src="js/demo.min.js" defer></script> 
<script src="js/simple-datatables/simple-datatables.js"></script>



  </body>
</html>