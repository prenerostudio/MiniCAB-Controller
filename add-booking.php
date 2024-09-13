<?php
include('header.php');
?>  

<div class="page-body page_padding">
    <div class="row row-deck row-cards">			      			
        <div class="col-12">            						
            <div class="card">                							
                <div class="card-header">                    								
                    <h3 class="card-title">Create New Booking</h3>		
                </div>                  				
                <div class="card-body border-bottom py-3">
                    <form method="post" action="booking-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">				
                        <div class="modal-body">							
                            <div class="row">   
                                <div class="mb-3 col-md-3">        
                                    <label class="form-label">Booking Type</label>        
                                    <select class="form-control" name="b_type_id" id="bookingType" required>            
                                        <option value="">Select Booking Type</option>            
                                        <?php            
                                        $btsql = mysqli_query($connect, "SELECT * FROM `booking_type`");            
                                        while ($btrow = mysqli_fetch_array($btsql)) {            
                                        ?>            
                                        <option value="<?php echo $btrow['b_type_id'] ?>">                
                                            <?php echo $btrow['b_type_name'] ?>			
                                        </option>            
                                        <?php            
                                        }            
                                        ?>        
                                    </select>    
                                </div>    
                                <div class="mb-3 col-lg-3">        
                                    <label class="form-label">Name</label>        
                                    <input type="text" class="form-control d-none" name="c_name" id="clientName" required>
                                    <select class="form-control" name="c_id" id="clientSelect" required></select>
                                </div>
                                <div class="mb-3 col-lg-3">
                                    <label class="form-label">Customer Phone</label>        
                                    <input type="text" class="form-control" name="cphone" id="customerPhone" required>    
                                </div>    
                                <div class="mb-3 col-lg-3">        
                                    <label class="form-label">Customer Email</label>        
                                    <input type="email" class="form-control" name="cemail" id="customerEmail" required>    
                                </div>
                            </div>
                            <div class="row">							
                                <h4>Journey Details:</h4>								
                                <div class="col-lg-12">								
                                    <div class="row">												
                                        <div class="mb-3 col-lg-4">   								
                                            <label class="form-label">Pickup Location:</label>
                                            <div class="input-group">
                                                <input type="text" id="pickup" name="pickup" class="form-control" placeholder="Select pickup location" required>
<!--
                                                <span class="input-group-text">
                                                    <i class="ti ti-map" id="pickup-map-icon" style="cursor: pointer;" data-field="pickup" data-bs-toggle="modal" data-bs-target="#mapModal"></i>
                                                </span>
-->
                                            </div>
                                        </div>
                                        <div class="mb-3 col-lg-4">
                                            <label class="form-label">Drop-off Location:</label>
                                            <div class="input-group">
                                                <input type="text" id="dropoff" name="dropoff" class="form-control" placeholder="Select drop-off location" required>
<!--
                                                <span class="input-group-text">
                                                    <i class="ti ti-map" id="dropoff-map-icon" style="cursor: pointer;" data-field="dropoff" data-bs-toggle="modal" data-bs-target="#mapModal"></i>
                                                </span>
-->
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div id="stops-container"></div>
                                            <div class="mb-3 col-lg-2">								
                                                <button id="add-stop-btn" class="btn btn-info" style="margin-top: 25px;" title="Add Stop">
                                                    <i class="ti ti-plus"></i>
                                                </button>									
                                            </div>									
                                        </div>
                                    </div>
                                </div>		
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Address</label>
                                    <input type="text" class="form-control" name="address">
                                </div>							
                                <div class="mb-3 col-lg-4">				
                                    <label class="form-label">Postal Code</label>
                                    <select class="form-control" name="postal_code" required>
                                        <option value="">Search PostCode</option>								
                                        <?php								
                                        $pcsql = mysqli_query($connect, "SELECT * FROM `post_codes`");								
                                        while ($pcrow = mysqli_fetch_array($pcsql)) {
                                        ?>
                                        <option><?php echo $pcrow['pc_name']; ?></option>								
                                        <?php								
                                        }
                                        ?>							
                                    </select>
                                </div>							
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">No. of Passenger</label>
                                    <input type="number" class="form-control" name="passenger" required>
                                </div>								 
                                <div class="mb-3 col-lg-4">        
                                    <label class="form-label">Pickup Date</label>        
                                    <input type="date" class="form-control" name="pick_date" id="pick_date" required>    
                                </div>    
                                <script>        
                                    document.addEventListener("DOMContentLoaded", function() {            
                                        var today = new Date().toISOString().split('T')[0];            
                                        document.getElementById('pick_date').setAttribute('min', today);        
                                    });    
                                </script>													
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Pickup Time</label>
                                    <input type="time" class="form-control" name="pick_time" required>
                                </div>																
                                <div class="mb-3 col-lg-4">								
                                    <div class="form-label">Journey Type</div>					
                                    <div class="mb-3">
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="journey_type" value="One Way">
                                            <span class="form-check-label">One Way</span>
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="journey_type" value="Return">
                                            <span class="form-check-label">Return</span>
                                        </label>
                                    </div>	
                                </div>						
                            </div>												
                            <div class="row">	
                                <div class="mb-3 col-lg-4">    								
                                    <label class="form-label">Vehicle Type</label>	
                                    <select class="form-control" name="v_id" id="vehicleSelect" onchange="updateJourneyFare()">
                                        <option value="">Select Vehicle</option>		
                                        <?php        									
                                        $vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
                                        while ($vrow = mysqli_fetch_array($vsql)) {
                                        ?>           									
                                        <option value="<?php echo $vrow['v_id'] ?>">
                                            <?php echo $vrow['v_name'] ?>
                                        </option>           									
                                        <?php       									
                                        }        									
                                        ?>    								
                                    </select>							
                                </div>															
                                <div class="mb-3 col-lg-4">				
                                    <label class="form-label">Luggage</label>
                                    <input type="text" class="form-control" name="luggage">
                                </div> 															
                                <div class="mb-3 col-lg-4">								
                                    <div class="form-label">Child Seat</div>						
                                    <div>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="Yes">
                                            <span class="form-check-label">Yes</span>
                                        </label>
                                        <label class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="child_seat" value="No">
                                            <span class="form-check-label">No</span>
                                        </label>								
                                    </div>				
                                </div>															
                                <div class="mb-3 col-lg-4">          								
                                    <label class="form-label">Flight Number</label>
                                    <input type="text" class="form-control" name="flight_number">
                                </div>															
                                <div class="mb-3 col-lg-4">          								
                                    <label class="form-label">Delay Time</label>
                                    <input type="text" class="form-control" name="delay_time">
                                </div>													
                            </div>												
                            <div class="row">							
                                <div class="mb-3">				
                                    <label class="form-label">Special Note</label>	
                                    <textarea class="form-control" rows="3" name="note"></textarea>
                                </div> 							
                            </div>    												
                            <div class="row">						
                                <h4>Pricing Section</h4>	
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Booking Fee</label>
                                    <input type="text" class="form-control" name="booking_fee">
                                </div>														
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Car Parking</label>
                                    <input type="text" class="form-control" name="car_parking">
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Waiting Charges</label>
                                    <input type="text" class="form-control" name="waiting">
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Tolls</label>
                                    <input type="text" class="form-control" name="tolls">
                                </div>							
                                <div class="mb-3 col-lg-4">          
                                    <label class="form-label">Extra</label>
                                    <input type="text" class="form-control" name="extra">
                                </div>
                                <div class="mb-3 col-lg-4" id="bookerCommissionField" style="display: none;">    
                                    <label class="form-label">Booker Commission</label>   
                                    <input type="text" class="form-control" name="booker_com">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Distance (Auto-calculated)</label>
                                    <input type="text" class="form-control" name="journey_distance" id="journeyDistance" readonly>
                                </div>	
                                <div class="mb-3 col-lg-4">										
                                    <label class="form-label">Journey Fare</label>
                                    <input type="text" class="form-control" name="journey_fare" id="journeyFare" required>	
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <button class="btn btn-instagram" style="margin-top:27px;" id="calculateFareBtn">Calculate Fare</button>
                                </div>
                                <div class="col-lg-4">			
                                    <h4>Send Online Payment Link</h4>		
                                    <p>			
                                        <label>		
                                            <input type="checkbox" name="Payment Link" value="checkbox" id="PaymentLink_0">
                                            Phone Number									
                                        </label>
                                        <br>	
                                        <label>							      
                                            <input type="checkbox" name="Payment Link" value="checkbox" id="PaymentLink_1">
                                            Email Address									
                                        </label>
                                        <br>					
                                    </p>
                                </div>										
                            </div>					  												
                        </div>	
                        <div class="modal-footer">
                            <a href="all-bookings.php" class="btn btn-danger"> 						
                                <i class="ti ti-circle-x"></i>						
                                Cancel
                            </a>		
                            <button type="submit" class="btn btn-success ms-auto">
                                <i class="ti ti-message-plus"></i>						
                                Save Booking
                            </button>
                        </div> 										
                    </form>						
                </div>                                                    							
            </div>              					
        </div>			
    </div>
</div>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete" async defer></script>

<script>
let map, marker, selectedField = '', geocoder;
let autocompletePickup, autocompleteDropoff;
let journeyDistanceInput = document.getElementById('journeyDistance'); // Ensure this element exists in your HTML

// Initialize Google Maps
function initMap() {
    const initialLocation = { lat: 51.5074, lng: -0.1278 }; // London
    map = new google.maps.Map(document.getElementById("mapb"), {
        center: initialLocation,
        zoom: 8,
    });

    marker = new google.maps.Marker({
        position: initialLocation,
        map: map,
        draggable: true
    });

    geocoder = new google.maps.Geocoder();

    google.maps.event.addListener(marker, 'dragend', () => {
        geocodePosition(marker.getPosition());
    });

    google.maps.event.addListener(map, 'click', (event) => {
        marker.setPosition(event.latLng);
        geocodePosition(marker.getPosition());
    });
}

function geocodePosition(pos) {
    geocoder.geocode({ location: pos }, (responses) => {
        if (responses && responses.length > 0) {
            document.getElementById(selectedField).value = responses[0].formatted_address;
        } else {
            alert("Cannot determine address at this location.");
        }
    });
}

function initAutocomplete() {
    const pickupInput = document.getElementById('pickup');
    const dropoffInput = document.getElementById('dropoff');

    const autocompleteOptions = {
        types: ['geocode'],
        componentRestrictions: { country: 'GB' }
    };

    autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
    autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);

    autocompletePickup.addListener('place_changed', () => {
        updateDistance();
        updateJourneyFare();
    });

    autocompleteDropoff.addListener('place_changed', () => {
        updateDistance();
        updateJourneyFare();
    });
}

function updateDistance() {
    const pickupPlace = autocompletePickup.getPlace();
    const dropoffPlace = autocompleteDropoff.getPlace();
    if (pickupPlace.geometry && dropoffPlace.geometry) {
        calculateDistance(pickupPlace.geometry.location, dropoffPlace.geometry.location);
    }
}

function calculateDistance(pickupLocation, dropoffLocation) {
    const service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [pickupLocation],
        destinations: [dropoffLocation],
        travelMode: 'DRIVING',
    }, (response, status) => {
        if (status === 'OK' && response.rows.length > 0) {
            const distanceText = response.rows[0].elements[0].distance.text;
            const distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, ''));
            if (!isNaN(distanceValue)) {
                journeyDistanceInput.value = distanceValue.toFixed(2);
                updateJourneyFare(distanceValue);
            } else {
                console.error('Invalid distance value:', distanceText);
            }
        } else {
            console.error('Error calculating distance:', status);
        }
    });
}

    // Event listeners for booking type and client selection
    document.addEventListener('DOMContentLoaded', () => {
        const bookingTypeSelect = document.getElementById('bookingType');
        const clientSelect = document.getElementById('clientSelect');
        const clientNameInput = document.getElementById('clientName');
        const customerPhoneInput = document.getElementById('customerPhone');
        const customerEmailInput = document.getElementById('customerEmail');
        const bookerCommissionField = document.getElementById("bookerCommissionField");

        bookingTypeSelect.addEventListener('change', () => {
            const selectedBookingType = bookingTypeSelect.value;
            if (selectedBookingType == 4 || selectedBookingType == 5) {
                clientNameInput.classList.remove('d-none');
                clientSelect.classList.add('d-none');
                clientSelect.required = false;
                clientNameInput.required = true;
                clientNameInput.value = '';
                customerPhoneInput.value = '';
                customerEmailInput.value = '';
            } else {
                clientNameInput.classList.add('d-none');
                clientSelect.classList.remove('d-none');
                clientNameInput.required = false;
                clientSelect.required = true;

                $.ajax({
                    type: 'POST',
                    url: 'get_clients.php',
                    data: { b_type_id: selectedBookingType },
                    success: (response) => {
                        clientSelect.innerHTML = '<option value="">Select Customer</option>' + response;
                    },
                    error: () => {
                        console.error('Error fetching clients');
                    }
                });
            }
        });

        clientSelect.addEventListener('change', () => {
            const selectedClientId = clientSelect.value;
            const selectedBookingType = bookingTypeSelect.value;

            $.ajax({
                type: 'POST',
                url: 'get_customer_details.php',
                data: {
                    c_id: selectedClientId,
                    b_type_id: selectedBookingType
                },
                success: (response) => {
                    const data = JSON.parse(response);
                    if (data.error) {
                        console.error(data.error);
                        customerPhoneInput.value = '';
                        customerEmailInput.value = '';
                    } else {
                        customerPhoneInput.value = data.phone;
                        customerEmailInput.value = data.email;
                    }
                },
                error: () => {
                    console.error('Error fetching customer details');
                }
            });
        });

        bookingTypeSelect.addEventListener("change", () => {
            bookerCommissionField.style.display = this.value == 3 ? "block" : "none";
        });

        $('#calculateFareBtn').on('click', (e) => {
            e.preventDefault(); // Prevent the form from submitting
            const distance = parseFloat($('#journeyDistance').val());
            const pickDate = new Date($('input[name="pick_date"]').val());
            const pickTime = $('input[name="pick_time"]').val();
            const vehicleId = $('#vehicleSelect').val();
            const vehiclePricing = parseFloat(fetchVehiclePricing(vehicleId));
            let baseFare = distance * vehiclePricing;

            if (isHoliday(pickDate)) {
                baseFare *= 1.1;
            }

            const pickHour = parseInt(pickTime.split(':')[0], 10);
            if (pickHour < 9 || pickHour >= 20) {
                baseFare *= 1.05;
            }

            $('#journeyFare').val(baseFare.toFixed(2));
        });

        function fetchVehiclePricing(vehicleId) {
            $.ajax({
                type: 'POST',
                url: 'fetch_vehicle_pricing.php',
                data: { vehicleId: vehicleId },
                success: (response) => {
                    const data = JSON.parse(response);
                    callback(data);
                },
                error: () => {
                    console.error('Error fetching vehicle pricing');
                }
            });

            return 15.0; // Default value if fetching fails
        }

        function isHoliday(date) {
            return false; // Implement holiday logic as needed
        }

        function validateForm() {
            const requiredFields = [
                "b_type_id",
                "c_id",
                "pickup",
                "dropoff",
                "pick_date",
                "pick_time",
                "journey_fare"
            ];

            for (const field of requiredFields) {
                if (document.getElementsByName(field)[0].value === "") {
                    alert("Please fill in all required fields.");
                    return false;
                }
            }
            return true;
        }
    });

    // Check if Google Maps is already loaded
    if (!window.google || !window.google.maps) {
        const script = document.createElement('script');
        script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initMap";
        script.async = true;
        script.defer = true;
        document.head.appendChild(script);
    }

    // When the modal is opened, initialize or reset the map
    $('#mapModal').on('shown.bs.modal', () => {
        google.maps.event.trigger(map, "resize");
        map.setCenter(marker.getPosition());
    });

    // When the user clicks on the map icon, store which field to populate
    $('.ti-map').on('click', function () {
        selectedField = $(this).data('field');
    });

    // When the user selects a location and clicks "Select Location"
    document.getElementById("save-location").addEventListener("click", () => {
        const position = marker.getPosition();
        geocodePosition(position);
        $('#mapModal').modal('hide');
    });

    // Initialize the map after page load
    window.onload = () => {
    initMap();
    initAutocomplete();
};
</script>
 



<!-- Map Modal -->
<div class="modal fade" id="mapModal" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mapModalLabel">Select Location</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="mapb" style="height: 400px; width: 100%;"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save-location">Select Location</button>
      </div>
    </div>
  </div>
</div>

<?php
include('footer.php');
?>