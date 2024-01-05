<?php
include('header.php');
$d_id = $_GET['d_id'];
?>  
<div class="page-body page_padding">
	<div class="row row-deck row-cards">			      				
		<div class="col-12">            								
			<div class="card">                										
				<div class="card-header">                    												
					<h3 class="card-title">Add Vehicle</h3>
				</div>                  								
				<div class="card-body border-bottom py-3">
					<form method="post" action="dv_process.php" enctype="multipart/form-data" onsubmit="return validateForm();">	
						<div class="modal-body">														
							<div class="row">								
								<div class="mb-3 col-lg-4">
									<input type="hidden" class="form-control" name="d_id" value="<?php echo $d_id; ?>">
									<label class="form-label">Vehicle Type</label>
									<select class="form-control" name="v_id">										
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
									<label class="form-label">Make</label>
									<input type="text" class="form-control" name="make">									
								</div>							
								<div class="mb-3 col-lg-4">
									<label class="form-label">Model </label>
									<input type="text" class="form-control" name="model">						
								</div>								
								<div class="mb-3 col-lg-4">
									<label class="form-label">Color </label>
									<input type="text" class="form-control" name="color">
								</div>									
								<div class="mb-3 col-lg-4">
									<label class="form-label">Registration Number </label>
									<input type="text" class="form-control" name="reg_num">
								</div>									
								<div class="mb-3 col-lg-4">
									<label class="form-label">PHV Licence  </label>
									<input type="text" class="form-control" name="phv">
								</div>									
								<div class="mb-3 col-lg-4">
									<label class="form-label">PHV Expiry </label>									
									<input type="date" class="form-control" name="phv_exp">
								</div>																	
								<div class="mb-3 col-lg-4">
									<label class="form-label">Taxi Insurance  </label>								
									<input type="text" class="form-control" name="taxi_ins">
								</div>									
								<div class="mb-3 col-lg-4">
									<label class="form-label">Taxi Insurance Expiry </label>
									<input type="date" class="form-control" name="taxi_exp">								
								</div>																	
								<div class="mb-3 col-lg-4">          								
									<label class="form-label">MOT Number </label>								
									<input type="text" class="form-control" name="mot">								
								</div>									
								<div class="mb-3 col-lg-4">								
									<label class="form-label">MOT Expiry </label>
									<input type="date" class="form-control" name="mot_exp">
								</div>
							</div>													
						</div>          										      										
						<div class="modal-footer">
							<a href="view-driver.php?d_id=''" class="btn btn-danger">
								<i class="ti ti-circle-x"></i>														
								Cancel
							</a>
							<button type="submit" class="btn btn-success ms-auto">
								<i class="ti ti-message-plus"></i>						
								Save Vehicle							
							</button>
						</div> 															
					</form>																				
							<script>
    function validateForm() {
        // Perform your form validation here
        var vidInput = document.getElementsByName("v_id")[0].value;
        var makeInput = document.getElementsByName("make")[0].value;
        var modelInput = document.getElementsByName("model")[0].value;
		var colorInput = document.getElementsByName("color")[0].value;
		var regInput = document.getElementsByName("reg_num")[0].value;
		

        if (vidInput === "" || makeInput === "" || modelInput === "" || colorInput === "" || regInput === "" ) {
            // Display an error message or prevent the form submission
            alert("Please fill in all required fields.");
            return false;
        }

        // If validation passes, you can proceed with the form submission
        return true;
    }
</script>
				</div>                                                    							
			</div>              					
		</div>			
	</div>
</div>       
<?php
include('footer.php');
?>