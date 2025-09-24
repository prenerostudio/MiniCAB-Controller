<div class="col-12">
    <div class="card">
        <div class="card-body border-bottom py-3">
            <h2 class="mb-4">
                Driver Profile
            </h2>
            <h3 class="card-title">
                Profile Details
            </h3>
            <div class="row align-items-center">
                <div class="col-auto">
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/<?php echo $drow['d_pic'];?>); background-size:100% 100%; width: 150px; height: 150px;"></span>
                </div>
                <div class="col-auto">
                    <form action="includes/drivers/update-driver-img.php" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="<?php echo $d_id; ?>" name="d_id">
                        <input type="file" name="fileToUpload" id="fileToUpload" class="btn">
                        <button type="submit" class="btn btn-info">Upload Image </button>
                    </form>
                </div>
                <div class="col-auto">
                    <a href="del-driver-img.php?d_id=<?php echo $d_id; ?>" class="btn btn-ghost-danger">
                        Delete avatar
                    </a>
                </div>
            </div>
            <h3 class="card-title mt-4">
                Personal Information
            </h3>
            <form method="post" action="update-driver.php" enctype="multipart/form-data">
                <div class="row g-3">
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Driver Name</div>
                        <input type="hidden" class="form-control" value="<?php echo $d_id; ?>" name="d_id">
                        <input type="text" class="form-control" value="<?php echo $drow['d_name']; ?>" name="dname">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Email Address</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_email']; ?>" name="demail">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Phone</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_phone']; ?>" name="dphone" readonly>
                    </div>					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Whatsapp</div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_whatsapp']; ?>" name="dwa">
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Gender</div>
                        <select class="form-select" name="dgender">
                            <option><?php echo $drow['d_gender']; ?></option> 
                            <option>Male</option>
                            <option>Female</option>
                            <option>Transgender</option>
                        </select>
                    </div>
                    
                    <div class="mb-3 col-md-4">
                        <div class="form-label">License Authority</div>
                        <select class="form-select" name="dauth">
                            <option>
                                <?php echo $drow['licence_authority'];?>
                            </option>
                            <option>London</option>
                            <option>Birmingham</option>
                            <option>Ireland</option>			
                        </select>
                    </div>
					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Address</div>
                        <input type="text" class="form-control" id="add" value="<?php echo $drow['d_address'] ?>" name="daddress" >
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Post Code </div>
                        <input type="text" class="form-control" value=" <?php echo $drow['d_post_code'];?>" name="pc" id="pc">
                                                
                    </div>
			
                    <div class="mb-3 col-md-4">
                    
                        <div class="form-label">Vehicle</div>
			
                        <select class="form-control" name="v_id">
                        
                            <option value="<?php echo $drow['v_id'] ?>">
                            

                
                                <?php echo $drow['v_name'] ?>

                            </option>
										
                                <?php
                                
                                $vhcsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
                                
                                while ($vhcrow = mysqli_fetch_array($vhcsql)) {
				
                                    ?>
                                    
                            <option value="<?php echo $vhcrow['v_id'] ?>">
                            
                
                                <?php echo $vhcrow['v_name'] ?>

                            </option>
			
							
                                <?php
										
                                
                                }
										
                                ?>
                                    
                        </select>
						 
                    </div>
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Language</div>
                        <select class="form-select" name="dlang">
                            <option>
                                <?php echo $drow['d_language'];?>
                            </option>				
							
                                <?php                               
							
                                $lsql=mysqli_query($connect,"SELECT * FROM `language`");                               
							
                                while($lrow = mysqli_fetch_array($lsql)){                                   
							
                                    ?>
                            <option>
                                <?php echo $lrow['language'] ?>
                            </option>				
							
                                <?php                              
							
                                
                                }                               
							
                                ?>
                        </select>
                    </div>
					
                    <div class="mb-3 col-md-4">
                        <div class="form-label">Shift Timing</div>
                        <select class="form-select" name="dshift">
                            <option>
                                <?php echo $drow['d_shift'];?>
                            </option>							
                            <option>Day Shift</option>				
							<option>Afternoon Shift</option>				
							<option>Night Shift</option>							
                        </select>
                    </div>
					<div class="mb-3 col-md-4">
                        <div class="form-label">TFL PCO Number: </div>
                        <input type="text" class="form-control" value="<?php echo $drow['d_pco']; ?>" name="dpco">
                    </div>
                   
                </div>
                <div class="card-footer bg-transparent mt-auto">
                    <div class="btn-list justify-content-end">
                        <a href="drivers.php" class="btn btn-danger">
                            Cancel
                        </a>
                        <button type="submit" class="btn btn-success">
                            <i class="ti ti-360"></i>
                            Update
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Your Google Maps Autocomplete logic -->
<script>
    let autocompleteAdd, autocompletePC;

    function initAutocomplete() {
        const addInput = document.getElementById('add');
        const pcInput = document.getElementById('pc');

        const options = {
            types: ['geocode'],
            componentRestrictions: { country: 'GB' }
        };

        if (addInput) {
            autocompleteAdd = new google.maps.places.Autocomplete(addInput, options);
        }

        if (pcInput) {
            autocompletePC = new google.maps.places.Autocomplete(pcInput, options);
        }
    }
</script>

<!-- Load Google Maps API (NO window load, use callback only) -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU&libraries=places&callback=initAutocomplete" async defer></script>
