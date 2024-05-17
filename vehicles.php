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
	</div>	
</div>
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">			      			
		<div class="col-8">            							
			<div class="card">                										
				<div class="card-header">                    													
					<h3 class="card-title">
						All Vehicle List
					</h3>				
				</div>                  								
				<div class="card-body border-bottom py-3">									
					<div id="table-booker" class="table-responsive">                  										
						<table class="table">                    													
							<thead>                      															
								<tr>																		
									<th>																			
										<button class="table-sort" data-sort="sort-id">
											ID
										</button>									
									</th>
									<th>										
										<button class="table-sort" data-sort="sort-date">
											Image
										</button>									
									</th>									
									<th>										
										<button class="table-sort" data-sort="sort-time">
											Vehicle Name
										</button>
									</th>                       									
									<th>									
										<button class="table-sort" data-sort="sort-passenger">
											Seat
										</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-pickup">
											Air Bags
										</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">
											Wheel Chair
										</button>
									</th>
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">
											Baby Sitter
										</button>
									</th>
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">
											Price
										</button>
									</th>							
									<th>									
										<button class="table-sort">
											Actions
										</button>
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
										<p style="color: yellowgreen;">Yes</p>
										<?php
											} else {
										?>    
										<p style="color: red;">No</p>
										<?php
											}
										?>									
									</td>									
									<td class="sort-drpoff">							
										<?php										
											if ($vrow['v_wchair'] == 1) {
										?>    
										<p style="color: yellowgreen;">Yes</p>
										<?php									
											} else {
										?>    
										<p style="color: red;">No</p>
										<?php									
											}
										?>										
									</td>									
									<td class="sort-drpoff">									
										<?php								
											if ($vrow['v_babyseat'] == 1) {
										?>    										
										<p style="color: yellowgreen;">Yes</p>
										<?php									
											} else {
										?>    
										<p style="color: red;">No</p>
										<?php									
											}
										?>										
									</td>									
									<td class="sort-drpoff" style="font-size: 18px;">											
										£										
										<?php echo $vrow['v_pricing']; ?>
									</td>									
									<td> 									
										<a href="view-vehicle.php?v_id=<?php echo $vrow['v_id']; ?>" class="btn btn-info" title="View / Edit">	
											<i class="ti ti-eye"></i>
										</a>
										<a href="del-vehicle.php?v_id=<?php echo $vrow['v_id']; ?>" class="btn btn-danger" title="Delete Vehicle">												
											<i class="ti ti-square-rounded-x"></i>										
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
		<div class="col-4">            								
			<div class="card">                										
				<div class="card-header">                    														
					<h3 class="card-title">						
						Add New Vehicle					
					</h3>				
				</div>                  								
				<div class="card-body border-bottom py-3">						
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
							<button type="reset" class="btn btn-danger">
								<i class="ti ti-circle-x"></i>
								Cancel
							</button>
							<button type="submit" class="btn ms-auto btn-success">						
								<i class="ti ti-car-garage"></i>						
								Save Vehicles					
							</button>       							
						</div> 											
					</form>					                  									
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
<?php
include('footer.php');
?>