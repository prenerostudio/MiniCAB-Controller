<div class="card-body">							
    <h2 class="mb-4">
        Driver Document Section	(All Documents with <span style="color:red;">*</span> are required.)
    </h2>	
    <div class="row mb-3">	
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			
            <h3 class="card-title">            
                Driver License Photo Card (Front & Back) <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 
            </h3>				
            <div class="row align-items-center">				
                <div class="col-auto">		
                    <h5>Image Front</h5>		
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['dl_front'];?>); background-size:contain; width: 220px; height: 160px;">		
                    </span>			
                    <h5>Image Back</h5>		
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/driving-license/<?php echo $drow['dl_back'];?>); background-size:contain; width: 220px; height: 160px;">		
                    </span>		
                </div>
                <div class="col-auto">
                    <form action="upload-license.php" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">                        
                        <div class="form-group pb-3">                                           
                            <label class="form-label"> License Number </label>
                            <input type="text" name="licene_number" class="form-control" value="<?php echo $drow['dl_number'];?>" placeholder="Licence Number">
                        </div>                        
                        <div class="form-group pb-3">                                                          
                            <label class="form-label"> License Expiry Date </label>
                            <input type="date" name="licence_exp" class="form-control" value="<?php echo $drow['dl_expiry'];?>">
                        </div> 
						<div class="form-group pb-3">                                                          
                            <label class="form-label"> License Expiry Time </label>
                            <input type="time" name="li_exp_time" class="form-control" value="<?php echo $drow['dl_expiry_time'];?>">
                        </div>
                        <div class="form-group pb-3">                        
							<label class="form-label"> License Front Image </label>
                            <input type="file" id="dl_front" name="dl_front" accept="image/*" class="form-control" required>                            
                        </div>                        
                        <div class="form-group">                                                          
                            <label class="form-label"> License Back Image </label>
                            <input type="file" id="dl_back" name="dl_back" accept="image/*" class="form-control" required>
                        </div>			                                                
                        <input type="submit" value="Upload Image" name="submit" class="btn btn-info" style="margin-top: 25px;">				
                    </form>							
                </div>
            </div>	
        </div>	                   
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			        
            <h3 class="card-title">				
                Proof of Address 1						
            </h3>				
            <div class="row align-items-center">				
                <div class="col-auto">	
                    <h5>Proof of Address 1</h5>
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/address-proof/<?php echo $drow['ap_1'];?>); background-size:contain; width: 220px; height: 160px;">					
                    </span>
                    <h5>Proof of Address 2</h5>
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/address-proof/<?php echo $drow['ap_2'];?>); background-size:contain; width: 220px; height: 160px;">		
                    </span>		
                </div>		
                <div class="col-auto">		
                    <form action="upload-address-proof.php" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">			                       
                        <div class="from-group mb-3">  
                            <label class="form-label"> Proof of Address 1 </label>                          
                            <input type="file" id="pa1" name="pa1" accept="image/*"  class="form-control" required>
                        </div>                        
                        <div class="form-group mb-3">                        
                            <label class="form-label"> Proof of Address 2 </label>                          
                            <input type="file" id="pa2" name="pa2" accept="image/*"  class="form-control" required>
                        </div>			
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">			
                    </form>		
                </div>		
            </div>	
        </div>		        	        	              			
    </div>			
    <div class="row mb-3">				    
         <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">			
            <h3 class="card-title">				
                PCO License <span style="color:red; font-size: 24px; font-weight: bold;">*</span> 						
            </h3>				
            <div class="row align-items-center">				
                <div class="col-auto">						
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/pco-license/<?php echo $drow['pl_img'];?>); background-size:contain; width: 220px; height: 160px;">		
                    </span>		
                </div>		
                <div class="col-auto">						
                    <form action="upload-pco.php" method="post" enctype="multipart/form-data">							
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">				
                        <div class="form-group pb-3">                                                          
                            <label class="form-label"> PCO License Number </label>
                            <input type="text" name="pl_number" class="form-control" value="<?php echo $drow['pl_number'];?>" placeholder="PCO Licence Number">
                        </div>                                              
                        <div class="form-group pb-3">                                                  
                            <label class="form-label">PCO License Expiry Date </label>
                            <input type="date" name="pl_exp" class="form-control" value="<?php echo $drow['pl_exp'];?>">                            
                        </div>  
						<div class="form-group pb-3">                                                  
                            <label class="form-label">PCO License Expiry Time </label>
                            <input type="time" name="pl_exp_time" class="form-control" value="<?php echo $drow['pl_exp_time'];?>">                            
                        </div> 
                        <div class="form-group mb-3">			                                                        
                            <label class="form-label"> PCO License Image </label>                            
                            <input type="file" id="pco" name="pco" accept="image/*"  class="form-control" required>
                        </div>                        			
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">			
                    </form>							
                </div>						
            </div>				
        </div>        
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">		
            <h3 class="card-title">
                National Insurance Number				
            </h3>
            <div class="row align-items-center">	
                <div class="col-auto">
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/ni/<?php echo $drow['ni_img'];?>); background-size:contain; width: 220px; height: 160px;">
                    </span>
                </div>
                <div class="col-auto">
                    <form action="upload-ni.php" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
                        <div class="form-group pb-3">
                            <label class="form-label"> National Insurance Number</label>
                            <input type="text" name="ni_num" class="form-control" placeholder="National Insurance Number" value="<?php echo $drow['ni_number'];?>">
                        </div>                        
                        <div class="form-group mb-3">                        
                            <label class="form-label"> National Insurance Image </label>                          
                            <input type="file" id="ni" name="ni" accept="image/*"  class="form-control" required>
                        </div>			
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">			
                    </form>		
                </div>						
            </div>				
        </div>	        	
    </div>    															
    <div class="row mb-3">
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">	
            <h3 class="card-title">	
                DVLA Check Code			
            </h3>	
            <div class="row align-items-center">				
                <div class="col-auto">		
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/dvla/<?php echo $drow['dvla_img'];?>); background-size:contain; width: 220px; height: 160px;">		
                    </span>
                </div>
                <div class="col-auto">
                    <form action="upload-dvla.php" method="post" enctype="multipart/form-data">		
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">			
                        <div class="form-group pb-3">  
                            <label class="form-label"> DVLA Check Number</label>
                            <input type="text" name="dvla_num" class="form-control" placeholder="DVLA Check Number" value="<?php echo $drow['dvla_number'];?>">
                        </div>                        
                        <div class="form-group mb-3">                        
                            <label class="form-label"> DVLA Check Image </label>
                            <input type="file" id="dvla" name="dvla" accept="image/*"  class="form-control" required>
                        </div>			
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">			
                    </form>		
                </div>		
            </div>	
        </div>			
        <div class="col-md-6" style="border: 1px solid #6c7a91; padding: 30px;">
            <h3 class="card-title">
                Extra
            </h3>
            <div class="row align-items-center">
                <div class="col-auto">
                    <span class="avatar avatar-xl" style="background-image: url(img/drivers/extra/<?php echo $drow['de_img'];?>); background-size:contain; width: 220px; height: 160px;">
                    </span>
                </div>						
                <div class="col-auto">						
                    <form action="upload-extra.php" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="d_id" value="<?php echo $d_id; ?>">
                        <input type="file" id="extra" name="extra" accept="image/*"  class="form-control" required>
                        <input type="submit" value="Upload Image" name="submit"  class="btn btn-info" style="margin-top: 25px;">
                    </form>
                </div>
            </div>	
        </div>	
    </div>
</div>