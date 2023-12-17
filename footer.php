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
					
					
					
					
					
					</div>
					
					
					<div class="row">              					
						<div class="col-lg-4">				
							<div class="mb-3">              					
								<label class="form-label">Pickup </label>              					
								<input type="text" class="form-control" name="pickup" id="pickup" oninput="updateMap()">            				
							</div>
							
							<div class="mb-3">              												
										<label class="form-label">No. of Passenger</label>				
										<input type="number" class="form-control" name="passenger">				 						
									</div> 
							<div class="mb-3">                 							
								<label class="form-label">Special Note</label>                  															
								<textarea class="form-control" rows="3" name="note"></textarea>               													
							</div> 
							
							<div class="mb-3">                  							
										<label class="form-label">Pickup Date</label>							
										<input type="date" class="form-control" name="pdate">      						
									</div>	
							
							
							
							
							
						</div>              					
						<div class="col-lg-4">                
							<div class="mb-3">                  							
								<label class="form-label">Destination</label>              					
								<input type="text" class="form-control" name="destination" id="dropoff" oninput="updateMap()">      						
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
							
							<div class="mb-3">                  													
										<label class="form-label">Luggage</label>              												
										<input type="text" class="form-control" name="luggage">      												
									</div>   
							
							
							<div class="mb-3">                  							
										<label class="form-label">Pickup Time</label>              					
										<input type="time" class="form-control" name="ptime">      						
									</div>	
							
							
							
						</div>  
						<div class="col-lg-4">  
							
							<div class="mb-3">                  							
										
								<label class="form-label">Distance </label>              					
										
								<input type="text" class="form-control" name="dis">      						
									
							</div>	
							
							<div class="mb-3">                  							
										
								<label class="form-label">Jouney Fare</label>              					
										
								<input type="text" class="form-control" name="fare">      						
									
							</div>	
							
							
						</div>
						

  
					</div>								
					<div class="row">              
					             					
						<div class="col-lg-6"> 
							<h4>Passenger Details:</h4>						
							<div class="mb-3">
    <label class="form-label">Name</label>
    <select class="form-control" name="c_id" id="clientSelect">
        <option value="">Select Customer</option>
        <?php
        $clsql = mysqli_query($connect, "SELECT * FROM `clients`");
        while ($clrow = mysqli_fetch_array($clsql)) {
            ?>
            <option value="<?php echo $clrow['c_id'] ?>"><?php echo $clrow['c_name'] ?></option>
            <?php
        }
        ?>
    </select>
</div>

<div class="mb-3">
    <label class="form-label">Customer Phone</label>
    <input type="text" class="form-control" name="cphone" id="customerPhone" readonly>
</div>

<div class="mb-3">
    <label class="form-label">Customer Email</label>
    <input type="text" class="form-control" name="cemail" id="customerEmail" readonly>
</div>

<script>
    var clientSelect = document.getElementById('clientSelect');
    var customerPhoneInput = document.getElementById('customerPhone');
    var customerEmailInput = document.getElementById('customerEmail');

    clientSelect.addEventListener('change', function () {
        var selectedClientId = clientSelect.value;

        $.ajax({
            type: 'POST',
            url: 'get_customer_details.php',
            data: { c_id: selectedClientId },
            success: function (response) {
                var data = JSON.parse(response);
                customerPhoneInput.value = data.phone;
                customerEmailInput.value = data.email;
            },
            error: function () {
                // Handle error if needed
            }
        });
    });
</script>


													
				
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
						<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>
						Cancel           									
					</a>           																			
					<button type="submit" class="btn btn-success ms-auto" data-bs-dismiss="modal">												
						<i class="ti ti-message-plus" style="margin-right: 10px; font-size: 20px;"></i>						
						Save Booking  											
					</button>					     							
				</div> 							
			</form>		
		</div>      	
	</div>    
</div>
<!-- Libs JS -->    
<script src="libs/apexcharts/dist/apexcharts.min.js" defer></script>  
<script src="libs/jsvectormap/dist/js/jsvectormap.min.js" defer></script>  
<script src="libs/jsvectormap/dist/maps/world.js" defer></script> 
<script src="libs/jsvectormap/dist/maps/world-merc.js" defer></script>
<!-- Tabler Core -->
<script src="js/tabler.min.js" defer></script> 
<script src="js/demo.min.js" defer></script> 
<script src="js/simple-datatables/simple-datatables.js"></script>  
</body>
</html>