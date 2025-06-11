<?php
include('header.php');
?>
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        Add New Bid
                    </h3>
                </div>
                <div class="card-body border-bottom py-3">
                    <form method="post" action="bid-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Booking Available for Bids</label>
                                        <select class="form-select" name="book_id" required>
                                            <option value="" selected>Select Bookings</option>						
											
                                                <?php                                            
											
                                                $bsql=mysqli_query($connect,"SELECT
  bookings.*,
  clients.c_name,
  clients.c_email,
  clients.c_phone,
  vehicles.v_name 
FROM
  bookings
  LEFT JOIN clients ON bookings.c_id = clients.c_id
  JOIN vehicles ON bookings.v_id = vehicles.v_id 
WHERE
  bookings.bid_status = 0 
  AND bookings.booking_status = 'Pending' 
ORDER BY
  bookings.book_id DESC");
											
                                                while($brow = mysqli_fetch_array($bsql)){                                            
											
                                                    ?>                                            
											
                                            <option value="<?php echo $brow['book_id'] ?>">				
												
                                                <?php echo $brow['book_id'] ?> | <?php echo $brow['pickup'] ?> | <?php echo $brow['destination'] ?> | <?php echo $brow['pick_date'] ?> | <?php echo $brow['pick_time'] ?>											
                                            </option>                                                
											
                                                <?php                                            
											
                                                
                                                }                                            
											
                                                ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label">Bid Expiry Date</label>
                                        <input type="date" class="form-control" name="bid_date">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label">Expiry time</label>
                                        <input type="time" class="form-control" name="bid_time">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Bid Note</label>
                                        <textarea class="form-control" rows="3" name="bid_note"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success" data-bs-dismiss="modal">
                                <i class="ti ti-copy-plus"></i>
                                Add Booking for Bid
                            </button>
                        </div>
                    </form>
                    <script>    
						function validateForm() {        
							var book_idInput = document.getElementsByName("book_id")[0].value;        
							if (book_idInput === "") {            
								alert("Please fill in all required fields.");            
								return false;        
							}        
							return true;	    
						}                    
					</script>						
                </div>				
            </div>              								
        </div>					
    </div>
</div>       
<?php
include('footer.php');
?>