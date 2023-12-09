<?php
include('header.php');

$d_id = $_GET['id'];
$dsql=mysqli_query($connect,"SELECT * FROM `drivers` WHERE `d_id`='$d_id'");
$drow = mysqli_fetch_array($dsql);		
?> 
<div class="container">
	<div class="row row-deck row-cards"> 			
		<div class="container-xl">           										
			<div class="card">															
				<div class="row g-0">                    																				
					<div class="col-12 col-md-12 d-flex flex-column">					
						<div class="card-body">
							<h2 class="mb-4">Driver Profile</h2>	
							<div class="row align-items-center">																			
								<div class="col-auto">												
									<span class="avatar avatar-xl" style="background-image: url(<?php echo $drow['d_pic'];?>);				  
																							  background-size:cover; width: 220px; height: 160px;"></span>										
								</div>
								<div class="col-auto">																			
									<form action="update-status.php" method="post">									
										<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">										
										<button type="submit" class="btn btn-info">Approve </button>										
									</form>
								</div>								
								<div class="col-auto">																					
									<a href="#" class="btn btn-ghost-danger">									
										Decline										
									</a>
								</div>								
							</div>                																				
							
							<h3 class="card-title mt-4">
								Profile Details | ID #: 
								<?php echo $drow['d_id']; ?>
							</h3>		
												
							<div class="row g-3">  
													
													
													
								<table class="table table-responsive">
								
									<tbody>
									
										<tr>
										
											<td>
												<strong>
													Driver Name:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['d_name'];?>
											</td>
														  
											<td>
												<strong>
													Email Address:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['d_email']; ?>
											</td>
											
											<td>
												<strong>
													Phone:
												</strong>
											</td>
												
											<td>
												<?php echo $drow['d_phone'];?>
											</td>
											
										</tr>
										
										<tr>
										
											<td>
												<strong>
													Gender:
												</strong>
											</td>
											
											<td>
												<?php echo $drow['d_gender'];?>
											</td>
											
											<td>
												<strong>
													Language:
												</strong>
											</td>
														
											<td>
												<?php echo $drow['d_language']; ?>
											</td>
															
											<td> 
												<strong>
													Vehicle:
												</strong>
											</td>
															
											<td>
												<?php																											
																	
												$vid=$drow['v_id'];																				
																	
												$vhsql=mysqli_query($connect,"SELECT * FROM `vehicles` WHERE `v_id`='$vid'");						
																	
												$vhrow = mysqli_fetch_array($vhsql);																				
																	
												echo $vhrow['v_name'];																				
																	
												?> 
															
											</td>
														
										</tr>
													
										<tr>
														
											<td>
												<strong>
													Skype Account:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['skype_acount'];?>
											</td>
														 
											<td>
												<strong>
													Special Remarks:
												</strong>
											</td>
														 
											<td>
												<?php echo $drow['d_remarks'];?>
											</td>
															 
											<td>
												<strong>
													Date Registered:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['driver_reg_date'];?>
											</td>
														
										</tr>
														
										<tr>
														
											<td>
												<strong>
													Licence:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['d_licence'];?>
											</td>
											
											<td>
												<strong>
													Licence Expiring Date:
												</strong>
											</td>
											
											<td>
												<?php echo $drow['d_licence_exp']; ?>
											</td>
															
											<td>
												<strong>
													PCO Licence:
												</strong>
											</td>
														  
											<td>
												<?php echo $drow['pco_licence']; ?>
											</td>
											
										</tr>
										
										<tr>
										
											
											<td>
												<strong>
													PCO Licence Expiring Date:
												</strong>
											</td>
														 
											<td>
												<?php echo $drow['pco_exp'];?>
											</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
										</tr>
														  
										
										<tr>
										
											<td>
												<strong>
													Driver Licence Photo Card (Front):
												</strong>	
												<br>
												<img src="img/drivers/Driving-Licence/<?php echo $drow['dl_front'];?>" style="width: 150px;">
											</td>
														 
											<td>
												<strong>
													Driver Licence Photo Card (Back):
												</strong>
												<br>
												<img src="img/drivers/Driving-Licence/<?php echo $drow['dl_back'];?>" style="width: 150px;">
											</td>
														  
											<td>
												<strong>
													Proof of National Insurance:
												</strong>
												<br>
												<img src="img/drivers/National-Insurance/<?php echo $drow['national_insurance'];?>" style="width: 150px;">
											</td>
													
											<td>
												<strong>
													Proof of Basic Disclosure:
												</strong>
												<br>
												<img src="img/drivers/Basic-Disclosure/<?php echo $drow['basic_disclosure'];?>" style="width: 150px;">
											</td>
															
											<td>
												<strong>
													Proof of Right To Work in the UK:
												</strong>
												<br>
												<img src="img/drivers/Work-Proof/<?php echo $drow['work_proof'];?>" style="width: 150px;">
											</td>
														 
											<td>
												<strong>
													Passport:
												</strong>
												<br>
												<img src="img/drivers/Passport/<?php echo $drow['passport'];?>" style="width: 150px;">
											</td>
											
										</tr>
										
										
										
										<tr>
										
											<td>
												<strong>
													DVLA Check Results:
												</strong>
												<br>
												<img src="img/drivers/DVLA/<?php echo $drow['dvla'];?>" style="width: 150px;">
											</td>
														 
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											
										</tr>
										
										
														  
														
										
									</tbody>
									
								</table>


													
													
													
													
																																
																								
						
													                    
					
								
							</div>                                       
					
							
						</div>                 
				
																			
					           
			
						
					</div>              
		
					
				</div>            
	
				
			</div>         

			
		</div>
		
		
		
		           

	</div>


</div>

<?php
include('footer.php');
?>