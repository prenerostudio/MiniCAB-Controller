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
                                $bsql = mysqli_query($connect, "SELECT
  bookings.*,
  clients.c_name,
  clients.c_email,
  clients.c_phone,
  booking_type.* 
FROM
  bookings
  LEFT JOIN clients ON bookings.c_id = clients.c_id
  JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id 
WHERE
  bookings.bid_status = 1 
ORDER BY
  bookings.book_id DESC");    
                                $bookingData = [];
                                while ($brow = mysqli_fetch_array($bsql)) {        
                                    $y++;                                 
                                    $bid_time = strtotime($brow['bid_time']);
                                    $bookingData[] = [
                                        'id' => $y,
                                        'book_id' => $brow['book_id'],
                                        'pickup' => $brow['pickup'],
                                        'destination' => $brow['destination'],
                                        'pick_date' => $brow['pick_date'],
                                        'pick_time' => $brow['pick_time'],
                                        'bid_time' => $bid_time,
                                        'bid_note' => $brow['bid_note'],
                                        'bid_status' => $brow['bid_status']
                                    ];
                                ?>        
                                <tr>            
                                    <td>                
                                        <?php echo $y; ?>            
                                    </td>            
                                    <td>                
                                      <strong> Booking ID:</strong> <?php echo $brow['book_id']; ?><br>
                                       <strong>Pickup Address:</strong> <?php echo $brow['pickup']; ?><br>               
                                       <strong>Dropoff Address:</strong> <?php echo $brow['destination']; ?><br>                
                                       <strong>Pickup Date:</strong> <?php echo $brow['pick_date']; ?> <br>                
                                       <strong>Pickup Time:</strong> <?php echo $brow['pick_time']; ?>            
                                    </td>            
                                    <td id="remainingTime_<?php echo $y; ?>">                
                                        Remaining Time:                
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
                                            View Bids              
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
    var bookingData = <?php echo json_encode($bookingData); ?>;

    function updateRemainingTime() {
        var currentTime = Math.floor(Date.now() / 1000); // Current time in seconds since Unix Epoch

        bookingData.forEach(function(booking) {
            var remainingTimeElement = document.getElementById("remainingTime_" + booking.id);

            if (remainingTimeElement) {
                if (booking.bid_time < currentTime) {
                    remainingTimeElement.innerHTML = "Remaining Time: Due time passed";
                } else {
                    var remainingTimeSeconds = booking.bid_time - currentTime;
                    var hours = Math.floor(remainingTimeSeconds / 3600);
                    var minutes = Math.floor((remainingTimeSeconds % 3600) / 60);
                    var seconds = remainingTimeSeconds % 60;

                    remainingTimeElement.innerHTML = "Remaining Time: " + hours.toString().padStart(2, '0') + ":" + minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0');
                }
            }
        });
    }

    setInterval(updateRemainingTime, 1000);  
</script>
<?php
include('footer.php');
?>
