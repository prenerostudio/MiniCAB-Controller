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
				Customers Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-customer">
					<i class="ti ti-user-plus"></i>                    					
					Add New Customer                  					
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
					<h3 class="card-title">
						All Customers List
					</h3>
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-customer" class="table-responsive">                  					
						<table class="table" id="customers">                    						
							<thead>                      							
								<tr>									
									<th>ID</th>                        									
									<th>Image</th>  
									<th>PostCode</th> 
									<th>Name</th>                       									
									<th>Email</th>                        									
									<th>Phone</th>                        									
									<th>Gender</th>									
									<th>Status</th>							
									<th>Actions</th>                      									
								</tr>                   								
							</thead>                  							
							<tbody class="table-tbody">												
								<?php																							
								$csql=mysqli_query($connect,"SELECT clients.* FROM clients WHERE clients.account_type = 1 ORDER BY clients.c_id DESC");
								while($crow = mysqli_fetch_array($csql)){
								?>								
								<tr>                        								
									<td>
										<?php echo $crow['c_id']; ?>
									</td>
									<td>									
										<?php																
											if (!$crow['c_pic']) {
										?>																	
										<img src="img/user-1.jpg" alt="Customer Img" style="width: 50px; height: 50px; border-radius: 5px;">	
										<?php									
											} else{															
										?>										
										<img src="img/customers/<?php echo $crow['c_pic'];?>" alt="Customer Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">
										<?php									
											}			
										?>											
									</td> 
									<td>
										<?php echo $crow['postal_code']; ?>
									</td> 
									<td>
										<?php echo $crow['c_name']; ?>
									</td>                       										
									<td>
										<?php echo $crow['c_email']; ?>
									</td>  										
									<td>
										<?php echo $crow['c_phone']; ?>
									</td>                       										
									<td>
										<?php echo $crow['c_gender']; ?>
									</td>										
									<td>											
										<?php 											
											if($crow['acount_status']==0){
										?>												
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-red d-block"></span>
											<span>Unverified</span>									
										</div>
										<?php									
											} else{											
										?>
										<div class="col-auto status">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
											<span>Verified</span>											
										</div>			
										<?php									
											}
										?>									
									</td>	
									<td> 									
										<a href="view-customer.php?c_id=<?php echo $crow['c_id']; ?>">
											<button class="btn btn-info">
												<i class="ti ti-eye"></i>
												View
											</button>												
										</a>						
										<a href="del-customer.php?c_id=<?php echo $crow['c_id']; ?>">
											<button class="btn btn-danger">
												<i class="ti ti-square-rounded-x"></i>
												Delete
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
	$(document).ready(function() {
    $('#customers').DataTable();
});
</script>


<!-------------------------------
----------Add Customer-----------
-------------------------------->
<div class="modal modal-blur fade" id="modal-customer" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Customer</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 			
			<form method="post" action="customer-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">
				<div class="modal-body">
					<div class="row">					
						<div class="mb-3 col-md-4">              					
							<label class="form-label">Full Name</label>              					
							<input type="text" class="form-control" name="cname" placeholder="Customer Name" required>
						</div> 						               
						<div class="mb-3 col-md-4">                  
							<label class="form-label">Email</label>              					
							<input type="email" class="form-control" name="cemail" placeholder="hello@example.com" required>
						</div>			
						<div class="mb-3 col-md-4">                  						
							<label class="form-label">Phone</label>              					
							<input type="text" class="form-control" name="cphone" placeholder="+44 20 7123 4567" required>
						</div>	
						<div class="mb-3 col-md-4">              					
							<label class="form-label">Password</label>              					
							<input type="password" class="form-control" name="cpass" placeholder="xxxxxxxx" required>
						</div> 	
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Gender</label>
							<select class="form-select" name="cgender" required>
								<option value="" selected>Select Gender</option>
								<option>Male</option>																
								<option>Female</option>								
								<option>Transgender</option>							
							</select>             																
						</div>					               												
						<div class="mb-3 col-md-4">                  													
							<label class="form-label">Language</label>							
							<select class="form-select" name="clang">							
								<option value="" selected>Select Language</option>		      								
								<?php														
								$lsql=mysqli_query($connect,"SELECT * FROM `language`");								
								while($lrow = mysqli_fetch_array($lsql)){								
								?>			
								<option>								
									<?php echo $lrow['language'] ?>								
								</option>
								<?php
								}																		
								?>																			
							</select> 												
						</div>						
						<div class="mb-3 col-md-4">              											
							<label class="form-label">Postal Code</label>	
							<select class="form-control" name="pc">
								<option>Search PostCode</option>								
								<?php
								$pcsql=mysqli_query($connect,"SELECT * FROM `post_codes`");
								while($pcrow = mysqli_fetch_array($pcsql)){								
								?>			
								<option>								
									<?php echo $pcrow['pc_name'] ?>								
								</option>
								<?php
								}																		
								?>
							</select>														
						</div> 					              											
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">Picture</label>							
							<input type="file" class="form-control" name="cpic">						
						</div>
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">National ID</label>							
							<input type="text" class="form-control" name="cni">						
						</div>   
						
						<div class="col-lg-12">
							<div class="mb-3">
								<label class="form-label">Address</label>
								<textarea class="form-control" rows="3" name="caddress"></textarea>
							</div>							
							<div class="mb-3">
								<label class="form-label">Others</label>
								<textarea class="form-control" rows="3" name="cothers"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-danger" data-bs-dismiss="modal">
							<i class="ti ti-circle-x"></i>
							Cancel
						</a>
						<button type="submit" class="btn ms-auto btn-success">
							<i class="ti ti-user-plus"></i>
							Save Customer
						</button>
					</div>
					<script>
						function validateForm() {        							        
							var cnameInput = document.getElementsByName("cname")[0].value;        
							var cemailInput = document.getElementsByName("cemail")[0].value;        
							var cphoneInput = document.getElementsByName("cphone")[0].value;		
							var cgenderInput = document.getElementsByName("cgender")[0].value;		
							var pcInput = document.getElementsByName("pc")[0].value;
							        
							if (cnameInput === "" || cemailInput === "" || cphoneInput === "" || cgenderInput === "" || pcInput === "") {                        
								alert("Please fill in all required fields.");            
								return false;        
							}							        							        
							return true;    
						}
					</script>				
				</div> 
			</form>		
		</div>    	
	</div>
</div>	
<?php
include('footer.php');
?>