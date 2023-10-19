<?php
include('header.php');
?>


          
	<div class="card">
			
		<div class="card-header">
			
			<h2 class="page-title">
              
				Clients List
             
			</h2>
				<div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                 
                  <a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-client">
                    
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                   Add New Client
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
										<th style="background:rgba(227,136,137,0.61);">Name</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Phone</th>                         							
										<th style="width: 15%;">Gender</th>                         							
										<th style="width: 15%;">Language</th>                         							
										<th style="background:rgba(227,136,137,0.61);">Licence</th>                        							
							                     							
										<th>Action</th>                       						
									</tr>                     					
								</thead>                    					
								<tbody> 						
									<?php																											
									$csql=mysqli_query($connect,"SELECT * FROM `clients`");
									while($crow = mysqli_fetch_array($csql)){																	
																								
									?>													
									<tr align="center">                         						
										<td>							
											<?php echo $crow['c_id']; ?>						
										</td>                          							
										<td style="width: 10%;">	
											<?php
											if (!$crow['c_pic']) {										
											?>										
											<img src="img/clients/user-1.jpg" alt="Driver dp" style="width: 60px; border-radius: 30px;">
											<?php
										} else{                                            
											?>                                         
											<img src="<?php echo $crow['c_pic'];?>" alt="Driver dp" style="width: 60px; border-radius: 30px;">										
											<?php                                         									
										}                                          										
											?>
																				
																		
																
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">								
											<?php echo $crow['c_name']; ?>							
										</td>                        							
										<td style="background:rgba(227,136,137,0.61);">                           								
											<?php echo $crow['c_phone']; ?>                     							
										</td>                         							
										<td>                          								
											<?php echo $crow['c_gender']; ?>                     							
										</td>                         							
										<td>                           								
											<?php echo $crow['c_language']; ?>                      							
										</td>                          							
										<td style="background:rgba(227,136,137,0.61);">                            								
											<?php echo $crow['c_ni']; ?>                        							
										</td>                          							
										 							
										
										<td class="text-end">                            								
											                             									
												<button class="btn align-text-top">View</button>
											
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