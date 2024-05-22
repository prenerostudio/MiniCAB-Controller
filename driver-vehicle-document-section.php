<div class="card-body">
	<h2 class="mb-4">
		Driver Vehicle Document Section
	</h2>	
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">			
				Vehicle Log Book				
			</h3>                																			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/log-book/<?php echo $drow['log_book'];?>); background-size:contain; width: 220px; height: 160px;"></span>					
				</div>																			
				<div class="col-auto">				
					<form action="upload-log-book.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">    					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">    						
						<input type="file" id="log-book" name="log_book" accept="image/*" class="form-control" required>
						<input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">
					</form>					
				</div>				
				<script>				
					function validateForm() {					
						var fileInput = document.getElementById('log-book');						
						if (fileInput.files.length === 0) {						
							alert("Please select an image before submitting.");							
							return false;							
						}						
						return true;						
					}					
				</script>				
			</div>			
		</div>		
		<div class="col-md-6">		
			<h3 class="card-title">			
				Vehicle MOT Certificate				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/mot-certificate/<?php echo $drow['mot_certificate'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>				
				<div class="col-auto">				
					<form action="upload-mot.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('mot')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="mot" name="mot" accept="image/*" class="form-control" required>
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
				Vehicle PCO
			</h3>
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/pco/<?php echo $drow['pco'];?>); background-size:contain; width: 220px; height: 160px;"></span>					
				</div>				
				<div class="col-auto">
					<form action="upload-vpco.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('vpco')">
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
						<input type="file" id="vpco" name="vpco" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<h3 class="card-title">			
				Vehicle Insurance				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/insurance/<?php echo $drow['insurance'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>
				<div class="col-auto">				
					<form action="upload-vinsurance.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('ins')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="ins" name="ins" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-6">
			<h3 class="card-title">
				Vehicle Picture (Front)
			</h3>
			<div class="row align-items-center">
				<div class="col-auto">
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/picture/<?php echo $drow['vehicle_picture_front'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>
				<div class="col-auto">
					<form action="upload-front-pic.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pic1')">
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
						<input type="file" id="pic1" name="pic1" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div> 
		</div>
		<div class="col-md-6">
			<h3 class="card-title">
				Vehicle Picture (Back) 
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/picture/<?php echo $drow['vehicle_picture_back'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>
				<div class="col-auto">
					<form action="upload-back-pic.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pic2')">
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
						<input type="file" id="pic2" name="pic2" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-6">
			<h3 class="card-title">
				Vehicle Road TAX
			</h3>
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/road-tax/<?php echo $drow['road_tax'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>				
				<div class="col-auto">				
					<form action="upload-road-tax.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('rt')">
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
						<input type="file" id="rt" name="rt" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>					
				</div>				
			</div> 			
		</div>		
		<div class="col-md-6">		
			<h3 class="card-title">			
				Vehicle Rental Agreement				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/rental-agreement/<?php echo $drow['rental_agreement'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>
				<div class="col-auto">				
					<form action="upload-rental-agreement.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('ra')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="ra" name="ra" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>				
			</div>			
		</div>		
	</div>																	
	<div class="row mb-3">	
		<div class="col-md-6">		
			<h3 class="card-title">			
				Insurance Schedule				
			</h3>			
			<div class="row align-items-center">			
				<div class="col-auto">				
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/insurance-schedule/<?php echo $drow['insurance_schedule'];?>); background-size:contain; width: 220px; height: 160px;"></span>
				</div>
				<div class="col-auto">				
					<form action="upload-schedule.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('sche')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="sche" name="sche" accept="image/*"  class="form-control" required>
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
					<span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/extra/<?php echo $drow['extra'];?>); background-size:contain; width: 220px; height: 160px;"></span>						
				</div>				
				<div class="col-auto">				
					<form action="vehicle-extra.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('vextra')">					
						<input type="hidden" name="d_id" value="<?php echo $d_id; ?>">						
						<input type="file" id="vextra" name="vextra" accept="image/*"  class="form-control" required>
						<input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>