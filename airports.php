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
                Airports Section
            </h2>
        </div>
    </div>
</div>
<div class="page-body page_padding">          		
    <div class="row row-deck row-cards">					  								
        <div class="col-7">					
            <div class="card">							
                <div class="card-header">										
                    <h3 class="card-title">		
                        Airports List			
                    </h3>											
                </div>										
                <div class="card-body border-bottom py-3">										
                    <div id="table-adriver" class="table-responsive">									
                        <table class="table" id="airports">			
                            <thead>							
                                <tr>													
                                    <th> ID </th>																	
                                    <th> Airport Name </th>				
                                    <th> Address </th>				
                                    <th> Actions </th>				
                                </tr>									
                            </thead>			
                            <tbody class="table-tbody">								
                                <?php
                                $x = 0;
                                $asql = mysqli_query($connect, "SELECT * FROM `airports`");
                                while ($arow = mysqli_fetch_array($asql)) :                                   								
                                    $x++;
                                ?>
                                <tr>
                                    <td>
                                        <?php echo $x; ?>
                                    </td>
                                    <td>
                                        <?php echo $arow['ap_name']; ?>	
                                    </td>
                                    <td>
                                        <?php echo $arow['ap_address']; ?>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" class="btn btn-danger deleteAirportBtn" data-id="<?php echo $arow['ap_id']; ?>" title="Delete">    
                                            <i class="ti ti-square-rounded-x"></i>
                                        </a>
                                    </td>
                                </tr>												
                                    <?php endwhile; ?>							
                                    <?php if ($x === 0) : ?>
                                <tr>
                                    <td colspan="8">
                                        <p align="center">No Airport Found!</p>
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
                $('#airports').DataTable({                
                    responsive: true,                                
                    dom: 'Bfrtip',                                
                    buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                                
                    language: {                        
                        emptyTable: "No User Found!" // ✅ Handles empty table cleanly                                    
                    }                        
                });            
            });
            document.addEventListener("click", function (e) {

    const btn = e.target.closest(".deleteAirportBtn");
    if (!btn) return;

    const apId = btn.getAttribute("data-id");

    Swal.fire({
        title: "Are you sure?",
        text: "This airport will be permanently deleted!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Yes, Delete",
        cancelButtonText: "Cancel",
        confirmButtonColor: "#d33",
        allowOutsideClick: false
    }).then((result) => {

        if (!result.isConfirmed) return;

        btn.style.pointerEvents = "none";

        Swal.fire({
            title: "Deleting...",
            text: "Please wait",
            allowOutsideClick: false,
            didOpen: () => Swal.showLoading()
        });

        fetch("includes/zones/del-airport.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "ap_id=" + apId
        })
        .then(res => res.json())
        .then(data => {
            Swal.close();
            btn.style.pointerEvents = "auto";

            if (data.status === "success") {
                Swal.fire({
                    icon: "success",
                    title: "Deleted!",
                    text: data.message
                }).then(() => {
                    window.location.reload(); // or remove row dynamically
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: data.message
                });
            }
        })
        .catch(() => {
            btn.style.pointerEvents = "auto";
            Swal.fire("Error", "Something went wrong!", "error");
        });
    });
});
        </script>				
        <div class="col-5">							
            <div class="card">										
                <div class="card-header">														
                    <h3 class="card-title">							
                        Add New Airport								
                    </h3>															
                </div>										
                <div class="card-body border-bottom py-3">									  		                    
                    <form id="airportForm" enctype="multipart/form-data">    
                        <div class="modal-body">        
                            <div class="row">            
                                <div class="col-lg-12">                
                                    <div class="mb-3">                    
                                        <label class="form-label">Airport Name</label>                    
                                        <input type="text" class="form-control" name="ap_name" placeholder="Airport Name" required>                
                                    </div>             
                                </div>                                            
                                <div class="col-lg-12">                
                                    <div class="mb-3">                    
                                        <label class="form-label">Address</label>                    
                                        <input type="text" class="form-control" name="ap_address" id="pickup" placeholder="Address" required>                
                                    </div>            
                                </div>        
                            </div>    
                        </div>                           
                        <div class="modal-footer">        
                            <button type="reset" class="btn btn-danger">            
                                <i class="ti ti-circle-x"></i> Cancel        
                            </button>        
                            <button type="submit" id="saveAirportBtn" class="btn ms-auto btn-success">            
                                <i class="ti ti-plane-tilt"></i> Save Airport        
                            </button>    
                        </div> 
                    </form>
                </div>
            </div>
        </div>
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
            types: ['airport'],            
            componentRestrictions: {country: 'GB'}
        };                
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);        
        autocompletePickup.addListener('place_changed', function() {                        
    });    
    }           
    google.maps.event.addDomListener(window, 'load', initAutocomplete);	
    
    
    
    
    document.getElementById("airportForm").addEventListener("submit", function(e) {
    
        e.preventDefault();

    const form = this;
    const btn  = document.getElementById("saveAirportBtn");
    const formData = new FormData(form);

    btn.disabled = true;

    Swal.fire({
        title: "Saving Airport...",
        text: "Please wait",
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading()
    });

    fetch("includes/zones/add-airport.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        Swal.close();
        btn.disabled = false;

        if (data.status === "success") {
            Swal.fire({
                icon: "success",
                title: "Success",
                text: data.message,
                confirmButtonText: "OK"
            }).then(() => {
                window.location.reload(); // or redirect to airports.php
            });
        } else {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: data.message
            });
        }
    })
    .catch(() => {
        btn.disabled = false;
        Swal.fire("Error", "Something went wrong!", "error");
    });
});
</script>
<?php
include('footer.php');
?>