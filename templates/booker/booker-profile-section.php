<div class="card">
    <div class="card-body border-bottom py-3">    
        <h2 class="mb-4">        
            Booker Profile            
        </h2>        
        <div class="row align-items-center">        
            <div class="col-auto">            
                <span class="avatar avatar-xl" style="background-image: url(img/bookers/<?php echo $brow['c_pic'];?>); background-size:contain; width: 220px; height: 160px;"></span>                
            </div>            
            <div class="col-auto">            
                <form action="includes/booker/update-booker-img.php" method="post" enctype="multipart/form-data">                
                    <input type="hidden" value="<?php echo $brow['c_id']; ?>" name="c_id">                    
                    <input type="file" name="fileToUpload" id="fileToUpload" class="btn">                    
                    <button type="submit" class="btn btn-info">Upload Image </button>                    
                </form>                
            </div>            
            <div class="col-auto">            
                <a href="includes/booker/del-booker-img.php?c_id=<?php echo $c_id ?>" class="btn btn-ghost-danger">                
                    Delete avatar                    
                </a>                
            </div>            
        </div>        
        <h3 class="card-title mt-4">        
            Personal Details            
        </h3>        
        <form method="post" action="includes/booker/update-booker.php" enctype="multipart/form-data">        
            <div class="row g-3">            
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Booker Name</div>                    
                    <input type="hidden" class="form-control" value="<?php echo $brow['c_id']; ?>" name="c_id">                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_name']; ?>" name="cname">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Email Address</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_email']; ?>" name="cemail">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Phone</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_phone']; ?>" name="cphone" readonly>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Gender</div>                    
                    <select class="form-select" name="cgender">                    
                        <option><?php echo $brow['c_gender']; ?></option>                        
                        <option>Male</option>                        
                        <option>Female</option>                        
                        <option>Transgender</option>                        
                    </select>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Language </div>                    
                    <select class="form-select" name="clang">                    
                        <option>                                                        
                            <?php echo $brow['c_language']; ?>
                        </option>
                        <?php
                        $lsql=mysqli_query($connect,"SELECT * FROM `language`");										                                                    
                        while($lrow = mysqli_fetch_array($lsql)){			                        
                        ?>				
                        <option>
                            <?php echo $lrow['language']; ?>
                        </option>
                        <?php
                        }
                        ?>			
                    </select>                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Postal Code</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['postal_code'] ?>" name="pc">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">National ID</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_ni'] ?>" name="cni">                    
                </div>                
                <div class="mb-3 col-md-3">                
                    <div class="form-label">Company Name</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['company_name'] ?>" name="com_name">                    
                </div>                
                <div class="mb-3 col-md-3">    
                    <div class="form-label">Commission Type</div>                        
                    <select class="form-control" name="com_type" id="commissionType">													        
                        <?php if ($brow['commission_type'] === '1') { ?>                                   
                        <option value="1" selected>Percentage</option>													            
                        <option value="2">Fixed</option>                                                                                                         
                            <?php } else { ?>           
                        <option value="1">Percentage</option>			            
                        <option value="2" selected>Fixed</option>													        
                            <?php } ?>			    
                    </select>		
                </div>
                <div class="mb-3 col-md-3">		    
                    <div class="form-label">Commission</div>		    
                    <input type="text" class="form-control" value="<?php echo $brow['percentage'];?>" name="percent" id="commissionPercent">         
                    <input type="text" class="form-control" value="<?php echo $brow['fixed'];?>" name="fixed" id="commissionFixed">                    
                </div>		
                <script>    
                    function toggleCommissionFields() {
                        var commissionType = $('#commissionType').val();
                        if (commissionType === "1") {  // ✅ Compare with string
                            $('#commissionPercent').show();
                            $('#commissionFixed').hide();        
                        } else {
                            $('#commissionPercent').hide();
                            $('#commissionFixed').show();        
                        }    
                    }
                    $(document).ready(function () {
                        toggleCommissionFields(); // Run on page load
                        $('#commissionType').on('change', function () {
                        toggleCommissionFields();
                        });
                    });
                </script>                
                <div class="mb-3 col-md-6">                
                    <div class="form-label">Address</div>                    
                    <input type="text" class="form-control" value="<?php echo $brow['c_address'] ?>" name="caddress">                    
                </div>                
            </div>            
            <div class="card-footer bg-transparent mt-auto">            
                <div class="btn-list justify-content-end">                
                    <a href="bookers.php" class="btn">                    
                        Cancel	                        
                    </a>                    
                    <button type="submit" class="btn btn-primary">		
                        Update Booker			
                    </button>                    
                </div>                
            </div>            
        </form>        
    </div>    
</div>