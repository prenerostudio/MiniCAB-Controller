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
				Drivers Section                				
			</h2>              			
		</div>		
		<div class="col-auto ms-auto d-print-none">            		
			<div class="btn-list">                			
				<a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">  											
					<i class="ti ti-user-plus"></i>                    					
					Add New Driver                  					
				</a>                  				
				<a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-driver" aria-label="Create new report">                    				
					<i class="ti ti-bookmark-plus"></i>                  					
				</a>                				
			</div>              			
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          	
	<div class="row row-deck row-cards">			
		<div class="card">        
			<div class="card-header">            
				<ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                
					<li class="nav-item">                    
						<a href="#drivers" class="nav-link active" data-bs-toggle="tab">								
							<i class="ti ti-steering-wheel"></i>                        
							Active Drivers
						</a>                      
					</li>                      
					<li class="nav-item">                       
						<a href="#new-drivers" class="nav-link" data-bs-toggle="tab">						
							<i class="ti ti-user-shield"></i>                        
							New Driver Requests
						</a>                   
					</li>						
					<li class="nav-item">                      
						<a href="#inactive" class="nav-link" data-bs-toggle="tab">						
							<i class="ti ti-car-off"></i>                         
							Inactive Drivers
						</a>                     
					</li>                   
				</ul>                 
			</div>               
			<div class="card-body">              
				<div class="tab-content">              
					<div class="tab-pane active show" id="drivers">   
						<div class="col-12">       
							<div class="card">            
								<div class="card-header">                
									<h3 class="card-title">Active Drivers List</h3>            
								</div>            
								<div class="card-body border-bottom py-3">                
									<div id="table-adriver" class="table-responsive">                    
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
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
													</th>                               
													<th>
														<button class="table-sort">Actions</button>
													</th>                            
												</tr>                       
											</thead>                       						
											<tbody class="table-tbody">                        						
												<?php                            						
												$x = 0;                            						
												$adsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1 ORDER BY drivers.d_id DESC");   						
												while ($adrow = mysqli_fetch_array($adsql)) :
												$x++;                            						
												?>
												<tr>                            							
													<td class="sort-id">								
														<?php echo $x; ?>							
													</td>                                   							
													<td class="sort-date">
														<?php if (!$adrow['d_pic']) : ?>   									
														<img src="img/user-1.jpg" alt="Driver Img" style="width: 80px; height: 80px; border-radius: 5px;">									
														<?php else : ?>
														<img src="img/drivers/<?php echo $adrow['d_pic']; ?>" alt="Driver Img" style="width: 80px; height: 80px; background-size: 100% 100%; border-radius: 5px;">
														<?php endif; ?>
													</td>                                   							
													<td class="sort-time">								
														<?php echo $adrow['d_name']; ?>							
													</td>                                  							
													<td class="sort-passenger">									
														<?php echo $adrow['d_email']; ?>								
													</td>                                 								
													<td class="sort-pickup">								
														<?php echo $adrow['d_phone']; ?>							
													</td>                                 							
													<td class="sort-drpoff">									
														<?php echo $adrow['d_gender']; ?>								
													</td>                                   								
													<td class="sort-drpoff">									
														<?php echo $adrow['licence_authority']; ?>
													</td>								
													<td>									
														<a href="view-driver.php?d_id=<?php echo $adrow['d_id']; ?>">
															<button class="btn btn-info">
																<i class="ti ti-eye"></i>
																View
															</button>                                        
														</a>                                       
														<a href="del-driver.php?d_id=<?php echo $adrow['d_id']; ?>">
															<button class="btn btn-danger">
																<i class="ti ti-square-rounded-x"></i>
																Delete
															</button>														
														</a> 
														<a href="make-inactive.php?d_id=<?php echo $adrow['d_id']; ?>">
															<button class="btn btn-instagram">
																<i class="ti ti-user-x"></i>
																Make Inactive
															</button>														
														</a> 
													</td>
												</tr>                          						
												<?php endwhile; ?>                         							
												<?php if ($x === 0) : ?>
												<tr>                                   							
													<td colspan="8">								
														<p align="center">No Driver Found!</p>								
													</td>                              							
												</tr>                           							
												<?php endif; ?>                        						
											</tbody>                   					
										</table>               							
									</div>           						
								</div>       							
							</div>   						
						</div>					
					</div>

					<div class="tab-pane" id="new-drivers">
                    
						<div class="col-12">            					
			
							<div class="card">                							
				
								<div class="card-header">                    									
					
									<h3 class="card-title">New Drivers Request List</h3>
				
								</div>                  				
				
								
								<div class="card-body border-bottom py-3">				
					
									<div id="table-ndriver" class="table-responsive">                  					
						
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
										
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">
                            <?php
                            $y = 0;
                            $ndsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 0 ORDER BY drivers.d_id DESC");
                            while ($ndrow = mysqli_fetch_array($ndsql)) :
                                $y++;
                            ?>
                                <tr>
                                    <td class="sort-id"><?php echo $y; ?></td>
                                    <td class="sort-date">
                                        <?php if (!$ndrow['d_pic']) : ?>
                                            <img src="img/user-1.jpg" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
                                        <?php else : ?>
                                            <img src="img/drivers/<?php echo $ndrow['d_pic']; ?>" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
                                        <?php endif; ?>
                                    </td>
                                    <td class="sort-time"><?php echo $ndrow['d_name']; ?></td>
                                    <td class="sort-passenger"><?php echo $ndrow['d_email']; ?></td>
                                    <td class="sort-pickup"><?php echo $ndrow['d_phone']; ?></td>
                                    <td class="sort-drpoff"><?php echo $ndrow['d_gender']; ?></td>
                                    <td class="sort-drpoff"><?php echo $ndrow['licence_authority']; ?></td>
                                    <td>
                                        <a href="view-driver.php?d_id=<?php echo $ndrow['d_id']; ?>">
                                            <button class="btn btn-info"><i class="ti ti-eye"></i>View</button>
                                        </a>
                                        <a href="del-customer.php?c_id=<?php echo $ndrow['c_id']; ?>">
                                            <button class="btn btn-danger"><i class="ti ti-square-rounded-x"></i>Delete</button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                            <?php if ($y === 0) : ?>
                                <tr>
                                    <td colspan="8"><p align="center">No Driver Found!</p></td>
                                </tr>
                            <?php endif; ?>
                        </tbody>                 							
						
										</table>                						
					
									</div>                  					
				
								</div>                                                    				
			
							</div>              			
		
						</div>
                      
					</div>
					
					<div class="tab-pane" id="inactive">
                       
						<div class="col-12">            					
			
							<div class="card">                							
			
								<div class="card-header">                    									
					
									<h3 class="card-title">InActive Drivers List</h3>
				
								</div>                  				
				
								<div class="card-body border-bottom py-3">				
				
									<div id="table-customer" class="table-responsive">                  					
						
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
										
														<button class="table-sort" data-sort="sort-dropoff">Licence Authority</button>
									
													</th>							
									
													<th>									
										
														<button class="table-sort">Actions</button>
									
													</th>                      									
								
												</tr>                   								
							
											</thead>                  							
							
											<tbody class="table-tbody">
                            <?php
                            $z = 0;
                            $idsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 2 ORDER BY drivers.d_id DESC");
                            while ($idrow = mysqli_fetch_array($idsql)) :
                                $z++;
                            ?>
                                <tr>
                                    <td class="sort-id"><?php echo $z; ?></td>
                                    <td class="sort-date">
                                        <?php if (!$idrow['d_pic']) : ?>
                                            <img src="img/user-1.jpg" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
                                        <?php else : ?>
                                            <img src="img/drivers/<?php echo $idrow['d_pic']; ?>" alt="Driver Img" style="width: 60px; height: 60px; border-radius: 30px;">
                                        <?php endif; ?>
                                    </td>
                                    <td class="sort-time"><?php echo $idrow['d_name']; ?></td>
                                    <td class="sort-passenger"><?php echo $idrow['d_email']; ?></td>
                                    <td class="sort-pickup"><?php echo $idrow['d_phone']; ?></td>
                                    <td class="sort-drpoff"><?php echo $idrow['d_gender']; ?></td>
                                    <td class="sort-drpoff"><?php echo $idrow['licence_authority']; ?></td>
                                    <td>
                                        <a href="view-driver.php?d_id=<?php echo $idrow['d_id']; ?>">
                                            <button class="btn btn-info"><i class="ti ti-eye"></i>View</button>
                                        </a>
                                        <a href="del-driver.php?d_id=<?php echo $idrow['d_id']; ?>">
                                            <button class="btn btn-danger"><i class="ti ti-square-rounded-x"></i>Delete</button>
                                        </a> 
										<a href="activate-driver.php?d_id=<?php echo $idrow['d_id']; ?>">
                                            <button class="btn btn-success"><i class="ti ti-user-check"></i>Activate Driver</button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                            <?php if ($x === 0) : ?>
                                <tr>
                                    <td colspan="8"><p align="center">No Driver Found!</p></td>
                                </tr>
                            <?php endif; ?>
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
----------Add Driver-------------
-------------------------------->
<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">    	
		<div class="modal-content">        		
			<div class="modal-header">            			
				<h5 class="modal-title">Add New Driver</h5>            				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>          			
			</div> 
			<form method="post" enctype="multipart/form-data" action="driver-process.php" onsubmit="return validateForm();">			
				<div class="modal-body">								
					<div class="row">              					
								
							<div class="mb-3 col-lg-6">              					
								<label class="form-label">Driver Name</label>              					
								<input type="text" class="form-control" name="dname" placeholder="Driver Name" required>            				
							</div> 						
					             					
						             
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">Email</label>              					
								<input type="email" class="form-control" name="demail" placeholder="hello@example.com" required>
							</div>             				
						           				
					              					
						            					
						               
							<div class="mb-3 col-lg-6">                  
								<label class="form-label">Phone</label>              					
								<input type="text" class="form-control" name="dphone" placeholder="+44 20 7123 4567" required>
							</div> 
						
						
						<div class="mb-3 col-lg-6">              					
								<label class="form-label">Licence Authority</label>              					                  
								<select class="form-select" name="dauth" required>                    								
									<option value="" selected>Select Authority</option>                    								
									<option>London</option>                    								
									<option>Bermingham</option> 									
									<option>Ireland</option> 														
								</select>             											
							</div> 	
						            				
					             
									
							<div class="mb-3 col-lg-6">              					
								<label class="form-label">Gender</label>              					                  
								<select class="form-select" name="dgender">                    								
									<option value="" selected>Select Gender</option>                    								
									<option>Male</option>                    								
									<option>Female</option> 									
									<option>Transgender</option> 														
								</select>             											
							</div> 						
						              					
					               						
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">Language</label>              				
								<select class="form-select" name="dlang">                     								
									<option value="" selected>Select Language</option>                    								    
									<?php						
									$lsql=mysqli_query($connect,"SELECT * FROM `language`");
									while($lrow = mysqli_fetch_array($lsql)){									
									?>																											
									<option><?php echo $lrow['language'] ?></option>
									<?php
									}									
									?>												
								</select> 						
							</div>             					
					           				
					 					
					                  
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">Picture</label>              					
								<input type="file" class="form-control" name="dpic">      						
							</div>             					
					           				
				             					
										
							<div class="mb-3 col-lg-6">              					
								<label class="form-label">Licence</label>              					
								<input type="text" class="form-control" name="licence" placeholder="xxxxxxxx">            				
							</div> 						
					               
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">Licence Expiry</label>              					
								<input type="date" class="form-control" name="lexp">        						
							</div>             					
					           				
				             
										
							<div class="mb-3 col-lg-6">              					
								<label class="form-label">PCO Licence</label>              					
								<input type="text" class="form-control" name="pco" placeholder="xxxxxxxx">            				
							</div> 						
						               
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">PCO Licence Expiry</label>              					
								<input type="date" class="form-control" name="pcoexp">        						
							</div>             					
															
					</div>				          				          
				</div>          			
				<div class="modal-body">
					<div class="row">              					             
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Address</label>                  							
								<textarea class="form-control" rows="3" name="remarks"></textarea>               						
							</div>              					
						</div>  
						<div class="col-lg-12">               						
							<div>                 							
								<label class="form-label">Remarks</label>                  							
								<textarea class="form-control" rows="3" name="address"></textarea>               						
							</div>              					
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
						Add Driver  
						
					</button>       			
				</div> 								
			</form>	
			
			<script>
    function validateForm() {
        // Perform your form validation here
        var dnameInput = document.getElementsByName("dname")[0].value;
        var demailInput = document.getElementsByName("demail")[0].value;
        var dphoneInput = document.getElementsByName("dphone")[0].value;
		var dauthInput = document.getElementsByName("dauth")[0].value;
		

        if (dnameInput === "" || demailInput === "" || dphoneInput === "" || dauthInput === "" ) {
            // Display an error message or prevent the form submission
            alert("Please fill in all required fields.");
            return false;
        }

        // If validation passes, you can proceed with the form submission
        return true;
    }
</script>
			
		</div>      	
	</div>    
</div>   



<?php
include('footer.php');
?>