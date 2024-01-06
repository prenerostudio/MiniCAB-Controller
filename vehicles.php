<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        	
		<div class="col">            								
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				Vehicle Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-vehicle">  											
					<i class="ti ti-user-plus"></i>                    					
					Add New Vehicle                  					
				</a>                  				
				<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-vehicle" aria-label="Create new report">                    				
					<i class="ti ti-bookmark-plus"></i>                  					
				</a>                				
			</div>              			
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">			      	
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">All Vehicle List</h3>
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-booker" class="table-responsive">                  					
						<table class="table">                    						
							<thead>                      							
								<tr>									
									<th>									
										<button class="table-sort" data-sort="sort-id">ID</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-date">Image</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-time">Name</button>
									</th>                       									
									<th>									
										<button class="table-sort" data-sort="sort-passenger">Seat</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-pickup">Air Bags</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Wheel Chair</button>
									</th>
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Baby Sitter</button>
									</th>
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Price</button>
									</th>							
									<th>									
										<button class="table-sort">Actions</button>
									</th>                      									
								</tr>                   								
							</thead>                  							
							<tbody class="table-tbody">												
								<?php																		
								$x=0;																
								$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");								
								while($vrow = mysqli_fetch_array($vsql)){
									$x++;									
								?>								
								<tr>                        								
									<td class="sort-id">
										<?php echo $x; ?>
									</td>
									<td class="sort-date">									
										<?php																
									if (!$vrow['v_img']) {
										?>																	
										<img src="img/car-icon.png" alt="Vehicle Img" style="width: 80px; height: 80px; border-radius: 50px;">	
										<?php
									} else{															
										?>																
										<img src="img/vehicles/<?php echo $vrow['v_img'];?>" alt="Vehicle Img" style="width: 80px; height: 80px; border-radius: 50px;">
										<?php
									}			
										?>											
									</td>                       										
									<td class="sort-time">
										<?php echo $vrow['v_name']; ?>
									</td>                       										
									<td class="sort-passenger">
										<?php echo $vrow['v_seat']; ?>
									</td> 
									<td class="sort-pickup">									
										<?php 
									if ($vrow['v_airbags'] == 1) {
										?>    
										<p style="color: yellowgreen; font-size: 14px; font-weight: 700;">Yes</p>
										<?php
									} else {
										?>    
										<p style="color: red; font-size: 14px; font-weight: 700;">No</p>
										<?php
									}
										?>									
									</td>                       										
									
									<td class="sort-drpoff">							
										<?php										
									if ($vrow['v_wchair'] == 1) {
										?>    
										<p style="color: yellowgreen; font-size: 14px; font-weight: 700;">Yes</p>
										<?php
									} else {
										?>    
										<p style="color: red; font-size: 14px; font-weight: 700;">No</p>
										<?php
									}
										?>										
									</td>									
									<td class="sort-drpoff">									
										<?php								
									if ($vrow['v_babyseat'] == 1) {
										?>    										
										<p style="color: yellowgreen; font-size: 14px; font-weight: 700;">Yes</p>
										<?php
									} else {
										?>    
										<p style="color: red; font-size: 14px; font-weight: 700;">No</p>
										<?php
									}
										?>										
									</td>
									<td class="sort-drpoff">											
											<button class="btn">£ <?php echo $vrow['v_pricing']; ?></button>								
									</td>	
									<td> 									
										<a href="view-vehicle.php?v_id=<?php echo $vrow['v_id']; ?>">
											<button class="btn btn-info">
												<i class="ti ti-eye"></i>View
											</button>												
										</a>

										<a href="del-vehicle.php?v_id=<?php echo $vrow['v_id']; ?>">
											<button class="btn btn-danger">
												<i class="ti ti-square-rounded-x"></i>Delete
											</button>				
										</a>										
									</td>									
								</tr>								
								<?php								
								}								
								?>                                       								
							</tbody>                 							
						</table>                						
					</div>                  					
				</div>                                                    				
			</div>              			
		</div>		
	</div>
</div>        
<script>	
	document.addEventListener("DOMContentLoaded", function() {    		
		const list = new List('table-default', {      					
			sortClass: 'table-sort',      							
			listClass: 'table-tbody',      							
			valueNames: [ 'sort-id', 'sort-date', 'sort-time', 'sort-fare',						 
						 'sort-driver'						
						]					
		}); 			
	})	
</script>

<!-------------------------------
----------Add Vehicle-------------
-------------------------------->

<div class="modal modal-blur fade" id="modal-vehicle" tabindex="-1" role="dialog" aria-hidden="true">

	<div class="modal-dialog modal-lg" role="document">    	
	
		<div class="modal-content">        		
		
			<div class="modal-header">            			
			
				<h5 class="modal-title">Add New Vehicle</h5>            				
				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			
			</div> 
			
			<form method="post" enctype="multipart/form-data" action="vehicle-process.php" onsubmit="return validateForm();">			
			
				<div class="modal-body">								
				
					<div class="row">              					
								
					
						<div class="mb-3">              					
						
							<label class="form-label">Vehicle Name</label>              					
							
							<input type="text" class="form-control" name="vname" placeholder="Vehicle Name">            				
							
						</div> 						
						                
						
						<div class="mb-3">                  							
						
							<label class="form-label">No. of Seats</label>              					
							
							<input type="number" class="form-control" name="seats">
							
						</div>             				
					           				
					             					
										
							
						
						<div class="mb-3">
    
							<label class="form-check form-switch">
        
								<input class="form-check-input" type="checkbox" name="bags" value="1">
        
								<span class="form-check-label">Air Bags</span>
    
							</label>

						</div>


						<div class="mb-3">
    
							<label class="form-check form-switch">
        
								<input class="form-check-input" type="checkbox" name="wchair" value="1">
        
								<span class="form-check-label">Wheel Chair</span>
    
							</label>

						</div>


						<div class="mb-3">
    
							<label class="form-check form-switch">
        
								<input class="form-check-input" type="checkbox" name="babyc" value="1">
        
								<span class="form-check-label">Baby Carriers</span>
    
							</label>

						</div>         					
					          				
				             					
									
							
						<div class="mb-3">                  							

						
							<label class="form-label">Pricing </label>              					
							
							<input type="number" class="form-control" name="pricing">      						
							
						</div> 					
					                
						
						<div class="mb-3">                  							
						
							<label class="form-label">Image</label>              					
							
							<input type="file" class="form-control" name="v_img">      						
							
						</div>             					
					           				
					
					</div>														          				          
				
				</div>          							        			
				
				<div class="modal-footer">           
				
					<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 
					
						<i class="ti ti-circle-x"></i>
						
						Cancel           				
					
					</a>           				
					
					<button type="submit" class="btn ms-auto btn-success">						
						<i class="ti ti-car-garage"></i>
						Add Vehicles						
					</button>       			
				</div> 								
			</form>		
			<script>
    function validateForm() {
        // Perform your form validation here
        var vnameInput = document.getElementsByName("vname")[0].value;
        var seatsInput = document.getElementsByName("seats")[0].value;
        var pricingInput = document.getElementsByName("pricing")[0].value;
		
		

        if (vnameInput === "" || seatsInput === "" || pricingInput === "") {
            // Display an error message or prevent the form submission
            alert("Please fill in all required fields.");
            return false;
        }

        // If validation passes, you can proceed with the form submission
        return true;
    }
</script>
		</div>      	
	</div>    
</div>   



<?php
include('footer.php');
?>