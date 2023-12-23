<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">		   		
	<div class="row g-2 align-items-center">        
			<div class="col">            
				<!-- Page pre-title -->                
				<div class="page-pretitle">                
					Overview                
				</div>                
				<h2 class="page-title">                
					Customers Section                
				</h2>              
			</div>
			<div class="col-auto ms-auto d-print-none">            
				<div class="btn-list">                
					<!--<span class="d-none d-sm-inline">
						<a href="#" class="btn">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Booking History                   
						</a>                  
					</span>   -->               
					<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">  
					
						<i class="ti ti-user-plus"></i>                    
						Add New Customer                  
					</a>                  
					<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-booking" aria-label="Create new report">                    
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
						<h3 class="card-title">All Customers List</h3>                  					
					</div>                  
					<div class="card-body border-bottom py-3">
						<div id="table-client" class="table-responsive">                  
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
									$csql=mysqli_query($connect,"SELECT clients.* FROM clients ORDER BY clients.c_id DESC");									
									while($crow = mysqli_fetch_array($csql)){											
										$x++;
									?>														                     
									<tr>                        
										<td class="sort-id"><?php echo $x; ?></td>                        
										<td class="sort-date">
											<?php							
						
										if (!$crow['c_pic']) {																
						
											?>																	
							
											<img src="img/clients/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">							
							
											<?php							
					
										} else{                                            						
						
											?>                                         							
						
											<img src="img/customers/<?php echo $crow['c_pic'];?>" alt="Customer Img" style="width: 60px; border-radius: 30px;">				
						
											<?php                                         																						
					
										}                                          																							
						
											?>	
										</td>                       
										<td class="sort-time"><?php echo $crow['c_name'] ?></td>                       
										<td class="sort-passenger"><?php echo $crow['c_email'] ?></td>  
										<td class="sort-pickup"><?php echo $crow['c_phone'] ?></td>                       
										<td class="sort-drpoff"><?php echo $crow['c_gender'] ?></td>
										<td class="sort-drpoff">
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
											<a href="view-customer.php?c_id=<?php echo $crow['c_id'] ?>">
											<button class="btn btn-info">View</button>
												</a>
											<button class="btn btn-success">Dispatch</button>
											<button class="btn btn-danger">Cancel</button> </td>
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

<?php
include('footer.php');
?>