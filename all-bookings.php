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
					Booking Section                
				</h2>              
			</div>
			<div class="col-auto ms-auto d-print-none">            
				<div class="btn-list">                
					<span class="d-none d-sm-inline">
						<a href="booking-history.php" class="btn">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Booking History                   
						</a>                  
					</span> 
					<span class="d-none d-sm-inline">
						<a href="cancelled-booking.php" class="btn btn-danger">						
							<i class="ti ti-user-search" style="margin-right: 10px;"></i>                     
							Cancelled History                   
						</a>                  
					</span> 
					<span class="d-none d-sm-inline">
						<span class="dropdown">
                              <button class="btn dropdown-toggle align-text-top" id="filterDropdown" data-bs-boundary="viewport" data-bs-toggle="dropdown">Search Bookings</button>
                              <div class="dropdown-menu dropdown-menu-end">
								  
								 <a class="dropdown-item" href="#" data-filter="3"> All Bookings In 3 Hours</a>
								  <a class="dropdown-item" href="#" data-filter="6">All Bookings In 6 Hours</a>
								  <a class="dropdown-item" href="#" data-filter="9">All Bookings In 9 Hours</a>
								  <a class="dropdown-item" href="#" data-filter="12">All Bookings In 12 Hours</a>
								  <a class="dropdown-item" href="#" data-filter="24">All Bookings In 24 Hours</a>
								  <a class="dropdown-item" href="#" data-filter="72">All Bookings In 3 Days</a>
								  <a class="dropdown-item" href="#" data-filter="168">All Bookings In 7 Days</a>
								  <a class="dropdown-item" href="#" data-filter="336">All Bookings In 14 Days</a>
								  <a class="dropdown-item" href="#" data-filter="720">All Bookings In 30 Days</a>
								  <a class="dropdown-item" href="#" data-filter="2160">All Bookings In 3 Months</a>
								  <a class="dropdown-item" href="#" data-filter="4320">All Bookings In 6 Months</a>
								  <a class="dropdown-item" href="#" data-filter="8760">All Bookings In 12 Months</a>
                              </div>
                            </span>                 
					</span> 
					<script>
						$(document).ready(function () {
    $(".dropdown-item").click(function (event) {
        event.preventDefault();

        var selectedInterval = $(this).data("filter");
        console.log("Selected Interval:", selectedInterval);

        if (selectedInterval !== undefined && selectedInterval !== null) {
            $.ajax({
                type: "GET",
                url: "fetch_data.php",
                data: { timeInterval: selectedInterval },
                success: function (data) {
                    console.log("Ajax Success:", data);
                    $("#tableBody").html(data);
                },
                error: function (xhr, status, error) {
                    console.error("Ajax Error:", error);
                }
            });
        } else {
            console.error("Selected interval is undefined or null.");
        }
    });
});

    //$(document).ready(function () {
//        // Handle dropdown item click event
//        $(".dropdown-item").click(function () {
//            // Fetch the selected time interval from the data-filter attribute
//            var selectedInterval = $(this).data("filter");
//
//            // Make an Ajax request to fetch data based on the selected time interval
//            $.ajax({
//                type: "GET",
//                url: "fetch_data.php", // Update with the actual server-side script to handle the request
//                data: { timeInterval: selectedInterval },
//                success: function (data) {
//                    // Update the table body with the fetched data
//                    $("#tableBody").html(data);
//                },
//                error: function () {
//                    console.error("Error fetching data");
//                }
//            });
//        });
//    });
</script>

				

					      
				</div>              
			</div>
		</div>	
</div>

<div class="page-body page_padding">          
		<div class="row row-deck row-cards">			      
			<div class="col-12">            			
				<div class="card">                				
					<div class="card-header">                    					
						<h3 class="card-title">All Bookings List</h3>                  					
					</div>                  
					<div class="card-body border-bottom py-3">
						<div id="table-default" class="table-responsive">                  
							<table class="table">                    
								<thead>                      
									<tr> 																				
										<th>
											<button class="table-sort" data-sort="sort-id">ID</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-date">Date Pickup</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-time">Time Pickup</button>
										</th>                       
										<th>
											<button class="table-sort" data-sort="sort-passenger">Passenger</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-pickup">Pickup</button>
										</th>                        
										<th>
											<button class="table-sort" data-sort="sort-dropoff">Dropoff</button>
										</th>                       
										<th>
											<button class="table-sort" data-sort="sort-fare">Fare</button>
										</th>						   
										<th>
											<button class="table-sort" data-sort="sort-vehicle">Vehicle</button>
										</th>
										<th>
											<button class="table-sort" data-sort="sort-vehicle">Book Date</button>
										</th>
																   
										<th>
											<button class="table-sort">Actions</button>
										</th>                      
									</tr>                   
								</thead>                  
								<tbody class="table-tbody" id="tableBody">					
									<?php										
									$y=0;								
									$bsql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, booking_type.* FROM bookings, clients, booking_type WHERE bookings.c_id = clients.c_id AND bookings.booking_status = 'Pending' AND bookings.b_type_id = booking_type.b_type_id ORDER BY bookings.book_id DESC");									
									while($brow = mysqli_fetch_array($bsql)){											
										$y++;
									?>														                     
									<tr>                        
										<td class="sort-id"><?php echo $brow['book_id']; ?></td>                        
										<td class="sort-date"><?php echo $brow['pick_date'] ?></td>                       
										<td class="sort-time"><?php echo $brow['pick_time'] ?></td>                       
										<td class="sort-passenger"><?php echo $brow['passenger'] ?></td>  
										<td class="sort-pickup" style="width: 15%;"><?php echo $brow['pickup'] ?></td>                       
										<td class="sort-drpoff" style="width: 15%;"><?php echo $brow['destination'] ?></td>
										<td class="sort-fare"> <?php echo $brow['journey_fare'] ?> </td>
										<td class="sort-vehicle"> <?php echo $brow['v_name'] ?> </td>
										<td class="sort-vehicle"> <?php echo $brow['book_add_date'] ?> </td>
										
										<td> 
											<?php
										if($brow['bid_status']==0){
											?>
											<a href="open-bid.php?book_id=<?php echo $brow['book_id'] ?>">
												<button class="btn btn-instagram">
													<i class="ti ti-aspect-ratio"></i>Open Bid
												</button>
											</a>
											
											<?php
										}else{
											?>
											
											<a href="#">
												<button class="btn" disabled>
													<i class="ti ti-aspect-ratio"></i>on Bid
												</button>
											</a>
											<?php
										}
										?>
											
										
											<a href="view-booking.php?book_id=<?php echo $brow['book_id'] ?>">
											
												<button class="btn btn-info">
													<i class="ti ti-eye"></i>View
												</button>
												
											</a>
											<a href="dispatch-booking.php?book_id=<?php echo $brow['book_id'] ?>">
												<button class="btn btn-success"><i class="ti ti-plane-tilt"></i>Dispatch</button>
											</a>
											<button class="btn btn-danger"><i class="ti ti-square-rounded-x"></i>Cancel</button>	
										
										
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