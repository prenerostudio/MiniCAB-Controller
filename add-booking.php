<?php
include('header.php');
?>  
<div class="page-body page_padding">
    <div class="row row-deck row-cards">			      			
        <div class="col-12">            							
            <div class="card">                								
                <div class="card-header">                    										
                    <h3 class="card-title">		
                        Create New Booking			
                    </h3>				
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
                                    <input type="text" class="form-control" name="cemail" id="customerEmail" required>
                                </div>
                            </div>
                            <script>
    var bookingTypeSelect = document.getElementById('bookingType');
    var clientSelect = document.getElementById('clientSelect');
    var clientNameInput = document.getElementById('clientName');
    var customerPhoneInput = document.getElementById('customerPhone');
    var customerEmailInput = document.getElementById('customerEmail');
    bookingTypeSelect.addEventListener('change', function () {
        var selectedBookingType = bookingTypeSelect.value;	
        if (selectedBookingType === 4 || selectedBookingType === 5) {	
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
                success: function (response) {		
        clientSelect.innerHTML = '<option value="">Select Customer</option>' + response; 	
    },                
                error: function () {                    		
        console.error('Error fetching clients');                	
    }                    
            });        	
        }    	
    });								    
    clientSelect.addEventListener('change', function () {
        var selectedClientId = clientSelect.value;        	
        var selectedBookingType = bookingTypeSelect.value;	
        $.ajax({	
            type: 'POST',                        	
            url: 'get_customer_details.php',                        	
            data: {                 	
                c_id: selectedClientId,                		
                b_type_id: selectedBookingType // Include booking type ID            		
            },	
            success: function (response) {                                	        
        var data = JSON.parse(response);                                	
        if (data.error) {                    	
            console.error(data.error);                    	
            customerPhoneInput.value = '';                    	
            customerEmailInput.value = '';                	
        } else {                    	
            customerPhoneInput.value = data.phone;                     	
            customerEmailInput.value = data.email;                	
        }            	
    },
            error: function () {                	
        console.error('Error fetching customer details');            	
    }                
        });        	
    });       
                            </script>
                            <div class="row">
                                <h4>Journey Details:</h4>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="mb-3 col-lg-4">
                                            <label class="form-label">Pickup Location:</label>
                                            <input type="text" id="pickup" name="pickup" class="form-control" placeholder="Select pickup location" required>
                                        </div>
                                        <div class="mb-3 col-lg-4">
                                            <label class="form-label">Drop-off Location:</label>
                                            <input type="text" id="dropoff" name="dropoff" class="form-control" placeholder="Select drop-off location" required>
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
                                        <option value=" ">Search PostCode</option>
					<?php
                                        $pcsql=mysqli_query($connect,"SELECT * FROM `post_codes`");
                                        while($pcrow = mysqli_fetch_array($pcsql)){
                                            ?>					
                                        <option>
                                            <?php echo $pcrow['pc_name']; ?>
                                        </option>													
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
                                    <label class="form-label">Flight Number </label>
                                    <input type="text" class="form-control" name="flight_number">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Delay Time </label>
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
                                    <label class="form-label">Booking Fee </label>
                                    <input type="text" class="form-control" name="booking_fee">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Car Parking </label>
                                    <input type="text" class="form-control" name="car_parking">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Waiting Charges </label>
                                    <input type="text" class="form-control" name="waiting">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Tolls </label>
                                    <input type="text" class="form-control" name="tolls">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Extra </label>
                                    <input type="text" class="form-control" name="extra">
                                </div>
                                <div class="mb-3 col-lg-4" id="bookerCommissionField" style="display: none;">
                                    <label class="form-label">Booker Commission </label>
                                    <input type="text" class="form-control" name="booker_com">
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Distance (Auto-calculated)</label>
                                    <input type="text" class="form-control" name="journey_distance" id="journeyDistance" readonly>
                                </div>				
                                <div class="mb-3 col-lg-4">
                                    <label class="form-label">Journey Fare</label>
                                    <input type="text" class="form-control"  name="journey_fare" id="journeyFare"  required>
                                </div>
                                <div class="mb-3 col-lg-4">
                                    <button class="btn btn-instagram" style="margin-top:27px;" id="calculateFareBtn">
                                        Calculate Fare
                                    </button>
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
                    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var bookingTypeSelect = document.getElementById("bookingType");
        var bookerCommissionField = document.getElementById("bookerCommissionField");
        bookingTypeSelect.addEventListener("change", function() {
        if (this.value === 3) {
            bookerCommissionField.style.display = "block";
        } else {
            bookerCommissionField.style.display = "none";
        }
    });
    });			
    $(document).ready(function() {
        $('#calculateFareBtn').on('click', function(e) {
        e.preventDefault(); // Prevent the form from submitting
        var distance = parseFloat($('#journeyDistance').val());
        var pickDate = new Date($('input[name="pick_date"]').val());
        var pickTime = $('input[name="pick_time"]').val();
        var vehicleId = $('#vehicleSelect').val();
        var vehiclePricing = parseFloat(fetchVehiclePricing(vehicleId));
        var baseFare = distance * vehiclePricing;
        if (isHoliday(pickDate)) {
            baseFare *= 1.1;
        }
        var pickHour = parseInt(pickTime.split(':')[0], 10);
        if (pickHour < 9 || pickHour >= 20) {
            baseFare *= 1.05;
        }
        $('#journeyFare').val(baseFare.toFixed(2));
    });
        function fetchVehiclePricing(vehicleId, distance) {	        	
        $.ajax({            	
            type: 'POST',            	
            url: 'fetch_vehicle_pricing.php',            	
            data: { vehicleId: vehicleId,
                    distance: distance},            	
            success: function(response) {			                	
        var data = JSON.parse(response);	
        callback(data);            	
    },            
            error: function() {	
    }        
        });            	
        return 15.0;         	
    }        							        
        function isHoliday(date) {            								
        return false;        	
    }    
    });    
    function validateForm() {                
        var typeInput = document.getElementsByName("b_type_id")[0].value;	
        var cidInput = document.getElementsByName("c_id")[0].value;        	
        var pickupInput = document.getElementsByName("pickup")[0].value;	
        var dropoffInput = document.getElementsByName("dropoff")[0].value;	
        var pdateInput = document.getElementsByName("pick_date")[0].value;	
        var ptimeInput = document.getElementsByName("pick_time")[0].value;	
        var fareInput = document.getElementsByName("journey_fare")[0].value;	
        if (typeInput === "" || cidInput === "" || pickupInput === "" || dropoffInput === "" || pdateInput === "" || ptimeInput === "" || fareInput === "") {            	
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
<!-- Include the Google Maps API script -->  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete"
    async defer></script>
    <script>	
    function initAutocomplete() {            
        var pickupInput = document.getElementById('pickup');                
        var dropoffInput = document.getElementById('dropoff');    
        var stopInput = document.getElementById('stop');    
        var journeyDistanceInput = document.getElementById('journeyDistance');		                
        var autocompleteOptions = {        
            types: ['geocode'],                            
            componentRestrictions: {country: 'GB'}        
        };				                
        var autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);    
        var autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput, autocompleteOptions);    
        var autocompleteStop = new google.maps.places.Autocomplete(stopInput, autocompleteOptions); // Initialize autocomplete for stop field
        autocompletePickup.addListener('place_changed', function () {        
        updateDistance();        
        updateJourneyFare();        
    });
       autocompleteDropoff.addListener('place_changed', function () {        
        updateDistance();                
        updateJourneyFare();        
    });	
        autocompleteStop.addListener('place_changed', function () { // Add listener for stop input field
        updateDistance();        
        updateJourneyFare();        
    });
        function handleSuggestions(predictions, inputField) {                
        var addresses = predictions.map(function(prediction) {                    
        return prediction.description;                
    });			                        
        updateAutocompleteSuggestions(inputField, addresses);    
    }    
        function updateAutocompleteSuggestions(inputField, suggestions) {        
        var datalistId = inputField.id + '_datalist';                            
        var datalist = document.getElementById(datalistId);			                            
        if (!datalist) {                    
            datalist = document.createElement('datalist');                                        
            datalist.id = datalistId;                                        
            document.body.appendChild(datalist);                
        }						            
        datalist.innerHTML = '';			                            
        suggestions.forEach(function(suggestion) {                    
        var option = document.createElement('option');                                    
        option.value = suggestion;                                    
        datalist.appendChild(option);                
    });						                        
        inputField.setAttribute('list', datalistId);        
    }        
        function updateDistance() {
        var pickupPlace = autocompletePickup.getPlace();                            
        var dropoffPlace = autocompleteDropoff.getPlace();			                            
        if (pickupPlace.geometry && dropoffPlace.geometry) {                    
            calculateDistance(pickupPlace.geometry.location, dropoffPlace.geometry.location);                
        }        
    }	            
        function calculateDistance(pickupLocation, dropoffLocation) {            
        var service = new google.maps.DistanceMatrixService();            
        service.getDistanceMatrix({                
            origins: [pickupLocation],                    
            destinations: [dropoffLocation],                    
            travelMode: 'DRIVING',        
        }, function(response, status) {        
    if (status === 'OK' && response.rows.length > 0) {            
        var distanceText = response.rows[0].elements[0].distance.text;                    
        var distanceValue = parseFloat(distanceText.replace(/[^\d.]/g, ''));        
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
}	
    google.maps.event.addDomListener(window, 'load', initAutocomplete);  
    </script>	
        <?php
        include('footer.php');
        ?>