<?php
include('header.php');
?>          	
<div class="card">			
	<div class="card-header">				
		<h2 class="page-title">              		
			Bookings List             			
		</h2>		
		<div class="col-auto ms-auto d-print-none">        
			<div class="btn-list">            				                
				<a href="#" class="btn d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>      
					Add New Booking                  
				</a>                                 
			</div>            
		</div>		
	</div>    		
	<div class="card-body">            			
		<div id="table-default" class="table-responsive">    				
			<table class="table card-table table-vcenter text-nowrap datatable">                   								
				<thead style="background: #051650; color: white;">                   										
					<tr >                          												
						<th class="w-1">ID</th>                         													
						<th class="w-1">Date</th>                          													
						<th>Time</th>                         													
						<th>Passenger</th>                         													
						<th>Pickup</th>                         													
						<th>Destination</th>
						<th>Vehicle</th>                       													
						<th>Note</th>                       													
						<th>Status</th>
						<th>Action</th>                       												
					</tr>                     										
				</thead>                    									
				<tbody> 										
					<?php										
					$booksql=mysqli_query($connect,"SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.v_name FROM bookings, clients, vehicles WHERE bookings.c_id = clients.c_id AND bookings.v_id = vehicles.v_id AND bookings.booking_status = 'Pending'");
					while($bookrow = mysqli_fetch_array($booksql)){										
					?>																		
					<tr>                         											
						<td>																				
							<?php echo $bookrow['book_id']; ?>													
						</td>                          													
						<td>														
							<span class=" btn btn-instagram">																
								<?php echo $bookrow['book_date']; ?>
							</span>												
						</td>
						<td>														
							<?php echo $bookrow['book_time']; ?>														
						</td>                        													
						<td>                           														
							<?php echo $bookrow['c_name']; ?>            		
						</td>                         													
						<td>                          														
							<?php echo $bookrow['pickup']; ?>
						</td>                         													
						<td>                           															
							<?php echo $bookrow['destination']; ?>														
						</td>                          																	
						<td>
							<?php echo $bookrow['v_name']; ?> 
						</td>   													
						<td>
							<?php echo $bookrow['note']; ?>  
						</td>													
						<td>
							<?php echo $bookrow['booking_status']; ?> 
						</td>		
						<td class="text-end">						
							<span class="dropdown">							
								<a href="#" class="btn d-none btn-instagram d-sm-inline-block" data-id="<?php echo $bookrow['book_id'] ?>" data-bs-toggle="modal" data-bs-target="#modal-bookdet">
    Booking Details
</a>

								<a href="#" class="btn btn-facebook d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-booking">						
									Dispatch									
								</a>																			
							</span>                         														
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




<!-------------------------------
----------Add Booking-------------
-------------------------------->


<!-- Button to trigger the modal -->

<div class="modal modal-blur fade" id="modal-bookdet" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Booking Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="#" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- Display Booking ID -->
                            <div class="mb-3">
                                <label class="form-label">Booking ID</label>
                                <input type="text" class="form-control" name="bkid" value="<?php ?>" id="booking-id-input" disabled>
                            </div>
                            <!-- Other input fields for display -->
                            <!-- You can add more input fields here -->
                            <div class="mb-3">
                                <label class="form-label">Pickup</label>
                                <input type="text" class="form-control" name="pickup" id="pickup-input">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Destination</label>
                                <input type="text" class="form-control" name="destination" id="destination-input">
                            </div>
                            <!-- Add more input fields as needed -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
                        Cancel
                    </a>
                    <!-- Submit button, if you want to allow editing and saving changes -->
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.btn-instagram').on('click', function(e) {
            e.preventDefault();
            var bookingId = $(this).data('id');
            
            // Make an AJAX request to get booking details based on bookingId
            $.ajax({
    type: 'GET',
    url: 'get_booking_details.php',
    data: { book_id: bookingId },
    success: function(response) {
        console.log(response); // Log the response for debugging
        var bookingDetails = JSON.parse(response);
        console.log(bookingDetails); // Log the parsed data for debugging
        // Populate the input fields with the data as before
        // ...
    },
    error: function(xhr, status, error) {
        console.log('Error:', status, error); // Log any error messages for debugging
    }
});
        });
    });
</script>


<?php
include('footer.php');
?>