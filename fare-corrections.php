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
	
                Fares Corrections Section              				
		
            </h2>              			
	
        </div>						
	
    </div>	
</div>          
<div class="page-body page_padding">          	

    <div class="row row-deck row-cards">	

        <div class="card">						
	
            <div class="card-header">								
	
                <h2 class="page-title">              								
		
                    Fare Requests List             								
		
                </h2>																
		
            </div>            				
	
            <div class="card-body">            					
	
                <div id="table-default" class="table-responsive">            								
		
                    <table class="table table-responsive" id="fares">
		
                        <thead>
			
                            <tr align="center">
			
                                <th>ID</th>											
				
                                <th>Job</th>											
				
                                <th >Driver</th>
				
                                <th>Journey Fare</th>										
				
                                <th>Car Parking</th> 												
				
                                <th>Waiting</th> 						
				
                                <th>Tolls</th> 
				
                                <th>Extras</th> 
				
                                <th>Status</th> 												
				
                                <th></th>				
				
                            </tr>
			
                        </thead>                    																		
			
                        <tbody> 																				
			
				
                            <?php					
							
                            $n = 0;					
							
                            $fsql=mysqli_query($connect,"SELECT fares.*, drivers.*, bookings.book_id, bookings.pickup, bookings.destination, bookings.pick_date, bookings.pick_time, jobs.book_id FROM fares INNER JOIN jobs ON fares.job_id = jobs.job_id INNER JOIN drivers ON fares.d_id = drivers.d_id INNER JOIN bookings ON jobs.book_id = bookings.book_id ORDER BY fares.fare_id DESC");
							
                            while($frow = mysqli_fetch_array($fsql)){						
								
                                $n++;					
							
                                ?>
							
                            <tr align="center">						
			
                                <td>
				
					<?php echo $n; ?>						

                                </td>                 						
				
                                <td style="width: 40%;">														
				
                                    <strong>Booking ID:</strong><?php echo $frow['job_id'];?><br>							
				
                                    <strong>Pickup:</strong><?php echo $frow['pickup']; ?> <br>
				
                                    <strong>Dropoff:</strong><?php echo $frow['destination']; ?>
				
                                </td>						
				
                                <td>							
				
					<?php echo $frow['d_name']; ?>							

                                </td>						
				
                                <td>
				
					<?php echo $frow['journey_fare']; ?>

                                </td> 
				
                                <td>
				
					<?php echo $frow['car_parking']; ?>

                                </td> 											
				
                                <td>
				
					<?php echo $frow['waiting']; ?>														

                                </td>
				
                                <td>
				
					<?php echo $frow['tolls']; ?>

                                </td>
				
                                <td>
				
					<?php echo $frow['extras']; ?>

                                </td>
				
                                <td>
				
					<?php echo $frow['fare_status']; ?>

                                </td>
				
                                <td class="text-end">											
				
					<?php											

                                        if($frow['fare_status']=='Corrected'){
					
                                            ?>
					
                                    <button class="btn btn-twitter btn-icon" disabled>
				
                                        <i class="ti ti-eye"></i>										
					
                                    </button>
				
					<?php						

                                        }else{
					
                                            ?>
					
                                    <a href="correction-details.php?id=<?php echo $frow['fare_id']; ?>">
				
                                        <button class="btn btn-twitter btn-icon">
					
                                            <i class="ti ti-eye"></i>											
					
                                        </button>
					
                                    </a>
				
					<?php								

                                        }
					
                                        											

                                
                                        if($frow['fare_status']=='Corrected'){							
					
                                            ?>		
					
                                    <button class="btn btn-success btn-icon" disabled>									
				
                                        <i class="ti ti-checks"></i>
					
                                        
					
                                    </button>
				
					<?php						

                                        }else{							
					
                                            ?>							
					
                                    <a href="approve-fares.php?id=<?php echo $frow['fare_id']; ?>">
				
                                        <button class="btn btn-success btn-icon">
					
                                            <i class="ti ti-checks"></i>
					
                                            
					
                                        </button>																		
					
                                    </a>							
				
					<?php							

                                        }						
					
                                        ?>													
					
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
<script>	

    $(document).ready(function() {
    
        $('#fares').DataTable();

});
</script>
<?php	
include('footer.php');	
?>