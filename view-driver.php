<?php
include('header.php');
$d_id = $_GET['d_id'];
$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id`='$d_id'");
$drow = mysqli_fetch_array($dsql);		
?>
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        	
		<div class="col">            								
			<div class="page-pretitle">                			
				Overview                				
			</div>                			
			<h2 class="page-title">                			
				View Driver Details              				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<?php
				if($drow['acount_status'] == 0){
					?>				
				<a href="update-customer-status.php?id=<?php echo $d_id ?>" class="btn btn-primary d-none d-sm-inline-block">									
					<i class="ti ti-checks"></i>                    
					
					Approve Driver                 
					
				</a>   
					<?php
				}else {
					
					?>
				
				<button class="btn btn-disable d-none d-sm-inline-block" disabled>  
					
				
					<i class="ti ti-checks"></i>                    
					
					Verified Driver                 
					
				</button>  
					<?php
					
				}
				
				?>
				
			              
					                
				
			</div>              
			
		</div>
		
	</div>	

</div>


<div class="page-body page_padding">          		
	<div class="row row-deck row-cards">			      	
		<div class="col-12">            					
			<div class="card">                															
				<div class="card-body border-bottom py-3">				
					<h2 class="mb-4">Customer Profile</h2>                									
					<h3 class="card-title">Profile Details</h3>
					<div class="row align-items-center">		
						<div class="col-auto">
							<span class="avatar avatar-xl" style="background-image: url(img/drivers/<?php echo $drow['d_pic'];?>); background-size:cover; width: 220px;
   height: 160px;"></span>							
						</div>                    					
						
						
												
							
						<div class="col-auto">						
						
						
												
						
							<form action="update-customer-img.php" method="post" enctype="multipart/form-data">
								
							
								<input type="hidden" value="<?php echo $drow['d_id']; ?>" name="c_id">
							
								
								
								<input type="file" name="fileToUpload" id="fileToUpload" class="btn">
								
								
								
								<button type="submit" class="btn btn-info">Upload Image </button>                       						
								
							 

							</form>				
					
												
							
						</div>                      					
					
												
						
						<div class="col-auto">						
							
													
						
							<a href="#" class="btn btn-ghost-danger">                         
								
														
							
								Delete avatar                       
							
													

							</a>					
						
												
							
						</div>                   				
					
											
						
					</div>                  				
					
					<h3 class="card-title mt-4">Business Profile</h3> 
					
					
					<form method="post" action="update-customer.php" enctype="multipart/form-data">
					
						<div class="row g-3">                
						
							<div class="col-md-4">					
							
								<div class="mb-3">                    						
								
									<div class="form-label">Customer Name</div>                        						
								
									<input type="hidden" class="form-control" value="<?php echo $drow['d_id']; ?>" name="c_id">  
								
									<input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="cname">  
							
								</div>                    					
							
								<div class="mb-3">                    						
								
									<div class="form-label">Email Address</div>                        						
								
									<input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="cemail" readonly>
							
								</div>                    					
							
								<div class="mb-3">                    						
								
									<div class="form-label">Phone</div>                        						
								
									<input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="cphone" readonly>                      
							
								</div>	
								<div class="mb-3">                    						
								<div class="form-label">Address</div>  
								<textarea class="form-control" rows="3" name="caddress"><?php echo $drow['d_address'] ?></textarea>								             
							</div>
						
							</div>																
						
							<div class="col-md-4">					
							
								<div class="mb-3">                    					
								<div class="form-label">Gender</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_gender']; ?>" name="cgender">  
							</div>                    					
							<div class="mb-3">                    						
								<div class="form-label">Language </div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_language']; ?>" name="clang">
							</div>														
							<div class="mb-3">                    						
								<div class="form-label">Postal Code</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['postal_code'] ?>" name="postal_code">                     
							</div>								
							<div class="mb-3">                    						
								<div class="form-label">Other Details</div>  
								<textarea class="form-control" rows="3" name="others"><?php echo $drow['others'] ?></textarea>								             
							</div>															
						</div>												
						<div class="col-md-4">					
							
							<div class="mb-3">                    						
								<div class="form-label">National ID</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['d_ni'] ?>" name="cni">                      					
							</div>                    																
							
							<div class="mb-3">                    					
								<div class="form-label">Date Registered</div>                        						
								<input type="text" class="form-control" value="<?php echo $drow['reg_date'] ?>" disabled>                     
							</div>
						</div>                    
					</div>                                       
					                                   
				</div>                 
				<div class="card-footer bg-transparent mt-auto">                 
					<div class="btn-list justify-content-end">                 
						<a href="drivers.php" class="btn">                  
							Cancel                  
						</a>                  
						 
							<button type="submit" class="btn btn-primary">Update</button>
						                    
					                  
					</div>                 
				</div>										
					</form>    
						
						
					</div>                                                    
				</div>              
			</div>
		</div>

</div>     


<?php
include('footer.php');
?>