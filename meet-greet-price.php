<div class="card-body">
    <h2 class="mb-4">
        Meet & Greet Charges
    </h2>
    <p align="justify">
        When picking up a <strong>MiniCAB</strong> customer at the airport, we expect that the driver is available to meet & greet the customer as they arrive and direct them to the car. The price that you appear for on the site should therefore include any meet and greet charges you may have. Using the below tool you can add any fees you may have and these will automatically be added on top of any price you appear for on the minicaboffice.com website regardless of whether this has been calculated via by mileage, location or postcode area pricing.<br><br>
        This flat fee will apply for your selected location as well as 0.2 miles around the location to ensure that the charge still applies for nearby locations also.<br><br>
        If you charge a meet and greet charge for a location that you can’t find below, please request this via email to admin@minicaboffice.com.<br><br>
        Please add reasonable pickup charges for these airports, as relevant. Any requests to add reasonable pickup charges for other venues can be sent to admin@minicaboffice.com, for the MiniCAB  team to consider.
	</p>
    <div class="row">        
        <table class="table">                   
            <tr>            
                <td>Pickup Locations</td>                
                <td>Pickup Charges</td>                
                <td></td>                
            </tr>           				            
            <tr>                                 
            <form action="mg_process.php" method="post">			            
                <td style="width: 50%;">
                    <input type="text" name="pickup" class="form-control" id="pickup_location" required />
                </td>
                <td>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                £
                            </span>
                        </div>
                        <input type="text" name="price" class="form-control" aria-label="Amount (to the nearest pound)" required />
                    </div>
                </td>
                <td>
                    <button type="submit" class="btn btn-success" style="width: 100%;">
                        <i class="ti ti-plus"></i>
                        Add
                    </button>
                </td>
            </form>		            
        </tr>		            			           														               				        
        </table>
    </div>
    <div class="row">
        <table class="table table-responsive">
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>Pickup Locations</td>
                    <td>Pickup Charges</td>
                    <td></td>
                </tr>		
				<?php
                $n=0;
                $mgsql=mysqli_query($connect,"SELECT * FROM `mg_charges`");
                while($mgrow = mysqli_fetch_array($mgsql)){						
                    $n++;
                    ?>															
                <tr>
                    <td style="width: 4%;">
                        <?php echo $n; ?>
                    </td>
                    <td style="width: 50%;">
                        <?php echo $mgrow['pickup_location'] ?>	
                    </td>
                    <td>
                        <?php echo $mgrow['pickup_charges'] ?>
                    </td>
                    <td>
                        <a href="edit-mg.php?mg_id=<?php echo $mgrow['mg_id']; ?>">
                            <button class="btn btn-info">
                                <i class="ti ti-pencil"></i>
                            </button>
                        </a>
                        <a href="del-mg.php?mg_id=<?php echo $mgrow['mg_id'];?>">
                            <button class="btn btn-danger">
                                <i class="ti ti-square-rounded-x"></i>
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
<script>
    function init_locAutocomplete() {
        var pickup_locationInput = document.getElementById('pickup_location'); // Correct the field ID
        var autocompleteOptions = {        
            types: ['geocode'],
            componentRestrictions: { country: 'GB' } // Restrict to the UK
        };        
        // Initialize Google Places Autocomplete for pickup location input field
        var autocompletePickupLoc = new google.maps.places.Autocomplete(pickup_locationInput, autocompleteOptions);        
        // Event listener when a place is selected
        autocompletePickupLoc.addListener('place_changed', function () {
            var place = autocompletePickupLoc.getPlace();
            if (!place.geometry) {
                console.error('No details available for input: ' + place.name);
                return;
            }
            // Handle place selection and other logic here if needed
        });
    }    
    // Ensure the correct initialization function is used when the window loads
    google.maps.event.addDomListener(window, 'load', init_locAutocomplete);  
</script>