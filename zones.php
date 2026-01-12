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
                Zones Section                						
            </h2>              						
        </div>						
    </div>	
</div>
<div class="page-body page_padding">          		
    <div class="row row-deck row-cards">					  									
        <div class="col-6">       					
            <div class="card">            							
                <div class="card-header">                										
                    <h3 class="card-title">		
                        Zones List			
                    </h3>            											
                </div>		                		
                <div class="card-body border-bottom py-3">		
                    <div id="table-adriver" class="table-responsive">		
                        <table class="table" id="zones">									
                            <thead>			
                                <tr>													
                                    <th>ID</th>													
                                    <th>Zone Address</th>													
                                    <th>Actions</th>				
                                </tr>											
                            </thead>										
                            <tbody class="table-tbody">								
                                <?php																
                                $x = 0;								
                                $zsql = mysqli_query($connect, "SELECT * FROM `zones`");
                                while ($zrow = mysqli_fetch_array($zsql)) :	
                                    $x++;
                                ?>
                                <tr>												
                                    <td>																
                                        <?php echo $x; ?>
                                    </td>				
                                    <td>																				
                                        <?php echo $zrow['zone_name'];?>					
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" class="btn btn-danger deleteZoneBtn" data-id="<?php echo $zrow['zone_id']; ?>" title="Delete">    
                                            <i class="ti ti-square-rounded-x"></i>
                                        </a>					
                                    </td>				
                                </tr>												
                                <?php endwhile; ?>								                                								
                                <?php if ($x === 0) : ?>								
                                <tr>
                                    <td colspan="8">										
                                        <p align="center">No Zone Found!</p>														
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
        $('#zones').DataTable({                
            responsive: true,                                
            dom: 'Bfrtip',                                
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],                                
            language: {                        
                emptyTable: "No User Found!" // ✅ Handles empty table cleanly                                    
            }                        
        });            
    });

    document.addEventListener("click", function (e) {

    
        if (e.target.closest(".deleteZoneBtn")) {

        const btn    = e.target.closest(".deleteZoneBtn");
        const zoneId = btn.getAttribute("data-id");

        Swal.fire({
            title: "Are you sure?",
            text: "This zone will be permanently deleted!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Yes, Delete",
            cancelButtonText: "Cancel",
            confirmButtonColor: "#d33",
            allowOutsideClick: false
        }).then((result) => {

            if (result.isConfirmed) {

                btn.style.pointerEvents = "none";

                Swal.fire({
                    title: "Deleting...",
                    text: "Please wait",
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });

                fetch("includes/zones/del-zone.php", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "zone_id=" + zoneId
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
            }
        });
    }
});

        </script>	
        <div class="col-6">       					
            <div class="card">            							
                <div class="card-header">                										
                    <h3 class="card-title">		
                        Add New Zone			
                    </h3>            											
                </div>            										
                <div class="card-body border-bottom py-3">                											
                    
                    <form id="zoneForm" enctype="multipart/form-data">
    
                        <div class="modal-body">			
        
                            <div class="row">
            
                                <div class="mb-3">				
                
                                    <label class="form-label">Zone Address</label>				
                
                                    <input type="text" class="form-control" name="za" placeholder="Enter Zone Name" required>				
            
                                </div>                                         				
        
                            </div>			                            			
    
                        </div>			
    
                        <div class="modal-footer">			                            			
        
                            <button type="submit" id="saveZoneBtn" class="btn ms-auto btn-success">
            
                                <i class="ti ti-message-plus"></i> Save Zone
        
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
        var spInput = document.getElementsByName("sp")[0].value;        			
        var epInput = document.getElementsByName("ep")[0].value;        			
        var fareInput = document.getElementsByName("fare")[0].value;	
        if (spInput === "" || epInput === "" || fareInput === "") {			
            alert("Please fill in all required fields.");				
            return false;				
        }			
        return true;    			
    }    
    var autocompletePickup;    
    var autocompleteDropoff;
    var journeyDistanceInput;
    function initAutocomplete() {
        var pickupInput = document.getElementById('pickup');      
        var autocompleteOptions = {
            types: ['geocode'],
            componentRestrictions: {country: 'GB'}
        };
        autocompletePickup = new google.maps.places.Autocomplete(pickupInput, autocompleteOptions);
        
      
    }    

    google.maps.event.addDomListener(window, 'load', initAutocomplete);



document.getElementById("zoneForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const form = this;
    const btn  = document.getElementById("saveZoneBtn");
    const formData = new FormData(form);

    btn.disabled = true;

    Swal.fire({
        title: 'Saving Zone...',
        text: 'Please wait',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    fetch("includes/zones/add-zone.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        Swal.close();
        btn.disabled = false;

        if (data.status === "success") {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: data.message,
                confirmButtonText: 'OK'
            }).then(() => {
                window.location.reload(); // or redirect if needed
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: data.message
            });
        }
    })
    .catch(() => {
        btn.disabled = false;
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Something went wrong!'
        });
    });
});
</script>



<?php
include('footer.php');
?>