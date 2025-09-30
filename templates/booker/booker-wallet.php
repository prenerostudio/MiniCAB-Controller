<div class="card-body">										
    <h2 class="mb-4">Booker Wallet</h2>												    
    <div class="row mb-3">												    
        <div class="card"> 				        
            <div class="card-body border-bottom py-3">					            
                <div id="table-adriver" class="table-responsive">						                
                    <table class="table" id="bwallet">						                    
                        <thead>                        
                            <tr>							                            
                                <th>ID</th>
                                <th>Job Completion Date</th>                                
                                <th>Job Details</th>                                
                                <th>Total Commission</th>                                
                                <th>Status</th>                                
                                <th>Actions</th>                                
                            </tr>							                                
                        </thead>						                        
                        <tbody class="table-tbody">                                                       
                            <?php                            
                            $x = 0;   
                            $isql = mysqli_query($connect, "SELECT ba.*, c.*, bk.*, bt.* FROM booker_account AS ba JOIN clients AS c ON ba.c_id = c.c_id JOIN bookings AS bk ON ba.book_id = bk.book_id JOIN booking_type AS bt ON bk.b_type_id = bt.b_type_id WHERE ba.c_id = '$c_id'");                            
                            while ($irow = mysqli_fetch_array($isql)) :
                                $x++;														                                
                            ?>							                            
                            <tr>							
                                <td>																
                                    <?php echo $x; ?>
                                </td>                                    
                                <td>															
                                    <?php echo $irow['commission_date']; ?>                                    
                                </td>                                
                                <td>                                
                                    Booking ID: <?php echo $irow['book_id']; ?> <br>																
                                    <?php echo $irow['pickup']; ?> - 																
                                    <?php echo $irow['destination']; ?>					
                                </td>							                                
                                <td>												
                                    <?php echo $irow['comission_amount']; ?>                                    
                                </td>                                
                                <td>																
                                    <?php						
                                    if($irow['comission_status']=='Unpaid'){				
                                    ?>          					
                                    <div class="col-auto status">                                    
                                        <span class="status-dot status-dot-animated bg-red d-block"></span>                                        
                                        <span>Unpaid</span>                                        
                                    </div>
                                    <?php
                                    } else{
                                    ?>
                                    <div class="col-auto status">	                                    
                                        <span class="status-dot status-dot-animated bg-green d-block"></span>                                        
                                        <span>Paid</span>								                                        
                                    </div>												
                                    <?php					                                    
                                    }                                   					                                    
                                    ?>                                        
                                </td>                                
                                <td>                                
                                    <a href="booker-invoice.php?acc_id=<?php echo $irow['acc_id']; ?>">								                                    
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
        $('#bwallet').DataTable();	    	
    });                            
</script>	