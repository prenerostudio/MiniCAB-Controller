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
				
	</div>	
</div>
<div class="page-body page_padding">          	
	<div class="row row-deck row-cards">		
                    
						
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
			<form method="post" enctype="multipart/form-data" action="driver-process.php">			
				<div class="modal-body">								
					<div class="row">              					
								
							<div class="mb-3 col-lg-6">              					
								<label class="form-label">Driver Name</label>              					
								<input type="text" class="form-control" name="dname" placeholder="Driver Name">            				
							</div> 						
					             					
						             
							<div class="mb-3 col-lg-6">                  							
								<label class="form-label">Email</label>              					
								<input type="text" class="form-control" name="demail" placeholder="hello@example.com">
							</div>             				
						           				
					              					
						            					
						               
							<div class="mb-3 col-lg-6">                  
								<label class="form-label">Phone</label>              					
								<input type="text" class="form-control" name="dphone" placeholder="+44 20 7123 4567">
							</div> 
						
						
						<div class="mb-3 col-lg-6">              					
								<label class="form-label">Licence Authority</label>              					                  
								<select class="form-select" name="dauth">                    								
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
								<label class="form-label">Vehicle</label>              												
								<select class="form-select" name="dv">                    								
									<option value="" selected>Select Vehicle</option>
									<?php						
									$vsql=mysqli_query($connect,"SELECT * FROM `vehicles`");									
									while($vrow = mysqli_fetch_array($vsql)){									
									?>																											
									<option value="<?php echo $vrow['v_id'] ?>"><?php echo $vrow['v_name'] ?></option>
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
					<button type="submit" class="btn ms-auto btn-success" data-bs-dismiss="modal">
						
						<i class="ti ti-user-plus"></i> 
						Add Driver  
						
					</button>       			
				</div> 								
			</form>		
		</div>      	
	</div>    
</div>   



<?php
include('footer.php');
?>