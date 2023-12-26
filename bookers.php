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
				Bookers Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booker">  											
					<i class="ti ti-user-plus"></i>                    					
					Add New Booker                  					
				</a>                  				
				<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-booker" aria-label="Create new report">                    				
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
					<h3 class="card-title">All Bookers List</h3>
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
										<button class="table-sort" data-sort="sort-passenger">Email</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-pickup">Phone</button>
									</th>                        									
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Gender</button>
									</th>									
									<th>									
										<button class="table-sort" data-sort="sort-dropoff">Status</button>
									</th>							
									<th>									
										<button class="table-sort">Actions</button>
									</th>                      									
								</tr>                   								
							</thead>                  							
							<tbody class="table-tbody">												
								<?php																		
								$x=0;																
								$bsql=mysqli_query($connect,"SELECT bookers.* FROM bookers ORDER BY bookers.b_id DESC");								
								while($brow = mysqli_fetch_array($bsql)){
									$x++;									
								?>								
								<tr>                        								
									<td class="sort-id">
										<?php echo $x; ?>
									</td>
									<td class="sort-date">									
										<?php																
									if (!$brow['b_pic']) {
										?>																	
										<img src="img/user-1.jpg" alt="Booker Img" style="width: 60px; height: 60px; border-radius: 30px;">	
										<?php
									} else{															
										?>																
										<img src="img/bookers/<?php echo $brow['b_pic'];?>" alt="Booker Img" style="width: 60px; height: 60px; border-radius: 30px;">
										<?php
									}			
										?>											
									</td>                       										
									<td class="sort-time">
										<?php echo $brow['b_name']; ?>
									</td>                       										
									<td class="sort-passenger">
										<?php echo $brow['b_email']; ?>
									</td>  										
									<td class="sort-pickup">
										<?php echo $brow['b_phone']; ?>
									</td>                       										
									<td class="sort-drpoff">
										<?php echo $brow['b_gender']; ?>
									</td>										
									<td class="sort-drpoff">											
										<?php 											
									if($brow['acount_status']==0){
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
										<a href="view-booker.php?b_id=<?php echo $brow['b_id']; ?>">
											<button class="btn btn-info">
												<i class="ti ti-eye"></i>View
											</button>												
										</a>

										<a href="del-customer.php?b_id=<?php echo $brow['b_id']; ?>">
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
----------Add Booker-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-booker" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Booker</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div> 			
			<form method="post" action="booker-process.php" enctype="multipart/form-data">
				<div class="modal-body">								
					<div class="row">				
						<div class="mb-3 col-md-4">              					
							<label class="form-label">Full Name:</label>              					
							<input type="text" class="form-control" name="bname" placeholder="Customer Name" required> 				
						</div> 						               
						<div class="mb-3 col-md-4">                  
							<label class="form-label">Email:</label>              					
							<input type="text" class="form-control" name="bemail" placeholder="hello@example.com" required>
						</div>			
						<div class="mb-3 col-md-4">                  						
							<label class="form-label">Phone:</label>              					
							<input type="text" class="form-control" name="bphone" placeholder="+44 20 7123 4567" required>
						</div>							
						<div class="mb-3 col-md-4">              															
							<label class="form-label">Gender:</label>
							<select class="form-select" name="bgender">												
								<option value="" selected>Select Gender</option>
								<option>Male</option>																
								<option>Female</option>								
								<option>Transgender</option>							
							</select>             																
						</div>					               												
						<div class="mb-3 col-md-4">                  													
							<label class="form-label">Language:</label>							
							<select class="form-select" name="blang">							
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
							<label class="form-label">Postal Code:</label>									
							<input type="text" class="form-control" name="pc" placeholder="xx xxx">						
						</div> 					              											
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">Picture:</label>							
							<input type="file" class="form-control" name="bpic">						
						</div>
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">National ID:</label>							
							<input type="text" class="form-control" name="bni" placeholder="xxxxx xxxxxxx x">						
						</div>     
						<div class="mb-3 col-md-4">                  												
							<label class="form-label">Company Name:</label>							
							<input type="text" class="form-control" name="bcn">						
						</div> 
					</div>						         												
					<div class="modal-body">									
						<div class="row">
							<div class="col-12">												
								<div class="form-group mb-3">								
									<h3>									
										Booker Commision:										
									</h3>									
									<div class="d-flex align-items-center">									
										<div class="d-flex align-items-center">										
											<input type="radio" class="form-check-inline" id="radio" name="com_type" value="Percentage" onclick="showTextField()" required>
											<label for="radio" class="mb-0">											
												Percentage												
											</label>											
										</div>										
										<div class="d-flex align-items-center ms-4">										
											<input type="radio" id="radio2" class="form-check-inline" name="com_type" value="Fixed" onclick="showMessage()" >											
											<label for="radio2" class="mb-0">											
												Fixed												
											</label>											
										</div>										
									</div>									
								</div>								
							</div>							
							<div id="text-field" class="col-md-12" style="display: none;">							
								<div class="mb-3">								
									<input type="text" placeholder="% Percentage" name="percent" class="form-control">
								</div>								
							</div>							
							<div id="message" class="col-md-12" style="display: none;">							
								<div class="mb-3">								
									<input type="text" placeholder="00000" name="fixed" class="form-control">
								</div>								
							</div>							
							<script>							
								function showTextField() {								
									var textField = document.getElementById("text-field");									
									textField.style.display = "block"; 									
									var message = document.getElementById("message");									
									message.style.display = "none";									
								}								
								function showMessage() {								
									var textField = document.getElementById("text-field");									
									textField.style.display = "none";									
									var message = document.getElementById("message");									
									message.style.display = "block";									
								}								
							</script>							
							<div class="col-lg-12">
								<div class="mb-3">								
									<label class="form-label">Address</label>									
									<textarea class="form-control" rows="3" name="baddress"></textarea>
								</div> 																
								<div class="mb-3">                 							
									<label class="form-label">Others</label>								
									<textarea class="form-control" rows="3" name="bothers"></textarea>	
								</div> 						
							</div>   									
						</div>          							
					</div>        							
					<div class="modal-footer">           				
						<a href="#" class="btn btn-danger" data-bs-dismiss="modal">						
							Cancel           									
						</a>           																					
						<button type="submit" class="btn ms-auto btn-success" data-bs-dismiss="modal">
							<i class="ti ti-user-plus"></i> 						
							Add Customer  											
						</button>					     							
					</div> 							
					</form>								
				</div>      				
		</div>    
	</div>
<?php
include('footer.php');
?>