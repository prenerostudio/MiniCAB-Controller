<?php
include('header.php');
?>       	
<div class="card">					
	<div class="card-header">						
		<h2 class="page-title">              					
			Drivers List             						
		</h2>					
		<div class="col-auto ms-auto d-print-none">										
			<div class="btn-list">                                 			
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>                   					
					Add New Driver                  					
				</a>                 				
			</div>              			
		</div>								
	</div>            			
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">            					
			<table class="table card-table table-vcenter text-nowrap datatable">                   												
				<thead>                   															
					<tr align="center">                          																		
						<th class="w-1">ID</th>                         																				
						<th class="w-1">Pic</th>                          																				
						<th >Name</th>                         																				
						<th>Phone</th>                         																				
						<th>Gender</th>                         																				
						<th>Language</th>                         																				
						<th>Licence</th>
						<th></th>                       																			
					</tr>                     																
				</thead>                    														
				<tbody> 															
					<?php
					$dsql=mysqli_query($connect,"SELECT * FROM `drivers`");											
					while($drow = mysqli_fetch_array($dsql)){																
					?>																								
					<tr align="center">                         																	
						<td>																				
							<?php echo $drow['d_id']; ?>																					
						</td>                          																				
						<td style="width: 10%;">														
							<?php															
						if (!$drow['d_pic']) {																							
							?>																									
							<img src="img/drivers/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php															
						} else{                                            													
							?>                                         															
							<img src="<?php echo $drow['d_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">
							<?php
						}                                          																							
							?>										
						</td>                        																				
						<td>																					
							<?php echo $drow['d_name']; ?>																						
						</td>                        																				
						<td>                           																					
							<?php echo $drow['d_phone']; ?>
						</td>                         																				
						<td>                          																					
							<?php echo $drow['d_gender']; ?>
						</td>                         																				
						<td>                           																					
							<?php echo $drow['d_language']; ?>															
						</td>                          																				
						<td>                            																					
							<?php echo $drow['d_licence']; ?>															
						</td>																			
						<td class="text-end">	
							<a href="driver-details.php?id=<?php echo $drow['d_id']; ?>">
							<button class="btn align-text-top">View</button>	
							</a>
							<button class="btn btn-danger align-text-top">Delete</button>																			
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
<?php
include('footer.php');
?>