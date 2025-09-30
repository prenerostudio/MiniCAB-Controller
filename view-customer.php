<?php
include('header.php');
$c_id = $_GET['c_id'];
$csql=mysqli_query($connect,"SELECT * FROM `clients` WHERE `c_id`='$c_id'");
$crow = mysqli_fetch_array($csql);		
?>
<div class="page-header d-print-none page_padding">		   			
    <div class="row g-2 align-items-center">        		
        <div class="col">            											
            <div class="page-pretitle">                							
                Overview                						
            </div>                				
            <h2 class="page-title">                				
                View Customer Details              						
            </h2>              				
        </div>			
        <div class="col-auto ms-auto d-print-none">            			
            <div class="btn-list">			
                <?php               
                if($crow['acount_status']==0){			                
                ?>							
                <a href="includes/customer/update-customer-status.php?id=<?php echo $c_id ?>" class="btn btn-primary d-none d-sm-inline-block">		
                    <i class="ti ti-checks"></i>                    							
                    Approve Customer                 							
                </a>					
                <?php                   
                }else {				                
                ?>							
                <button class="btn btn-disable d-none d-sm-inline-block" disabled>  											
                    <i class="ti ti-checks"></i>                    							
                    Verified Customer                 						
                </button>  		
		<?php					               
                }							                
                ?>							              					                							
            </div>              				
        </div>			
    </div>	
</div>

<div class="page-body page_padding">          		
    <div class="row row-deck row-cards">						
        <div class="col-md-12">        			
            <div class="card">            				
                <div class="card-header">                						
                    <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                    							
                        <li class="nav-item">                        									
                            <a href="#tabs-profile" class="nav-link active" data-bs-toggle="tab">			
                                <i class="ti ti-user-scan"></i>                          												
				<?php if($crow['account_type']== 2) { ?> Booker						
                                <?php }else{ ?> Customer <?php } ?> Profile
                            </a>			
                        </li>                      									
                        <li class="nav-item">									
                            <a href="#tabs-statement" class="nav-link" data-bs-toggle="tab">								
                                <i class="ti ti-calendar-user"></i>                          												
				<?php if($crow['account_type']== 2) { ?> Booker							
                                <?php }else{ ?> Customer <?php } ?> Bookings Statement							
                            </a>                      									
                        </li>				
                        <li class="nav-item">									
                            <a href="#tabs-activity" class="nav-link" data-bs-toggle="tab">								
                                <i class="ti ti-activity"></i>                         												
				<?php if($crow['account_type']== 2) { ?> Booker							
                                <?php }else{ ?> Customer <?php } ?> Activity Logs							
                            </a>                      									
                        </li>				
                    </ul>		
                </div>						
                <div class="card-body">                						
                    <div class="tab-content">                    							
                        <div class="tab-pane active show" id="tabs-profile">    									
                           <?php                           
                           include 'templates/customer/customer-profile-section.php';
                           ?>			
                        </div>			
                        <div class="tab-pane" id="tabs-statement">			                            
                            <?php                           
                            include 'templates/customer/customer-booking-statement.php';                           
                            ?>                          								
                        </div>    			
                        <div class="tab-pane" id="tabs-activity">							
                            <?php                               
                            include('templates/customer/customer-activity-log.php');				                                
                            ?>										
                        </div>			
                    </div>                 												
                </div>             		
            </div>	
        </div>	
    </div>
</div>   
<?php
include('footer.php');
?>