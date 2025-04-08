<?php
include('header.php');
$d_bank_id = $_GET['d_bank_id'];
$bsql = mysqli_query($connect, "SELECT * FROM `driver_bank_details` WHERE `d_bank_id`='$d_bank_id'");
$brow = mysqli_fetch_array($bsql);
?>  
<div class="page-body page_padding">	
    <div class="row row-deck row-cards">			      					
        <div class="col-12">            											
            <div class="card">                														
                <div class="card-header">                    																		
                    <h3 class="card-title">		
                        Update Driver Bank Details			
                    </h3>						
                </div>                  														
                <div class="card-body border-bottom py-3">						
                    <form method="post" action="update-driver-bank.php" onsubmit="return validateForm();">		
                        <div class="modal-body">
                            <div class="row">											
                                <div class="mb-3 col-lg-4">												
                                    <label class="form-label">Bank Name</label>				
                                    <input type="hidden" class="form-control" name="d_bank_id" value="<?php echo $d_bank_id; ?>">
                                    <input type="hidden" class="form-control" name="d_id" value="<?php echo $brow['d_id']; ?>">
                                    <input type="text" class="form-control" name="bank_name" placeholder="Enter Bank Name" value="<?php echo $brow['bank_name'] ?>">
                                </div>											
                                <div class="mb-3 col-lg-4">					
                                    <label class="form-label">Account Number </label>				
                                    <input type="text" class="form-control" name="acc_num" placeholder="Enter Account Number" value="<?php echo $brow['account_number'] ?>">				
                                </div>				
                                <div class="mb-3 col-lg-4">				
									<label class="form-label">Sort Code </label>				
                                    <input type="text" class="form-control" name="sort_code" placeholder="Enter Sort Code" value="<?php echo $brow['sort_code'] ?>">
                                </div>				
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="view-driver.php?d_id=<?php echo $d_id; ?>" class="btn btn-danger">
                                <i class="ti ti-circle-x"></i>
                                Cancel				
                            </a>			
                            <button type="submit" class="btn btn-success ms-auto">										
                                <i class="ti ti-message-plus"></i>
                                Save Details				
                            </button>									
                        </div> 																							
                    </form>																						
                    <script>		    
						function validateForm() {        
							var bankInput = document.getElementsByName("bank_name")[0].value;        	        
							var accInput = document.getElementsByName("acc_num")[0].value;			        
							var sortInput = document.getElementsByName("sort_code")[0].value;        	        
							if (bankInput === "" || accInput === "" || sortInput === "") {	            
								alert("Please fill in all required fields.");            	            
								return false;        	        
							}        							        	        
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