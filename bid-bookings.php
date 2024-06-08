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
				Booking For Bids Section                				
			</h2>              			
		</div>						
	</div>	
</div>
<div class="page-body page_padding">
	<div class="row row-deck row-cards">			      	
		<div class="col-12">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">
						All Bookings List
					</h3>          										
				</div>                  				
				<div class="card-body border-bottom py-3">				
					<div id="table-default" class="table-responsive">
						<table class="table" id="table-booking">                    						
							<thead>                      							
								<tr>												
									<th> ID </th>		
									<th> Booking </th> 									
									<th> Available Time </th>					
									<th> Note </th>		
									<th> Status </th>								
									<th> Actions </th>			
								</tr>                   
							</thead>
							<tbody class="table-tbody">
								<?php    
								$y = 0;    
								$bsql = mysqli_query($connect, "SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, booking_type.* FROM bookings, clients, booking_type WHERE bookings.c_id = clients.c_id AND bookings.b_type_id = booking_type.b_type_id AND bookings.bid_status = 1 ORDER BY bookings.book_id DESC");    
								while ($brow = mysqli_fetch_array($bsql)) {        
									$y++;        									        
									$current_time = strtotime(date("Y-m-d H:i:s"));        
									$bid_time = strtotime($brow['bid_time']);        
									$remaining_time_seconds = $bid_time - $current_time;        
									$remaining_time = gmdate("H:i:s", $remaining_time_seconds);    
								?>        
								<tr>            
									<td>                
										<?php echo $y; ?>            
									</td>            
									<td>                
										Booking ID: <?php echo $brow['book_id']; ?><br>
										<?php echo $brow['pickup']; ?> -                
										<?php echo $brow['destination']; ?><br>                
										<?php echo $brow['pick_date']; ?> -                
										<?php echo $brow['pick_time']; ?>            
									</td>            
									<td id="remainingTime_<?php echo $y; ?>">                
										Remaining Time: 
										<?php echo $remaining_time; ?>            
									</td>            
									<td>                
										<?php echo $brow['bid_note']; ?>            
									</td>            
									<td>                
										<?php                
											if ($brow['bid_status'] == 0) {
												echo 'Closed';
											} else {			
												echo 'Open';                
											}                
										?>            
									</td>            
									<td>                
										<a href="bids-details.php?book_id=<?php echo $brow['book_id']; ?>" class="btn btn-info">
											<i class="ti ti-eye-edit"></i>                    
											View Bid              
										</a>               
										<a href="close-bid.php?book_id=<?php echo $brow['book_id']; ?>" class="btn btn-danger">                 
											<i class="ti ti-square-rounded-x"></i>                  
											Close Bid               
										</a>            
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
		</div>		
	</div>
</div>        
<script> 	
	$(document).ready(function() {
    $('#table-booking').DataTable();
});

	function updateRemainingTime() {
        <?php        
        mysqli_data_seek($bsql, 0);
        $y = 0;
        while ($brow = mysqli_fetch_array($bsql)) {
            $y++;
            $current_time = strtotime(date("Y-m-d H:i:s"));
            $bid_time = strtotime($brow['bid_time']);
            $remaining_time_seconds = $bid_time - $current_time;
            $remaining_time = gmdate("H:i:s", $remaining_time_seconds);
        ?>
            document.getElementById("remainingTime_<?php echo $y; ?>").innerHTML = "Remaining Time: <?php echo $remaining_time; ?>";
        <?php
        }
        ?>
    }    
    setInterval(updateRemainingTime, 1000);	
</script>
<?php
include('footer.php');
?>