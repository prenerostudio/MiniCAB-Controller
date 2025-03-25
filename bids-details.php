<?php
include('header.php');
$book_id = $_GET['book_id'];
?>  
<div class="page-header d-print-none page_padding">		   		
    <div class="row g-2 align-items-center">        	
        <div class="col">            					              				
            <div class="page-pretitle">                				
                Overview                						
            </div>                				
            <h2 class="page-title">                				
                Driver Bids Section                						
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
                        All Bids List			
                    </h3>		
                </div>                  						
                <div class="card-body border-bottom py-3">						
                    <div id="table-default" class="table-responsive">		
                        <table class="table table-responsive" id="table-bids">									
                            <thead>				
                                <tr>										
                                    <th>ID</th>				
                                    <th>Booking Details</th>				
                                    <th>Driver Name</th>				
                                    <th>Bid Amount</th>													
                                    <th>Time</th>				
                                    <th> </th>				
                                </tr>						
                            </thead>				
                            <tbody>
                                <?php
                                $n=0;								
                                $bidsql=mysqli_query($connect,"SELECT drivers.*, bookings.*, booking_type.*, clients.*, vehicles.*, bids.* FROM bids JOIN bookings ON bids.book_id = bookings.book_id JOIN drivers ON bids.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN clients ON bookings.c_id = clients.c_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bids.book_id = '$book_id'");								
                                while($bidrow = mysqli_fetch_array($bidsql)){									
                                    $n++
								?>					
                                <tr>								
                                    <td>											
										<?php echo $n; ?>					
                                    </td>				
                                    <td style="width: 40%;">
                                        <strong> Booking ID:</strong> <?php echo $bidrow['book_id']; ?><br>
                                        <strong>Pickup Address:</strong> <?php echo $bidrow['pickup']; ?><br>
                                        <strong>Dropoff Address:</strong> <?php echo $bidrow['destination']; ?><br>					
                                        <strong>Pickup Date:</strong> <?php echo $bidrow['pick_date']; ?> <br>					
                                        <strong>Pickup Time:</strong> <?php echo $bidrow['pick_time']; ?>
                                    </td>
                                    <td>
                                        <strong>Driver Name:</strong> <?php echo $bidrow['d_name']; ?><br>
                                        <strong>Driver Phone:</strong> <?php echo $bidrow['d_phone']; ?><br>
                                        <strong>Driver Email:</strong> <?php echo $bidrow['d_email']; ?><br>
                                        <strong>Postcode:</strong> <?php echo $bidrow['d_post_code']; ?><br>
                                    </td> 
                                    <td>				
                                        <span style="font-size: 28px;"> £											
											<?php echo $bidrow['bid_amount']; ?>
                                        </span>															
                                    </td>												
                                    <td>																			
										<?php echo $bidrow['bid_date']; ?>		
                                    </td>				
                                    <td>														
                                        <a href="accept-bid.php?bid_id=<?php echo $bidrow['bid_id'] ?>">
                                            <button class="btn btn-success">
                                                <i class="ti ti-checks"></i>
                                                Accept Bid
                                            </button>
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
        $('#table-bids').DataTable();
});
</script>
<?php
include('footer.php');
?>