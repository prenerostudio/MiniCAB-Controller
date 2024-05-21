<?php
include('header.php');
$acc_id = $_GET['acc_id'];
$sql=mysqli_query($connect,"SELECT booker_account.*, clients.*, bookings.*, booking_type.* FROM booker_account, clients, bookings, booking_type WHERE booker_account.c_id = clients.c_id AND booker_account.book_id = bookings.book_id AND bookings.b_type_id = booking_type.b_type_id AND booker_account.acc_id = '$acc_id'");
$irow = mysqli_fetch_array($sql);	
?>       
<div class="page-header d-print-none">
	<div class="container-xl">    
		<div class="row g-2 align-items-center">        
			<div class="col">            
				<h2 class="page-title">                
					Invoice                
				</h2>              
			</div>                        
			<div class="col-auto ms-auto d-print-none">            
				<button type="button" class="btn btn-primary" onclick="javascript:window.print();">
					<i class="ti ti-printer"></i>                  
					Print Invoice                
				</button>              
			</div>
		</div>        
	</div>    
</div>

<div class="page-body">
	<div class="container-xl">    
		<div class="card card-lg">        
			<div class="card-body">            
				<div class="row">                
					<div class="col-6">                    						                  
					</div>					                  
					<div class="col-6 text-end">					
						<h2 style="text-transform: uppercase;">
							Status: <?php echo $irow['comission_status'];?>
						</h2>                    
						<p class="h3">
							Customer Details:
						</p>                   
						<address>                    
							<?php echo $irow['c_name']; ?><br>                    
							<?php echo $irow['c_phone']; ?><br>                     
							<?php echo $irow['d_email']; ?><br>                     
							<?php echo $irow['d_address']; ?>                    
						</address>                 
					</div>                 
					<div class="col-12 my-5">                   
						<h1>Invoice INV/
							<?php echo $irow['book_id'];?>
						</h1>                 
					</div>                
				</div>               
				<table class="table table-transparent table-responsive">                
					<thead>                  
						<tr>                    
							<th class="text-center" style="width: 1%"></th>                     
							<th>Booking Detail</th>                     
							<th class="text-center" >Date</th>                     
							<th class="text-center" >Commission</th>                    
						</tr>                  
					</thead>     					
					<tbody>					
						<tr>                    					
							<td class="text-center">1</td>                   						
							<td>                      
								<p class="strong mb-1">
									<?php echo $irow['pick_date'];?> - 								
									<?php echo $irow['pick_time'];?>							
								</p>                      							
								<div class="text-secondary">
									Pickup: <?php echo $irow['pickup'];?> <br>
									Dropoff: <?php echo $irow['destination'];?>
								</div>                    						
							</td>                    						
							<td class="text-center">                     							
								£ <?php echo $irow['commission_date'];?>
							</td>                    						
							<td class="text-center">
								<?php echo $irow['comission_amount'];?>	
							</td>                  					
						</tr>                                                     					
						<tr>                    						
							<td colspan="3" class="strong text-end">Subtotal</td>
							<td class="text-center">							
								<strong>£ 								
									<?php echo $irow['comission_amount'];?>							
								</strong>						
							</td>                  					
						</tr>                 										
					</tbody>                                   				
				</table>               
				<p class="text-secondary text-center mt-5">
					Thank you very much for doing business with us. We look forward to working with you again!
				</p>              
			</div>           
		</div>          
	</div>        
</div>
<?php
include('footer.php');
?>