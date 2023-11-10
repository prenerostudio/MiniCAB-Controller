<?php
include('header.php');

$d_id = $_GET['id'];
$dsql=mysqli_query($connect,"SELECT * FROM `driver_documents` WHERE `d_id`='$d_id'");											
$drow = mysqli_fetch_array($dsql);		
?> 
<div class="container-xl">           
	<div class="card">	
		<div class="row g-0">                    				
			<div class="col-12 col-md-12 d-flex flex-column">        						
				<div class="card-body">            								
					<h2 class="mb-4">Driver Profile</h2>      					
						<form action="upload.php" method="post" enctype="multipart/form-data">
							
							<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
					<div class="row">					
				
						<div style="width: 50%; float: left;">					
						
							<h3 class="card-title">
							
								Driver Licence Photo Card (Front)
						
							</h3>                				
					

							<div class="row align-items-center">                
						
							
								<div class="col-auto">
							
								
									<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						

								</div>                    					
						
							
								<div class="col-auto">	
									
									
									
									
										
										<input type="file" name="image" accept="image/*"  class="form-control">
										<input type="submit" value="Upload Image" name="submit"  class="btn">
    
									
									<a href="#" class="btn btn-ghost-danger">                         

									Delete Photo                       
							
								</a>	

								
									<!--<a href="#" class="btn">                    						

									Upload                        						
							
								</a>	-->				
						
							</div>                      					
						
							<div class="col-auto">						

												
						
							</div>                   				
					
						</div>

					</div>

					
					
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							Driver Licence Photo Card (Back)
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
					</div>
					</div>
					
					<div class="row" style="padding-top: 25px;">
					
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							Proof of National Insurance
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
					</div>
					
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							Proof of Basic Disclosure
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
					</div>
					
					</div>
						
							<div class="row" style="padding-top: 25px;">
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							Proof of Right To Work in the UK
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
					</div>
					
					
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							Passport
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
					</div>
					</div>
					
							
							<div class="row" style="padding-top: 25px;">
					<div style="width: 50%; float: left;">
					
						<h3 class="card-title">
							DVLA Check Results
						</h3>                				
					
						<div class="row align-items-center">                

							<div class="col-auto">
							
								
								<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['dl_front'];?>); background-size:cover; width: 220px; height: 160px;"></span>							
						
							</div>                    					
						
							<div class="col-auto">						
						
								<a href="#" class="btn">                    						
							
									Change avatar                        						
							
								</a>					
						
							</div>                      					
						
							<div class="col-auto">						
						
								<a href="#" class="btn btn-ghost-danger">                         
							
									Delete avatar                       
						
								</a>					
						
							</div>                   				
					
						</div>  
					
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