// booking.js

// -------- Booking Type & Customer Handling --------
document.addEventListener("DOMContentLoaded", function () {
    const bookingTypeSelect = document.getElementById("bookingType");
    const clientSelect = document.getElementById("clientSelect");
    const clientNameInput = document.getElementById("clientName");
    const customerPhoneInput = document.getElementById("customerPhone");
    const customerEmailInput = document.getElementById("customerEmail");
    const addCustomerBtn = document.getElementById("addCustomerBtn");
    const hiddenClientId = document.getElementById("client_id_hidden");
    const bookerCommissionField = document.getElementById("bookerCommissionField");

    // Booking type change handler
    bookingTypeSelect.addEventListener("change", function () {
        let selectedBookingType = bookingTypeSelect.value;
        let normalizedValue = parseInt(selectedBookingType, 10);

        // Show/Hide Booker Commission
        if (normalizedValue === 3) {
            bookerCommissionField.style.display = "block";
        } else {
            bookerCommissionField.style.display = "none";
        }

        // For booking types 4, 5, 6 → Manual customer entry
        if ([4, 5, 6].includes(normalizedValue)) {
            clientNameInput.classList.remove("d-none");
            clientSelect.classList.add("d-none");
            clientSelect.required = false;
            clientNameInput.required = true;
            clientNameInput.value = "";
            customerPhoneInput.value = "";
            customerEmailInput.value = "";

            // Fixed client ID
            hiddenClientId.value = "1001";

            // Disable modal button
            addCustomerBtn.classList.add("disabled");
            addCustomerBtn.removeAttribute("data-bs-toggle");
            addCustomerBtn.removeAttribute("data-bs-target");
        } else {
            clientNameInput.classList.add("d-none");
            clientSelect.classList.remove("d-none");
            clientNameInput.required = false;
            clientSelect.required = true;

            hiddenClientId.value = "";

            // Enable modal button
            addCustomerBtn.classList.remove("disabled");
            addCustomerBtn.setAttribute("data-bs-toggle", "modal");
            addCustomerBtn.setAttribute("data-bs-target", "#modal-customer");

            // Load clients dynamically
            $.ajax({
                type: "POST",
                url: "includes/bookings/get_clients.php",
                data: { b_type_id: selectedBookingType },
                success: function (response) {
                    clientSelect.innerHTML =
                        '<option value="">Select Customer</option>' + response;
                },
                error: function () {
                    console.error("Error fetching clients");
                },
            });
        }
    });

    // When client changes → Fetch details
    clientSelect.addEventListener("change", function () {
        let selectedClientId = clientSelect.value;
        let selectedBookingType = bookingTypeSelect.value;

        $.ajax({
            type: "POST",
            url: "includes/bookings/get_customer_details.php",
            data: {
                c_id: selectedClientId,
                b_type_id: selectedBookingType,
            },
            success: function (response) {
                let data = JSON.parse(response);
                if (data.error) {
                    console.error(data.error);
                    customerPhoneInput.value = "";
                    customerEmailInput.value = "";
                } else {
                    customerPhoneInput.value = data.phone;
                    customerEmailInput.value = data.email;
                }
            },
            error: function () {
                console.error("Error fetching customer details");
            },
        });
    });
});

// -------- Pickup Date Restriction --------
document.addEventListener("DOMContentLoaded", function () {
    let today = new Date().toISOString().split("T")[0];
    document.getElementById("pick_date").setAttribute("min", today);
});

// -------- Calculate Fare --------
$(document).ready(function () {
    $("#calculateFareBtn").on("click", function (e) {
        e.preventDefault();

        let distance = parseFloat($("#journeyDistance").val());
        let pickDate = new Date($('input[name="pick_date"]').val());
        let pickTime = $('input[name="pick_time"]').val();
        let vehicleId = $("#vehicleSelect").val();

        let vehiclePricing = parseFloat(fetchVehiclePricing(vehicleId));
        let baseFare = distance * vehiclePricing;

        if (isHoliday(pickDate)) {
            baseFare *= 1.1;
        }

        let pickHour = parseInt(pickTime.split(":")[0], 10);
        if (pickHour < 9 || pickHour >= 20) {
            baseFare *= 1.05;
        }

        $("#journeyFare").val(baseFare.toFixed(2));
    });

    function fetchVehiclePricing(vehicleId) {
        $.ajax({
            type: "POST",
            url: "fetch_vehicle_pricing.php",
            data: { vehicleId: vehicleId },
            success: function (response) {
                let data = JSON.parse(response);
                console.log("Fetched vehicle pricing:", data);
            },
            error: function () {
                console.error("Error fetching vehicle pricing");
            },
        });

        // fallback
        return 15.0;
    }

    function isHoliday(date) {
        return false;
    }
});

// -------- Form Validation --------
function validateForm() {
    let typeInput = document.getElementsByName("b_type_id")[0].value;
    let pickupInput = document.getElementsByName("pickup")[0].value;
    let dropoffInput = document.getElementsByName("dropoff")[0].value;
    let pdateInput = document.getElementsByName("pick_date")[0].value;
    let ptimeInput = document.getElementsByName("pick_time")[0].value;
    let fareInput = document.getElementsByName("journey_fare")[0].value;

    if (
        typeInput === "" ||
        pickupInput === "" ||
        dropoffInput === "" ||
        pdateInput === "" ||
        ptimeInput === "" ||
        fareInput === ""
    ) {
        alert("Please fill in all required fields.");
        return false;
    }
    return true;
}

// -------- Add Customer Validation --------
document.addEventListener("DOMContentLoaded", function () {
    let submitBtn = document.getElementById("submitBtn");
    if (submitBtn) {
        submitBtn.addEventListener("click", function () {
            const account_type = document.getElementById("account_type").value;
            const cname = document.getElementById("cname").value.trim();
            const cemail = document.getElementById("cemail").value.trim();
            const cphone = document.getElementById("cphone").value.trim();
            const cpass = document.getElementById("cpass").value.trim();
            const cgender = document.getElementById("cgender").value;

            if (!account_type) {
                alert("Account Type is required");
                return false;
            }
            if (!cname) {
                alert("Full Name is required");
                return false;
            }
            if (!cemail) {
                alert("Email is required");
                return false;
            }
            if (!cphone) {
                alert("Phone is required");
                return false;
            }
            if (!cpass) {
                alert("Password is required");
                return false;
            }
            if (!cgender) {
                alert("Gender is required");
                return false;
            }

            document.getElementById("customerForm").submit();
        });
    }
});


// -------- Google Maps Autocomplete + Distance --------
let autocompletePickup, autocompleteDropoff;

function initAutocomplete() {
    // Pickup field
    autocompletePickup = new google.maps.places.Autocomplete(
        document.getElementById("pickup"),
        { types: ["geocode"] }
    );
    autocompletePickup.setFields(["address_component", "geometry"]);
    autocompletePickup.addListener("place_changed", fillInPickup);

    // Dropoff field
    autocompleteDropoff = new google.maps.places.Autocomplete(
        document.getElementById("dropoff"),
        { types: ["geocode"] }
    );
    autocompleteDropoff.setFields(["address_component", "geometry"]);
    autocompleteDropoff.addListener("place_changed", fillInDropoff);
}

function fillInPickup() {
    const place = autocompletePickup.getPlace();
    if (place.geometry) {
        calculateDistance();
    }
}

function fillInDropoff() {
    const place = autocompleteDropoff.getPlace();
    if (place.geometry) {
        calculateDistance();
    }
}

function calculateDistance() {
    let pickup = document.getElementById("pickup").value;
    let dropoff = document.getElementById("dropoff").value;

    if (pickup && dropoff) {
        let service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix(
            {
                origins: [pickup],
                destinations: [dropoff],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC,
            },
            callback
        );
    }
}

function callback(response, status) {
    if (status === "OK") {
        let origins = response.originAddresses;
        let destinations = response.destinationAddresses;

        for (let i = 0; i < origins.length; i++) {
            let results = response.rows[i].elements;
            for (let j = 0; j < results.length; j++) {
                let element = results[j];
                if (element.status === "OK") {
                    let distanceText = element.distance.text;
                    let distanceValue = element.distance.value / 1000; // in km

                    $("#journeyDistance").val(distanceValue.toFixed(2));
                    $("#journeyFare").val(""); // reset fare (will recalc)
                }
            }
        }
    }
}
