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
	
                Driver Deletion Requests			
		
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
		
                        Driver Deletion Requests List
			
                    </h3>								
		
                </div>				
		
                <div class="card-body border-bottom py-3">				
		
                    <div id="table-adriver" class="table-responsive">					
		
                        <table class="table" id="del-driver">						
			
                            <thead>							
			
                                <tr>								
				
                                    <th>ID</th>													
				
                                    <th>Driver</th>													
				
                                    <th>Request Msg</th>
				
                                    <th>Request Status</th>
				
                                    <th>Actions</th>
				
                                </tr>
				
                            </thead>							
			
                            <tbody class="table-tbody">							
			
					
                                <?php								

                                        
                                $x = 0;								
								
                                $ddsql = mysqli_query($connect, "SELECT delete_drivers.*, drivers.* FROM delete_drivers JOIN drivers ON delete_drivers.d_id = drivers.d_id");
								
                                while ($ddrow = mysqli_fetch_array($ddsql)) :								
								
                                    $x++;								
								
                                ?>								
				
                                <tr>								
				
                                    <td>									
				

						<?php echo $x; ?>										

                                    </td>									
				
                                    <td>									
				
						<?php echo $ddrow['d_name'];?><br>

										
                                                    <?php echo $ddrow['d_email'];?><br>

										
                                                        <?php echo $ddrow['d_phone'];?>
									
                                    </td>									
									
                                    <td>									
				
						<?php echo $ddrow['request_msg'];?>										

                                    </td>
				
                                    <td>
				
						<?php 											

                                                if($ddrow['req_status'] == 0){
						
                                                    ?>												
						
                                        <div class="col-auto status">
					
                                            <span class="status-dot status-dot-animated bg-orange d-block"></span>
					
                                            <span>Pending</span>									
					
                                        </div>
					
					<?php									

                                        } elseif($ddrow['req_status'] == 1){											
					
                                            ?>
					
                                        <div class="col-auto status">
					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>
					
                                            <span>Approved</span>											
					
                                        </div>			
					
					<?php									

                                        }else{
					
                                            ?>
					
                                        <div class="col-auto status">
					
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>
					
                                            <span>Cancelled</span>											
					
                                        </div>
					
					<?php

                                        
					
                                        }
					
                                        ?>																			
					
                                    </td>
				
                                    <td>							
				
                                        <a href="cancel-driver-delete.php?del_d_id=<?php echo $ddrow['del_d_id']; ?>" class="btn btn-danger" title="Cancelled">
					
                                            <i class="ti ti-square-rounded-x"></i>
					
                                        </a>
					
                                        <a href="approve-driver-delete.php?del_d_id=<?php echo $ddrow['del_d_id']; ?>" class="btn btn-success" title="Approve">
					
                                            <i class="ti ti-check"></i>
					
                                        </a>
					
                                    </td>									
				
                                </tr>								
				
				<?php endwhile; ?>								

								<?php if ($x === 0) : ?>								

                                <tr>
				
                                    <td colspan="8">
				
                                        <p align="center">No Request Found!</p>										
					
                                    </td>									
				
                                </tr>								
				
				<?php endif; ?>								

                            </tbody>							
			
                        </table>               													
			
                    </div>           											
		
                </div>       											
		
            </div>   									
	
        </div>	
	
        
		
	
        <script>	
	
    $(document).ready(function() {    

        $('#del-driver').DataTable();
	
    });		

        </script>	
	
        
	
    </div>		
</div>
            
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
<script>		   	

    function validateForm() { 

        var ap_nameInput = document.getElementsByName("ap_name")[0].value;        				
	
        var ap_addressInput = document.getElementsByName("ap_address")[0].value;        						
	
        if (ap_nameInput === "" || ap_addressInput === "") {				
	
            alert("Please fill in all required fields.");			
	
            return false;			
	
        }		
	
        return true;    		
	
    }	 

    var autocompletePickup;   

    function initAutocomplete() {
    
        var pickupInput = document.getElementById('pickup');
        
        var autocompleteOptions = {
        
            types: ['geocode'],
            
            componentRestrictions: {country: 'GB'}
        
        };

        
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);

        
        autocompletePickup.addListener('place_changed', function() {
        
        
    });
    
    }
       
    
    google.maps.event.addDomListener(window, 'load', initAutocomplete);
	
</script>

<?php
include('footer.php');
?>