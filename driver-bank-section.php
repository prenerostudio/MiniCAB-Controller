<div class="card-body">
	<div class="row g-2 align-items-center">	
		<div class="col">		
			<div class="page-pretitle">			
				Overview                																		
			</div>                							
			<h2 class="page-title">                								
				Bank Details Section                								
			</h2>              			
		</div>															
	</div>									
	<div class="row mb-3">									
		<div class="card">			            																			
			<div class="card-body border-bottom py-3">			
				<div id="table-adriver" class="table-responsive">				
					<table class="table">																		
						<thead>                            																
							<tr>											
								<th>																						
									<button class="table-sort">
										ID
									</button>									
								</th>								
								<th>																					
									<button class="table-sort">
										Bank Name
									</button>									
								</th>								
								<th>																					
									<button class="table-sort">
										Account Number
									</button>									
								</th>								
								<th>																					
									<button class="table-sort">
										Sort Code
									</button>									
								</th>					
								<th>								
									<button class="table-sort">
										Actions
									</button>									
								</th>                            																				
							</tr>                       																		
						</thead>						
						<tbody class="table-tbody">						
							<?php																		
							$x = 0;							
							$bsql = mysqli_query($connect, "SELECT drivers.*, driver_bank_details.* FROM drivers JOIN driver_bank_details ON drivers.d_id = driver_bank_details.d_id WHERE drivers.d_id = $d_id");							
							while ($brow = mysqli_fetch_array($bsql)):							
							$x++;							
							?>							
							<tr>							
								<td>								
									<?php echo $x; ?>																					
								</td>																	
								<td>								
									<?php echo $brow['bank_name'];?>									
								</td>								
								<td>								
									<?php echo $brow['account_number'];?>
								</td>								
								<td>								
									<?php echo $brow['sort_code']; ?>									
								</td>																								
								<td>								
									<a href="edit-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id']; ?>">									
										<button class="btn btn-info">										
											<i class="ti ti-eye"></i>											
											Edit											
										</button>										
									</a>									
									<a href="del-driver-bank.php?d_bank_id=<?php echo $brow['d_bank_id'];?>& d_id=<?php echo $brow['d_id'];?>">
										<button class="btn btn-danger">										
											<i class="ti ti-basket"></i>											
											Delete											
										</button>										
									</a>									
								</td>								
							</tr>
							<?php endwhile; ?>							
							<?php if ($x === 0) : ?>							
							<tr>                                   														
								<td colspan="8">															
									<p align="center">									
										<a href="add-driver-bank.php?d_id=<?php echo $d_id; ?>" class="btn btn-primary d-none d-sm-inline-block">
											<i class="ti ti-car"></i>											
											Add Bank Details											
										</a> 
									</p>
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