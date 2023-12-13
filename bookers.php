<?php
include('header.php');
?>          	
<div class="card">			
	<div class="card-header">				
		<h2 class="page-title">              		
			Bookers List             			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                  
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booker">    
					<i class="ti ti-user-plus" style="font-size: 16px; margin-right: 10px;"></i>                 
					Add New Booker                  
				</a>                                 
			</div>            
		</div>						
	</div>
            	
	<div class="card-body">            	
		<div id="table-default" class="table-responsive">            		
			<table class="table card-table table-vcenter text-nowrap datatable" id="b-table">                   								
				<thead>                   										
					<tr align="center">                          												
						<th class="w-1">ID</th>                         													
						<th class="w-1">Pic</th>                          													
						<th>Name</th>                         													
						<th>Phone</th>                         													
						<th>Gender</th>                         													
						<th>Language</th>                         													
						<th>National ID</th>							
						<th>Action</th>                       												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php																																
					$bsql=mysqli_query($connect,"SELECT * FROM `bookers`");					
					while($brow = mysqli_fetch_array($bsql)){							
					?>																		
					<tr align="center">                         											
						<td>													
							<?php echo $brow['c_id']; ?>													
						</td>                          													
						<td style="width: 10%;">							
							<?php							
						if (!$brow['b_pic']) {																
							?>																	
							<img src="img/clients/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">							
							<?php							
						} else{                                            						
							?>                                         							
							<img src="img/bookers/<?php echo $brow['b_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">				
							<?php                                         																						
						}                                          																							
							?>							
						</td>                        																	
						<td>																		
							<?php echo $brow['b_name']; ?>																	
						</td>                        																
						<td>                           														
							<?php echo $brow['b_phone']; ?>                     														
						</td>                         													
						<td>                          														
							<?php echo $brow['b_gender']; ?>                     														
						</td>                         													
						<td>                           														
							<?php echo $brow['b_language']; ?>                      														
						</td>                          													
						<td>                            														
							<?php echo $brow['b_ni']; ?>                        														
						</td>                 									
						<td class="text-end"> 
							
						
							<a href="booker-details.php?id=<?php echo $brow['b_id']; ?>">							
							<button class="btn align-text-top">View Details</button>
							</a>
							
							<a href="del-client.php?id=<?php echo $brow['b_id']; ?>">
							<button class="btn btn-danger align-text-top">Delete</button>
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



<!-------------------------------
----------Add Client-------------
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
					<div class="col-lg-6">
				<div class="mb-3">              
					<label class="form-label">Booker Name</label>              
					<input type="text" class="form-control" name="bname" placeholder="Booker Name">            
				</div> 
						</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  
							<label class="form-label">Email</label>              
					<input type="text" class="form-control" name="bemail" placeholder="hello@example.com">      
						</div>             
					</div>            
				</div>
				
				<div class="row">              
					<div class="col-lg-6">
				<div class="mb-3">              
					<label class="form-label">Password</label>              
					<input type="password" class="form-control" name="bpass" placeholder="xxxxxxxx">            
				</div> 
						</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  
							<label class="form-label">Phone</label>              
					<input type="text" class="form-control" name="bphone" placeholder="+44 xx xxxx xxxx">      
						</div>             
					</div>            
				</div>
								
				<div class="row">              										
					<div class="col-lg-6">										
						<div class="mb-3">              									
							<label class="form-label">Gender</label>              					                  												
							<select class="form-select" name="bgender">                    														
								<option value="" selected>Select Gender</option>                    														
								<option>Male</option>                    														
								<option>Female</option>  														
								<option>Transgender</option> 												
							</select>             										
						</div> 					
					</div>              					
					<div class="col-lg-6">                						
						<div class="mb-3">                  							
							<label class="form-label">Language</label>              					
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
					</div>            				
				</div>								
				<div class="row">              					
					<div class="col-lg-6">			
						<div class="mb-3">              					
							<label class="form-label">Postal Code</label>              												
							<input type="text" class="form-control" name="pc" placeholder="xx xxx">				 
						</div> 						
					</div>              					
					<div class="col-lg-6">                					
						<div class="mb-3">                  						
							<label class="form-label">Picture</label>              					
							<input type="file" class="form-control" name="bpic">      						
						</div>             					
					</div>            				
				</div>
												
				<div class="row">              				
					<div class="col-lg-6">				
						<div class="mb-3">              					
							<label class="form-label">Company Name</label>              					
							<input type="text" class="form-control" name="bcn" placeholder="Your Company Name">            				
						</div> 
					</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  						
							<label class="form-label">National ID</label>              					
							<input type="text" class="form-control" name="bni">        						
						</div>             									
					</div>            								
				</div>
				
				<div class="row">              				
					<div class="col-lg-6">				
						<div class="mb-3">              					
							<label class="form-label">Commission</label>              					
							<input type="text" class="form-control" name="com_percent" placeholder="%">            				
						</div> 
					</div>              
					<div class="col-lg-6">                
						<div class="mb-3">                  						
							<label class="form-label">Fix Commission</label>              					
							<input type="text" class="form-control" name="com_fixed" placeholder="xxxx">        						
						</div>             									
					</div>            								
				</div>
				
				<div class="row">              					             					
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Address</label>                  							
								<textarea class="form-control" rows="3" name="baddress"></textarea>               						
							</div>              					
						</div>   				
					</div>  
				<div class="row">              					             					
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Others</label>                  							
								<textarea class="form-control" rows="3" name="others"></textarea>               						
							</div>              					
						</div>   				
					</div>  
				</div>          			
				<div class="modal-body">				
					       			
				</div>        			
				<div class="modal-footer">           				
					<a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">   
						<i class="ti ti-circle-x" style="margin-right: 10px; font-size: 20px;"></i>
						Cancel           				
					</a>           				
				
						
					<button type="submit" class="btn btn-success ms-auto" data-bs-dismiss="modal">
						
						<i class="ti ti-user-plus" style="font-size: 16px; margin-right: 10px;"></i> 
						Save Booker  
						
					</button>
					     			
				</div> 				
			</form>		
		</div>      	
	</div>    
</div>

<script>  
	$(document).ready(function(){       
		$('#b-table').DataTable();   
	});   
	
		
</script> 


<?php
include('footer.php');
?>