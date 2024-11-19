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
                        <div class="form-group mb-3">
                            <label class="form-label"> Log Book Number </label>
                            <input type="text" name="lb_num" placeholder="Log Book Number" class="form-control">
                        </div>                
                        <div class="form-group mb-3"> 
                            <label class="form-label"> Log Book Image </label>                        
                            <input type="file" id="log-book" name="log_book" accept="image/*" class="form-control" required>			
                        </div>
                        <input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">			                    
                    </form>
                </div>
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
                        <div class="form-group mb-3">
                            <label class="form-label"> MOT Certificate Number </label>
                            <input type="text" name="mot_num" placeholder="MOT Certificate Number" class="form-control">
                        </div>    
                        <div class="form-group mb-3">
                            <label class="form-label"> MOT Certificate Expiry </label>
                            <input type="date" name="mot_exp" class="form-control">
                        </div>    
			 <div class="form-group mb-3"> 
                            <label class="form-label"> MOT Certificate Image </label>
                        <input type="file" id="mot" name="mot" accept="image/*" class="form-control" required>
                         </div>
                        <input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">
					
                    </form>
		
                </div>
		
            </div>
	
        </div>
		
	
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
                        
                        <div class="form-group mb-3">
                        
                            <label class="form-label"> Vehicle PCO Number </label>
                            
                            <input type="text" name="vpco_num" placeholder="Vehicle PCO Number" class="form-control">
                        
                        </div>    
                        
                        
                        <div class="form-group mb-3">
                        
                            <label class="form-label"> Vehicle PCO Expiry </label>
                            
                            <input type="date" name="vpco_exp" class="form-control">
                        
                        </div>    
			
                        <div class="form-group mb-3"> 
                        
                            <label class="form-label"> Vehicle PCO Image </label>

                        
                            <input type="file" id="vpco" name="vpco" accept="image/*"  class="form-control" required>
                         
                        </div>
                        
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
                        <div class="form-group mb-3">
                        
                            <label class="form-label"> Vehicle Insurance Number </label>
                            
                            <input type="text" name="vi_num" placeholder="Vehicle Insurance Number" class="form-control">
                        
                        </div>    
                        
                        <div class="form-group mb-3">
                        
                            <label class="form-label"> Vehicle Insurance Expiry </label>
                            
                            <input type="date" name="vi_exp" class="form-control">
                        
                        </div>    
			
                        <div class="form-group mb-3"> 
                        
                            <label class="form-label">   Vehicle Insurance Image </label>					
			
                            <input type="file" id="ins" name="ins" accept="image/*"  class="form-control" required>
                         
                        </div>
			
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
			
                    </form>
		
                </div>
		
            </div>
	
        </div>
	
    </div>

    <div class="row mb-3">

        <div class="col-md-12">
	
            <h3 class="card-title">
	
                Vehicle Picture (Front)
		
            </h3>
	
            <div class="row align-items-center">
	
                <div class="col-auto">
                    <h5>Vehicle Front Image</h5>
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/picture/<?php echo $drow['vehicle_picture_front'];?>); background-size:contain; width: 220px; height: 160px;"></span>
		</div>
                    <div class="col-auto">
                    <h5>Vehicle Back Image</h5>
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/vehicle/picture/<?php echo $drow['vehicle_picture_back'];?>); background-size:contain; width: 220px; height: 160px;"></span>
                </div>
		
                <div class="col-auto">
		
                    <form action="upload-vehicle-pictures.php" method="post" enctype="multipart/form-data" onsubmit="return validateForm('pic1')">
		
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
                         <div class="form-group mb-3"> 
                        
                            <label class="form-label">  Vehicle Image Front </label>	
			
                        <input type="file" id="pic1" name="pic1" accept="image/*"  class="form-control" required>
                            </div>
                                 <div class="form-group mb-3"> 
                        
                            <label class="form-label">  Vehicle Image Back </label>	
                        
                        <input type="file" id="pic2" name="pic2" accept="image/*"  class="form-control" required>
                            </div>
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
			<div class="form-group mb-3">
                        
                            <label class="form-label"> Road TAX Number </label>
                            
                            <input type="text" name="rt_num" placeholder="Road TAX Number" class="form-control">
                        
                        </div>    
                        
                        <div class="form-group mb-3">
                        
                            <label class="form-label"> Road TAX Expiry </label>
                            
                            <input type="date" name="rt_exp" class="form-control">
                        
                        </div>    
			
                        <div class="form-group mb-3"> 
                        
                            <label class="form-label">  Road TAX Image </label>	
                            <input type="file" id="rt" name="rt" accept="image/*"  class="form-control" required>
                            </div>
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