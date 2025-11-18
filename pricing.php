<?php
include('header.php');	
?> 
<div class="page-header d-print-none page_padding pb-3">		   		
    <div class="row g-2 align-items-center">        	
        <div class="col">            									
            <div class="page-pretitle">                				
                Overview                						
            </div>                				
            <h2 class="page-title">                				
                Pricing Section                						
            </h2>              				
        </div>				
    </div>	
</div> 

<div class="row row-deck row-cards">          
    <div class="col-md-12">	
        <div class="card">			
            <div class="card-header">				
                <ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">						
                    <li class="nav-item">							
                        <a href="#tabs-mile" class="nav-link active" data-bs-toggle="tab">										
                            <i class="ti ti-brand-speedtest" style="font-size: 28px;"></i>			
                            Price Per Mile									
                        </a>													
                    </li>
                    <li class="nav-item">                       							
                        <a href="#tabs-post" class="nav-link" data-bs-toggle="tab">			
                            <i class="ti ti-map-search" style="font-size: 28px;"></i>			
                            Postcode Area Prices								
                        </a>                     								
                    </li>  							
                    <li class="nav-item">                       							
                        <a href="#tabs-meet" class="nav-link" data-bs-toggle="tab">    									
                            <i class="ti ti-route-alt-left" style="font-size: 28px;"></i>			
                            Meet & Greet Charges								
                        </a>                     								
                    </li> 		
                    <li class="nav-item">                       							
                        <a href="#tabs-dates" class="nav-link" data-bs-toggle="tab">			
                            <i class="ti ti-route-alt-left" style="font-size: 28px;"></i>			
                            Special Dates								
                        </a>                     								
                    </li> 		
                    <li class="nav-item">                       							
                        <a href="#tabs-peak" class="nav-link" data-bs-toggle="tab">			
                            <i class="ti ti-route-alt-left" style="font-size: 28px;"></i>			
                            Peak Hours								
                        </a>                     								
                    </li>		
                </ul>		
            </div>	            	
            <div class="card-body">	
                <div class="tab-content">		
                    <div class="tab-pane active show" id="tabs-mile">
                        <?php                               
                        include('templates/pricing/price-by-mile.php');
                        ?>
                    </div>                   
                    <div class="tab-pane" id="tabs-post">
                        <?php
                        include('templates/pricing/postcode-price.php');
                        ?>
                    </div>
                    <div class="tab-pane" id="tabs-meet">
                        <?php
                        include('templates/pricing/meet-greet-price.php');
                        ?>
                    </div>
                    <div class="tab-pane" id="tabs-dates">
                        <?php
                        include('templates/pricing/special-date-price.php');
                        ?>
                    </div>
                    <div class="tab-pane" id="tabs-peak">
                        <?php
                        include('templates/pricing/peak-hours-price.php');				                                
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
include('footer.php');
?>