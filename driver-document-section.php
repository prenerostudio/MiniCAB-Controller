<div class="card-body">							
	<h2 class="mb-4">
		Driver Document Section
	</h2>	
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">
                            Driver License Photo Card (Front & Back)
                        </h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['d_license_front'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					
                                    <form action="upload-license.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
						
                                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
                                             
                                        <input type="text" name="licene_number" class="form-control" placeholder="Licence Number">
                                             
                                        <label> License Expiry Date </label>
                                             
                                        <input type="date" name="licence_exp" class="form-control">
                                             
                                        <label> License Front Image </label>
						
                                        <input type="file" id="dl_front" name="dl_front" accept="image/*" class="form-control" required>
                                            
                                        <label> License Back Image </label>
                                            
                                        <input type="file" id="dl_back" name="dl_back" accept="image/*" class="form-control" required>
						
                                        <input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">	
					</form>					
				</div>				
				
                            
			</div>			
		</div>											
		<div class="col-md-6">		
			<h3 class="card-title">			
				Driver Licence Photo Card (Back)				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['d_license_back'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>									
				</div>											
				<div class="col-auto">				
					<form action="upload-back.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('dl_back')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="dl_back" name="dl_back" accept="image/*" class="form-control" required>
						<input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">
					</form>					
				</div>				
			</div> 			
		</div>		
		<script>		
			function validateForm(inputId) {			
				var fileInput = document.getElementById(inputId);        				
				if (fileInput.files.length === 0) {				
					alert("Please select an image before submitting.");					
					return false;					
				}				
				return true;				
			}			
		</script>												
	</div>			
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">			
				PCO License				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/pco-license/<?php echo $drow['pco_license'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>
				</div>
				<div class="col-auto">				
					<form action="upload-pco.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pco')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="pco" name="pco" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>					
				</div>				
			</div>			
		</div>		
		<div class="col-md-6">		
			<h3 class="card-title">			
				Proof of Address 1				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/address-proof/<?php echo $drow['address_proof_1'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					<form action="upload-pa1.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pa1')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="pa1" name="pa1" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>
	</div>
																											
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">			
				Proof of Address 2				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/address-proof/<?php echo $drow['address_proof_2'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					<form action="upload-pa2.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pa2')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="pa2" name="pa2" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>						
				</div>
			</div> 			
		</div>				
		<div class="col-md-6">		
			<h3 class="card-title">			
				National Insurance Number				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/ni/<?php echo $drow['national_insurance'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					<form action="upload-ni.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('ni')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="ni" name="ni" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>				
			</div>			
		</div>		
	</div>															
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">			
				DVLA Check Code				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/dvla/<?php echo $drow['dvla_check_code'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					<form action="upload-dvla.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('dvla')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="dvla" name="dvla" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>		
		<div class="col-md-6">		
			<h3 class="card-title">			
				Extra				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/extra/<?php echo $drow['extra'];?>); background-size:contain; width: 220px; height: 160px;">
					</span>					
				</div>				
				<div class="col-auto">				
					<form action="upload-extra.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('extra')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="extra" name="extra" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>			
		</div>
	</div>
</div>