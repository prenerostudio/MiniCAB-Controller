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
			
				Users Section                				
			
			</h2>              			
		
		</div>		
		
		<div class="col-auto ms-auto d-print-none">            		
		
			<div class="btn-list">                			
			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-user">  											
				
					<i class="ti ti-user-plus"></i>                    					
					
					Add New User                  					
				
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
				
					<h3 class="card-title">All Users List</h3>
				
				</div>                  				
				
				<div class="card-body border-bottom py-3">				
				
					<div id="table-customer" class="table-responsive">                  					
					
						<table class="table">                    						
						
							<thead>                      							
							
								<tr>									
								
									<th>									
									
										<button class="table-sort">ID</button>
									
									</th>                        									

									<th>									

										<button class="table-sort">Image</button>
									
									</th>                        									

									<th>									

										<button class="table-sort" data-sort="sort-name">Name</button>
									
									</th>                       									

									<th>									

										<button class="table-sort" data-sort="sort-email">Email</button>
									
									</th>                        									

									<th>									

										<button class="table-sort" data-sort="sort-phone">Phone</button>
									
									</th>                        									

									<th>									

										<button class="table-sort" data-sort="sort-gender">Gender</button>
									
									</th>									

									<th>									

										<button class="table-sort">Designation</button>
									
									</th>							

									<th>									

										<button class="table-sort">Actions</button>
									
									</th>                      									
								
								</tr>                   								
							
							</thead>                  							

							<tbody class="table-tbody">												
							
								<?php																		
								
								$x=0;																
								
								$usql=mysqli_query($connect,"SELECT users.*, countries.* FROM users, countries WHERE users.count_id = countries.count_id");	
								
								while($urow = mysqli_fetch_array($usql)){
								
									$x++;									
								
								?>								
								
								<tr>                        								
								
									<td class="sort-id">
									
										<?php echo $x; ?>
									
									</td>
									
									<td class="sort-date">									
									
										<?php																
									
									if (!$urow['user_pic']) {
									
										?>																	

										<img src="img/user-1.jpg" alt="User Img" style="width: 80px; height: 80px; border-radius: 5px;">	
										<?php
									} else{															
										?>																
										<img src="img/users/<?php echo $urow['user_pic'];?>" alt="User Img" style="width: 80px; height: 80px; background-size: 100% 100%; border-radius: 5px;">
										<?php
									}			
										?>											
									</td>                       										
									<td class="sort-time">
										<?php echo $urow['first_name']; ?> <?php echo $urow['last_name']; ?>
									</td>                       										
									<td class="sort-passenger">
										<?php echo $urow['user_email']; ?>
									</td>  										
									<td class="sort-pickup">
										<?php echo $urow['user_phone']; ?>
									</td>                       										
									<td class="sort-drpoff">
										<?php echo $urow['user_gender']; ?>
									</td>										
									<td class="sort-drpoff">											
										<?php echo $urow['designation']; ?>							
									</td>	
									<td> 									
										<a href="view-customer.php?user_id=<?php echo $urow['user_id']; ?>">
											<button class="btn btn-info">
												<i class="ti ti-eye"></i>View
											</button>												
										</a>

										<!--Delete Modal-->										
										<div class="modal modal-blur fade" id="modal-user-delete" tabindex="-1" role="dialog" aria-hidden="true">    										
											<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
												<div class="modal-content">            												
													<div class="modal-header">
                
													
														<h5 class="modal-title">Delete Customer</h5>
                
														
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            
													
													</div>
            
													
													<div class="modal-body">
                
														
														<p>Are you sure you want to delete Customer ?</p>

													
														
            
													
													</div>
            
													
													<div class="modal-footer">
                
														
														<button type="button" class="btn btn-success" data-bs-dismiss="modal">
                    
															
															Cancel
                
														
														</button>
                
														
														<button type="button" class="btn ms-auto btn-danger"  id="deleteCustomerBtn">
                    
															Yes
                
														</button>
            
													</div>
        
												</div>
    
											</div>

										</div>

										<!--End Delete Modal-->

										<button class="btn btn-danger delete_btn" data-user_id="<?php echo $urow['user_id']; ?>" data-bs-toggle="modal" data-bs-
												target="#modal-user-delete">
    
											<i class="ti ti-square-rounded-x"></i>
    
											Delete

										</button>

									

									
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
		const list = new List('table-customer', {      					
			sortClass: 'table-sort',      							
			listClass: 'table-tbody',      							
			valueNames: [ 'sort-name', 'sort-email', 'sort-phone', 'sort-gender'						
						]					
		}); 			
	})	
	$(document).ready(function() {
    $('#modal-user-delete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var userId = button.data('user_id');
        var modal = $(this);

        $('#deleteCustomerBtn').click(function() {
            $.ajax({
                url: 'del-customer.php',
                type: 'GET', // or 'POST' based on your server-side handling
                data: { user_id: userId },
                success: function(response) {
                    console.log('Deletion successful');
                    $('#modal-user-delete').modal('hide');
                    location.reload(); // Refresh the page after successful deletion
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
    });
});
</script>


<!-------------------------------
----------Add Customer-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-user" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New User</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 			
			<form method="post" action="customer-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">
				<div class="modal-body">								
					<div class="row">				
						<div class="mb-3 col-md-4">              					
							<label class="form-label">First Name</label>              					
							<input type="text" class="form-control" name="fname" placeholder="First Name" required> 				
						</div> 
						<div class="mb-3 col-md-4">              					
							<label class="form-label">Last Name</label>              					
							<input type="text" class="form-control" name="lname" placeholder="Last Name" required> 				
						</div> 
						<div class="mb-3 col-md-4">                  
							<label class="form-label">Email</label>              					
							<input type="email" class="form-control" name="uemail" placeholder="hello@example.com" required>
						</div>			
						<div class="mb-3 col-md-4">                  						
							<label class="form-label">Phone</label>              					
							<input type="text" class="form-control" name="uphone" placeholder="+44 20 7123 4567" required>
						</div>							
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Gender</label>
							<select class="form-select" name="ugender" required>
								<option value="" selected>Select Gender</option>
								<option>Male</option>																
								<option>Female</option>								
								<option>Transgender</option>							
							</select>             																
						</div>	
						
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Designation</label>
							<select class="form-select" name="ugender" required>
								<option value="" selected>Select Designation</option>
								<option>Administrator</option>		
								<option>Acount Manager</option>								
								<option>Acountant</option>							
							</select>             																
						</div>	
						
						<div class="mb-3 col-md-12">                 															
									<label class="form-label">Address</label>								
									<textarea class="form-control" rows="3" name="caddress"></textarea>
								</div> 
						
						<div class="mb-3 col-md-4">                  						
							<label class="form-label">City</label>              					
							<input type="text" class="form-control" name="ucity" placeholder="Enter City Name">
						</div>							
						<div class="mb-3 col-md-4">              															
							<label class="form-label">State</label>
							<input type="text" class="form-control" name="ustate" placeholder="Enter State">            																
						</div>	
						
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Country</label>
							<select class="form-select" name="count_id" required>
								<option value="" selected>Select Country</option>
								
								<?php																						
															
	
	
								$lsql=mysqli_query($connect,"SELECT * FROM `countries`");								
	
										   while($lrow = mysqli_fetch_array($lsql)){										
											   
											   
												
										?>											
										
										<option value="<?php echo $lrow['count_id'] ?>">																	
										
											<?php echo $lrow['country_name'] ?>																
											
										</option>								
										
										<?php																									
										
										   }																										
											
										?>								
							</select>             																
						</div>
						
						
						
												
						<div class="mb-3 col-md-4">              											
							<label class="form-label">Postal Code</label>									
							<input type="text" class="form-control" name="pc" placeholder="xx xxx">
						</div> 					              											
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">Picture</label>							
							<input type="file" class="form-control" name="upic">						
						</div>
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">National ID</label>							
							<input type="text" class="form-control" name="uni">						
						</div>             																					
					</div>						         												
					       							
					<div class="modal-footer">           				
						<a href="#" class="btn btn-danger" data-bs-dismiss="modal"> 
						<i class="ti ti-circle-x"></i>
						Cancel           				
					</a>           																					
						<button type="submit" class="btn ms-auto btn-success">
							<i class="ti ti-user-plus"></i> 						
							Add User 											
						</button>					     							
					</div> 							
					</form>		
				
				<script>
    function validateForm() {
        // Perform your form validation here
        var cnameInput = document.getElementsByName("cname")[0].value;
        var cemailInput = document.getElementsByName("cemail")[0].value;
        var cphoneInput = document.getElementsByName("cphone")[0].value;
		var cgenderInput = document.getElementsByName("cgender")[0].value;
		var pcInput = document.getElementsByName("pc")[0].value;

        if (cnameInput === "" || cemailInput === "" || cphoneInput === "" || cgenderInput === "" || pcInput === "") {
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