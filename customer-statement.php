<?php include('header.php'); ?>      
<div class="page-header d-print-none">
    <div class="container-xl">    		
        <div class="row g-2 align-items-center">        	
            <div class="col">            	
                <h2 class="page-title">                						
                    Customer Reports                		
                </h2>                             		
            </div>	
        </div>        	
    </div>    
</div>                
<div class="page-body">
    <div class="container-xl">    
        <div class="row g-4">        	
            <div class="col-12">            	
                <form id="customerReportForm" autocomplete="off">		
                    <div class="row g-2 align-items-center mb-3">                    		
                        <div class="col-3">									
                            <div class="subheader mb-2">Start Date</div>                      			
                            <div class="input-group">                        			
                                <span class="input-group-text">                         				
                                    <i class="ti ti-calendar"></i>                        				
                                </span>                        				
                                <input type="date" class="form-control" name="start_date" autocomplete="off" required>				
                            </div>                    			
                        </div>                    						                    			
                        <div class="col-3">			
                            <div class="subheader mb-2">End Date</div>                      			
                            <div class="input-group">                        		 	
                                <span class="input-group-text">                         				
                                    <i class="ti ti-calendar"></i>                        				
                                </span>                        				
                                <input type="date" class="form-control" name="end_date"  autocomplete="off" required>				
                            </div>                    			
                        </div>					  			
                        <div class="col-3">					   			
                            <div class="subheader mb-2">Customer Name</div>                    
                            <select name="c_id" class="form-select" required>                      			                            
                                <option>Select Customer </option>	
                                    <?php														
                                    $dsql = mysqli_query($connect, "SELECT clients.* FROM clients WHERE clients.account_type = 1");								
                                    while ($drow = mysqli_fetch_array($dsql)) {														
                                    ?>
                                <option value="<?php echo $drow['c_id'];?>">				
                                    <?php echo $drow['c_name']; ?>						
                                </option>        																			
				<?php } ?>                   					  				
                            </select>                  			
                        </div>					  									
                        <div class="mt-5 col-3">									
                            <div class="row">										
                                <div class="col-6">										
                                    <button class="btn btn-primary w-100" type="submit">				
                                        Fetch Reports																					
                                    </button>												
                                </div>                    				
                                <div class="col-6">										
                                    <button class="btn btn-link w-100" type="reset">				
                                        Reset to defaults                    											
                                    </button>										
                                </div>				
                            </div>                  								
                        </div>						                  			
                    </div>			
                </form>              		
            </div>				
        </div>	
    </div>
</div>					
<script>	   
    function validateForm() {     
        var cidInput = document.getElementsByName("c_id")[0].value;        
        var startInput = document.getElementsByName("start_date")[0].value;        
        var endInput = document.getElementsByName("end_date")[0].value;			        
        if (cidInput === "" || startInput === "" || endInput === "") {                   
            alert("Please fill in all required fields.");            
            return false;        
        }                   
        return true;    
    }    
    $('#customerReportForm').on('submit', function (e) {
        e.preventDefault();   
        let start = $('[name="start_date"]').val();    
        let end   = $('[name="end_date"]').val();    
        let customer= $('[name="c_id"]').val();
        if (!start || !end || !customer) {        
            Swal.fire('Error', 'All fields are required', 'error');        
            return;    
        }
        Swal.fire({
            title: 'Generate Customer Report?',        
            text: 'Do you want to fetch this report?',        
            icon: 'question',        
            showCancelButton: true,        
            confirmButtonText: 'Yes, Generate'    
        }).then((result) => {
            if (result.isConfirmed) {          
                Swal.fire({
                    title: 'Generating Report...',                
                    allowOutsideClick: false,                
                    didOpen: () => Swal.showLoading()            
                });           
                // Create form dynamically (to open report in new tab)            
                let form = $('<form>', {
                    action: 'reports/customer-report.php',                
                    method: 'POST',                
                    target: '_blank'            
                });           
                form.append($('<input>', { type: 'hidden', name: 'start_date', value: start }));                
                form.append($('<input>', { type: 'hidden', name: 'end_date', value: end }));
                form.append($('<input>', { type: 'hidden', name: 'c_id', value: customer }));            
                $('body').append(form);
                form.submit();        
                form.remove();          
                Swal.close();
            }    
        });
    });
</script> 
<?php
include('footer.php');
?>