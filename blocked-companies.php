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
	
                Companies Section                				
		
            </h2>              			
	
        </div>		
	
        <div class="col-auto ms-auto d-print-none">            		
	
            <div class="btn-list">                			
	
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-customer">
		
                    <i class="ti ti-user-plus"></i>                    					
		
                    Add New Company                  					
		
                </a>				              				
		
            </div>              			
	
        </div>		
	
    </div>	
</div>
<div class="page-body page_padding">          

    <div class="row row-deck row-cards">			      	

        <div class="col-12">            					
	
            <div class="card">                							
	
                <div class="card-header">                    									
		
                    <h3 class="card-title">
		
                        All Companies List
			
                    </h3>
		
                </div>                  				
		
                <div class="card-body border-bottom py-3">				
		
                    <div id="table-customer" class="table-responsive">
		
                        <table class="table" id="customers">
			
                            <thead>
			
                                <tr>
				
                                    <th>ID</th>
				
                                    <th>Image</th>
				
                                    <th>Company Name</th>
				
                                    <th>Person Name</th>
				
                                    <th>Email</th>
				
                                    <th>Phone</th>
				
                                    <th>PIN</th>
				
                                    <th>Status</th>
				
                                    <th>Actions</th>
				
                                </tr>
				
                            </thead>
			
                            <tbody class="table-tbody">
			
					
                                <?php

                                        
                                $csql=mysqli_query($connect,"SELECT companies.* FROM companies WHERE companies.acount_status = 0 ORDER BY companies.com_id DESC");
								
                                while($crow = mysqli_fetch_array($csql)){
								
                                    ?>
								
                                <tr>
				
                                    <td>
				
						
                                        <?php echo $crow['com_id']; ?>

                                    </td>
				
                                    <td>
				
						
                                        <?php

                                                
                                        if (!$crow['com_pic']) {
						
                                                    
                                            ?>			
						
                                        <img src="img/user-1.jpg" alt="Customer Img" style="width: 50px; height: 50px; border-radius: 5px;">	
					
					<?php									

                                        } else{			
					
                                            ?>										
					
                                        <img src="img/companies/<?php echo $crow['com_pic'];?>" alt="Company Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">
					
					<?php									

                                        }			
					
                                        ?>											
					
                                    </td> 		
				
                                    <td>
				
						
                                        <?php echo $crow['com_name']; ?>

                                    </td>
				
                                    <td>
				
						
                                        <?php echo $crow['com_person']; ?>

                                    </td>
				
                                    <td>
				
						
                                        <?php echo $crow['com_email']; ?>

                                    </td>
				
                                    <td>
				
						
                                        <?php echo $crow['com_phone']; ?>

                                    </td>		
				
                                    <td>
				
						
                                        <?php echo $crow['com_pin']; ?>

                                    </td>										
				
                                    <td>											
				
						
                                        <?php 											

                                                
                                        if($crow['acount_status']==0){
						
                                                    
                                            ?>												
						
                                        <div class="col-auto status">
					
                                            <span class="status-dot status-dot-animated bg-red d-block"></span>
					
                                            <span>Unverified</span>									
					
                                        </div>
					
					
                                            <?php									

                                        
                                            
                                        } else{											
					
                                            
                                            ?>
					
                                        <div class="col-auto status">
					
                                            <span class="status-dot status-dot-animated bg-green d-block"></span>
					
                                            <span>Verified</span>											
					
                                        </div>			
					
					<?php									

                                        }
					
                                        ?>									
					
                                    </td>	
				
                                    <td> 									
				
                                        <a href="view-company.php?com_id=<?php echo $crow['com_id']; ?>" class="btn btn-info btn-icon" title="View/Edit">
					
                                          
					
                                                
                                            <i class="ti ti-eye"></i>
						
                                               										
					
                                        </a>						
					
                                        <a href="del-company.php?com_id=<?php echo $crow['com_id'];?>" class="btn btn-danger btn-icon" title="Delete">
					
                                           
					
                                                
                                            <i class="ti ti-square-rounded-x"></i>
						
                                                
					
                                        </a>
					
                                        <a href="activate-company.php?com_id=<?php echo $crow['com_id']; ?>" class="btn btn-success btn-icon" title="Activate Company">
					
                                           
					
                                                <i class="ti ti-square-rounded-x"></i>
						
                                             
					
                                        </a>
					
                                    </td>								
				
                                </tr>
				
				<?php								

                                }								
				
                                ?>							
				
                            </tbody>						
			
                        </table>					
			
                    </div>				
		
                </div>			
		
            </div>		
	
        </div>	
	
    </div>
</div>        
<script>	

    $(document).ready(function() {
    
        $('#customers').DataTable();
});
</script>


<!-------------------------------
----------Add Customer-----------
-------------------------------->
<div class="modal modal-blur fade" id="modal-customer" tabindex="-1" role="dialog" aria-hidden="true">
	
    <div class="modal-dialog modal-lg" role="document">    	

        <div class="modal-content">        		
	
            <div class="modal-header">            			
	
                <h5 class="modal-title">Add New Company</h5>            				
		
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		
            </div> 			
	
            <form method="post" action="company-process.php" enctype="multipart/form-data" onsubmit="return validateForm();">
	
                <div class="modal-body">
		
                    <div class="row">					
		
                        <div class="mb-3 col-md-4">              					
			
                            <label class="form-label">Company Name</label>
			
                            <input type="text" class="form-control" name="cname" placeholder="Company Name" required>
			
                        </div> 
			
                        <div class="mb-3 col-md-4">                  
			
                            <label class="form-label">Relative Person</label>
			
                            <input type="text" class="form-control" name="rpname" placeholder="Relative Name" required>
			
                        </div>	
			
                        <div class="mb-3 col-md-4">
			
                            <label class="form-label">Email</label>
			
                            <input type="email" class="form-control" name="cemail" placeholder="hello@example.com" required>
			
                        </div>			
			
                        <div class="mb-3 col-md-4">                  						
			
                            <label class="form-label">Phone</label>
			
                            <input type="text" class="form-control" name="cphone" placeholder="+44 xxxx xxxxxxx" required>
			
                        </div>	
			
                        <div class="mb-3 col-md-4">              					
			
                            <label class="form-label">Password</label>
			
                            <input type="password" class="form-control" name="cpass" placeholder="xxxxxxxx" required>
			
                        </div> 
			
                        <div class="mb-3 col-md-4">
			
                            <label class="form-label">PIN</label>
			
                            <input type="text" class="form-control" name="cpin" placeholder="xxxx" required>				
			
                        </div>												
			
                        <div class="mb-3 col-md-6">
			
                            <label class="form-label">Postal Code</label>
			
                            <select class="form-control" name="pc">
			
                                <option>Select PostCode</option>								
				
				<?php

                                $pcsql=mysqli_query($connect,"SELECT * FROM `post_codes`");
				
                                while($pcrow = mysqli_fetch_array($pcsql)){								
				
                                    ?>			
				
                                <option>								
				
					<?php echo $pcrow['pc_name'] ?>								

                                </option>
				
				<?php

                                }																		
				
                                ?>
				
                            </select>
			
                        </div>  
			
                        <div class="mb-3 col-md-6">               
			
                            <label class="form-label">Picture</label>
			
                            <input type="file" class="form-control" name="cpic">
			
                        </div>
			
                        
                        <div class="mb-3 col-lg-12">
			
                            <div class="mb-3">								
			
                                <label class="form-label">Address</label>								
				
                                <textarea class="form-control" rows="3" name="caddress"></textarea>
				
                            </div>							
			
                        </div>
			
                    </div>										
		
                    <div class="modal-footer">					
		
                        <a href="#" class="btn btn-danger" data-bs-dismiss="modal">
			
                            <i class="ti ti-circle-x"></i>						
			
                            Cancel					
			
                        </a>
			
                        <button type="submit" class="btn ms-auto btn-success">
			
                            <i class="ti ti-user-plus"></i>
			
                            Save Company						
			
                        </button>					
			
                    </div> 																		
		
                    <script>    
		
    function validateForm() {        							        

        var cnameInput = document.getElementsByName("cname")[0].value;        
	
        var cemailInput = document.getElementsByName("cemail")[0].value;
	
        var cphoneInput = document.getElementsByName("cphone")[0].value;
	
        var cgenderInput = document.getElementsByName("cgender")[0].value;
	
        var pcInput = document.getElementsByName("pc")[0].value;
	
        
	
        if (cnameInput === "" || cemailInput === "" || cphoneInput === "" || cgenderInput === "" || pcInput === "") {                        
	
            alert("Please fill in all required fields.");            
	
            return false;        
	
        }							        							        
	
        return true;    
	
    }

                    </script>				
		
                </div> 
		
            </form>		
	
        </div>    	
	
    </div>
</div>	
<?php
include('footer.php');
?>