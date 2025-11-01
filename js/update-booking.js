document.addEventListener("DOMContentLoaded", function () {

    // --- 1. Set min pickup date ---
    var today = new Date().toISOString().split('T')[0];
    document.getElementById('pick_date').setAttribute('min', today);

    // --- 2. Show/Hide booker commission ---
    var bookingTypeSelect = document.getElementById("bookingType");
    var bookerCommissionField = document.getElementById("bookerCommissionField");
    if (bookingTypeSelect) {
        if (bookingTypeSelect.value == 3) {
            bookerCommissionField.style.display = "block";
        } else {
            bookerCommissionField.style.display = "none";
        }
    }

    // --- 3. Initialize Google Autocomplete ---
    function initAutocompleteForInput(input) {
        if (!input) return;
        let autocomplete = new google.maps.places.Autocomplete(input, {
            types: ['geocode'],
            componentRestrictions: { country: 'GB' }
        });
        autocomplete.addListener('place_changed', updateDistanceAndFare);
    }

    initAutocompleteForInput(document.getElementById('pickup'));
    initAutocompleteForInput(document.getElementById('dropoff'));

    // Also apply autocomplete for existing stop inputs
    document.querySelectorAll('input[name="stops[]"]').forEach(stopInput => {
        initAutocompleteForInput(stopInput);
    });

    // --- 4. Distance + Fare calculation ---
    function updateDistanceAndFare() {
        let pickup = document.getElementById('pickup').value;
        let dropoff = document.getElementById('dropoff').value;
        if (!pickup || !dropoff) return;

        let service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix({
            origins: [pickup],
            destinations: [dropoff],
            travelMode: google.maps.TravelMode.DRIVING
        }, function (response, status) {
            if (status === 'OK' && response.rows.length > 0) {
                let element = response.rows[0].elements[0];
                if (element.status === 'OK') {
                    let distanceKm = element.distance.value / 1000;
                    document.getElementById('journeyDistance').value = distanceKm.toFixed(2);

                    // Fetch vehicle pricing & calculate fare
                    let vehicleId = document.getElementById('vehicleSelect').value;
                    fetchVehiclePricing(vehicleId, function (pricePerKm) {
                        let baseFare = distanceKm * pricePerKm;

                        // Holiday surcharge
                        let pickDate = new Date(document.getElementById('pick_date').value);
                        if (isHoliday(pickDate)) baseFare *= 1.1;

                        // Night surcharge
                        let pickTime = document.querySelector('input[name="pick_time"]').value;
                        if (pickTime) {
                            let hour = parseInt(pickTime.split(':')[0], 10);
                            if (hour < 9 || hour >= 20) baseFare *= 1.05;
                        }

                        document.getElementById('journeyFare').value = baseFare.toFixed(2);
                    });
                }
            } else {
                console.error("Distance calc error:", status);
            }
        });
    }

    // --- 5. AJAX: fetch vehicle pricing ---
    function fetchVehiclePricing(vehicleId, callback) {
        $.ajax({
            type: 'POST',
            url: 'fetch_vehicle_pricing.php',
            data: { vehicleId: vehicleId },
            success: function (response) {
                try {
                    let data = JSON.parse(response);
                    callback(data.price_per_km ? parseFloat(data.price_per_km) : 15.0);
                } catch (e) {
                    callback(15.0);
                }
            },
            error: function () {
                callback(15.0);
            }
        });
    }

    // --- 6. Example holiday logic ---
    function isHoliday(date) {
        return false; // replace with your own holiday check
    }

    // --- 7. Trigger fare update on relevant changes ---
    $('#pickup, #dropoff, #vehicleSelect, #pick_date, input[name="pick_time"]').on('change', updateDistanceAndFare);

});

// --- 8. Cancel Booking ---
function cancelBooking(bookId) {
    let confirmation = confirm("Are you sure you want to cancel this booking?");
    if (confirmation) {
        let reason = prompt("Please provide a reason for canceling this booking:");
        if (reason) {
            window.location.href = `cancel-booking.php?book_id=${bookId}&reason=${encodeURIComponent(reason)}`;
        } else {
            alert("You must provide a reason for cancellation.");
        }
    }
}

