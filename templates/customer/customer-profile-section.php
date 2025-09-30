<div class="col-12">            											
    <div class="card">													    
        <div class="card-body border-bottom py-3">													        
            <h2 class="mb-4">					                                            
                <?php if($crow['account_type']== 2) { ?>                                             
                Booker
                <?php }else{ ?> Customer <?php } ?>
                Profile                
            </h2>
            <h3 class="card-title">
                Profile Details            
            </h3>					                                                    
            <div class="row align-items-center">
                <div class="col-auto">
                    <span class="avatar avatar-xl" style="background-image: url(img/customers/<?php echo $crow['c_pic'];?>); background-size:100% 100% ; width: 150px; height: 150px;"></span>						                   
                </div>					               
                <div class="col-auto">					                
                    <form action="includes/customer/update-customer-img.php" method="post" enctype="multipart/form-data">						                    
                        <input type="hidden" value="<?php echo $crow['c_id']; ?>" name="c_id">                        
                        <input type="file" name="fileToUpload" id="fileToUpload" class="btn">						                        
                        <button type="submit" class="btn btn-info">Upload Image </button>						                        
                    </form>						                    
                </div>					                
                <div class="col-auto">					                
                    <a href="includes/customer/del-customer-img.php?c_id=<?php echo $c_id ?>" class="btn btn-ghost-danger">						                    
                        Delete avatar
                    </a>
                </div>					                
            </div>					            
            <h3 class="card-title mt-4">
                Personal Information:
            </h3>					                                        
            <form method="post" action="includes/customer/update-customer.php" enctype="multipart/form-data">					            
                <div class="row g-3">									                
                    <div class="mb-3 col-md-3">																				                    
                        <div class="form-label">Customer Name</div>						                        
                        <input type="hidden" class="form-control" value="<?php echo $crow['c_id']; ?>" name="c_id">						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_name']; ?>" name="cname">
                    </div>						                   
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Email Address</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_email']; ?>" name="cemail">						   
                    </div>						                   
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Phone</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_phone']; ?>" name="cphone" readonly>						                        
                    </div>																		                    
                    <div class="mb-3 col-md-3">																		                    
                        <div class="form-label">Gender</div>									                        
                        <select class="form-select" name="cgender" required>						                        
                            <option><?php echo $crow['c_gender']; ?></option>							                            
                            <option>Male</option>																		
                            <option>Female</option>																                            
                            <option>Transgender</option>							
                        </select>						                        
                    </div>
                    <div class="mb-3 col-md-3">                    
                        <div class="form-label">Language </div>						                        
                        <select class="form-select" name="clang">						                        
                            <option><?php echo $crow['c_language']; ?></option>										
				<?php														
                                $lsql=mysqli_query($connect,"SELECT * FROM `language`");				                                                                
                                while($lrow = mysqli_fetch_array($lsql)){							                                
                                ?>																					                               
                            <option>															
                                <?php echo $lrow['language'];?>                                
                            </option>										
                            <?php														                          
                            }
                            ?>							                                
                        </select>
                    </div>
                    <div class="mb-3 col-md-3">						                    
                        <div class="form-label">Postal Code</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['postal_code'] ?>" name="postal_code">						                        
                    </div>											                    
                    <div class="mb-3 col-md-3">																		                    
                        <div class="form-label">National ID</div>						                        
                        <input type="text" class="form-control" value="<?php echo $crow['c_ni'];?>" name="cni">
                    </div>
                    <div class="mb-3 col-md-3">
                        <div class="form-label">Address</div>
                        <textarea class="form-control" rows="3" name="caddress"><?php echo $crow['c_address'] ?></textarea>
                    </div>						                    
                </div>					                
                <div class="card-footer bg-transparent mt-auto">					                
                    <div class="btn-list justify-content-end">						                    
                        <a href="customers.php" class="btn">						                        
                            Cancel							                            
                        </a>						
                        <button type="submit" class="btn btn-primary">						                        
                            Update																				                            
                        </button>																		
                    </div>																	                    
                </div>															                
            </form>					            
        </div>				        
    </div>
</div>    