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
				<a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-user">
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
						<table class="table table-responsive" id="table-user">
							<thead>										
								<tr>		
									<th> ID </th>		
									<th> Image </th>			
									<th> Name </th>		
									<th> Email </th>			
									<th> Phone </th>			
									<th> Gender </th>									
									<th> Designation </th>							
									<th> Actions </th>
								</tr>		
							</thead>                  							
							<tbody class="table-tbody">							
								<?php
								$x=0;								
								$usql=mysqli_query($connect,"SELECT users.*, countries.* FROM users JOIN countries ON users.country_id = countries.country_id WHERE users.designation <> 'Owner'");
								while($urow = mysqli_fetch_array($usql)){
									$x++;
								?>																
								<tr>						
									<td>									
										<?php echo $x; ?>									
									</td>									
									<td>
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
									<td>
										<?php echo $urow['first_name']; ?> 
										<?php echo $urow['last_name']; ?>
									</td>
									<td>
										<?php echo $urow['user_email']; ?>
									</td>  										
									<td>
										<?php echo $urow['user_phone']; ?>
									</td>	
									<td>
										<?php echo $urow['user_gender']; ?>
									</td>										
									<td>											
										<?php echo $urow['designation']; ?>							
									</td>	
									<td>						
										<a href="view-user.php?user_id=<?php echo $urow['user_id']; ?>" class="btn btn-info">
											<i class="ti ti-eye"></i>
											View		
										</a>										
										<a class="btn btn-danger delete_btn" href="#">
											<i class="ti ti-square-rounded-x"></i>										
											Delete										
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
    $('#table-user').DataTable();
});
</script>

<!-------------------------------
----------Add User-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-user" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New User</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 			
			<form method="post" action="user-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">
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
							<label class="form-label">Phone</label>              					
							<input type="text" class="form-control" name="uphone" placeholder="+44 20 7123 4567" required>
						</div>	
						<div class="mb-3 col-md-6">                  
							<label class="form-label">Email</label>              					
							<input type="email" class="form-control" name="uemail" placeholder="hello@example.com" required>
						</div>
						<div class="mb-3 col-md-6">                  
							<label class="form-label">Password</label>
							<input type="password" class="form-control" name="upass" placeholder="xxxxxxxx" required>
						</div>					
						<div class="mb-3 col-md-6">				
							<label class="form-label">Gender</label>
							<select class="form-select" name="ugender" required>
								<option value="" selected>Select Gender</option>
								<option>Male</option>		
								<option>Female</option>								
								<option>Transgender</option>						
							</select>	
						</div>							
						<div class="mb-3 col-md-6">				
							<label class="form-label">Designation</label>
							<select class="form-select" name="udesig" required>
								<option value="" selected>Select Designation</option>
								<option>Administrator</option>		
								<option>Acount Manager</option>								
								<option>Acountant</option>							
							</select>
						</div>	
						<div class="mb-3 col-md-12">							
							<label class="form-label">Address</label>
							<textarea class="form-control" rows="3" name="uaddress"></textarea>
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
							<select class="form-select" name="country_id" required>
								<option value="" selected>Select Country</option>
								<?php								
								$lsql=mysqli_query($connect,"SELECT * FROM `countries`");
								while($lrow = mysqli_fetch_array($lsql)){
								?>
								<option value="<?php echo $lrow['country_id'] ?>">
									<?php echo $lrow['country_name']; ?>
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
				</div> 					
			</form>									
			<script>					
				function validateForm() {						    						
					var fnameInput = document.getElementsByName("fname")[0].value;					
					var lnameInput = document.getElementsByName("lname")[0].value;					
					var uemailInput = document.getElementsByName("uemail")[0].value;
					var upassInput = document.getElementsByName("upass")[0].value;					
					var uphoneInput = document.getElementsByName("uphone")[0].value;
					var ugenderInput = document.getElementsByName("ugender")[0].value;
					var pcInput = document.getElementsByName("pc")[0].value;
					if (fnameInput === "" || lnameInput === "" || uphoneInput === "" || uemailInput === "" || upassInput === "" || ugenderInput === "" || pcInput === "") {
						alert("Please fill in all required fields.");
						return false;     						
					}      						     					
					return true;   					
				}
			</script>		
		</div>
	</div>		
</div>
<?php
include('footer.php');
?>