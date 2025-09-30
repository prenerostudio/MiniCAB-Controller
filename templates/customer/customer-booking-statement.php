<div class="card-body">			
    <h2 class="mb-4">				    
        Customer Booking Statement
    </h2>
    <div class="row mb-3">
        <div class="card">
            <div class="card-body border-bottom py-3">
                <div id="table-adriver" class="table-responsive">
                    <table class="table" id="cstate">
                        <thead>																			                        
                            <tr>							                            
                                <th>ID</th>							
                                <th>Job Completion Date</th>							                                
                                <th>Job Details</th>							                                
                                <th>Total Pay</th>							                                
                                <th>Status</th>							                                
                                <th>Actions</th>							                                
                            </tr>							                            
                        </thead>						
                        <tbody class="table-tbody">														                                                        
                            <?php
                            $x = 0;
                            $isql = mysqli_query($connect, "SELECT invoice.*, jobs.book_id, bookings.b_type_id, bookings.pickup, bookings.destination, bookings.pick_date, bookings.pick_time, clients.c_name, clients.c_phone, booking_type.b_type_name, drivers.d_name, drivers.d_phone FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN clients ON invoice.c_id = clients.c_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.c_id = '$c_id'");
                            while ($irow = mysqli_fetch_array($isql)) :	
                                $x++;
                            ?>
                            <tr>																					
                                <td class="sort-id">															
                                    <?php echo $x; ?>
                                </td>							                                
                                <td class="sort-date">																
                                    <?php echo $irow['invoice_date'];?>
                                </td>							                                                            
                                <td>							                                
                                    Booking ID: <?php echo $irow['book_id'];?><br>												
				<?php echo $irow['pickup'];?> - <?php echo $irow['destination'];?>                                                              
                                </td>							                                
                                <td class="sort-pay">																
                                    <?php echo $irow['total_pay'];?>
                                </td> 																						                                
                                <td class="sort-status">
                                    <?php echo $irow['invoice_status'];?>                                                                       
                                </td>
                                <td>
                                    <a href="invoice.php?invoice_id=<?php echo $irow['invoice_id']; ?>">
                                        <button class="btn btn-info">								                                        
                                            <i class="ti ti-eye"></i>									                                            
                                            View Invoice									                                            
                                        </button>								                                        
                                    </a>								                                    
                                </td>							                                
                            </tr>										
                            <?php endwhile; ?>
                            <?php if ($x === 0) : ?>                                    
                            <tr>							                            
                                <td colspan="8">							
                                    <p align="center">No Invoice Found!</p>									                                    
                                </td>							                                
                            </tr>										
                            <?php  endif; ?>
                        </tbody>										                        
                    </table>																		                    
                </div>										                
            </div>										            
        </div>									        
    </div>				    
</div>  										
<script>					
    $(document).ready(function() {       
        $('#cstate').DataTable();	    
    });    
</script>	