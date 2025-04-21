<?php

function fetchVehiclePricingFromDatabase($vehicleId) {


    $vehicleId = mysqli_real_escape_string($connect, $vehicleId);

    $query = "SELECT * FROM vehicles WHERE v_id = '$vehicleId'";    

    $result = mysqli_query($connect, $query);

    $row = mysqli_fetch_assoc($result);       		
 

    $vehicle_name = $row['v_name'];
    

    $sql = "SELECT * FROM `price_mile`";    

    $pmresult = mysqli_query($connect, $sql);        		

    $pmrow = mysqli_fetch_assoc($pmresult);   
                 

    if ($pmrow) {           			                  
    
        $start_from = $pmrow['start_from'];

        $end_to = $pmrow['end_to'];
        
        $saloon = $pmrow['v_pricing'];
        
        $estate = $pmrow['v_pricing'];
        
        $mpv = $pmrow['v_pricing'];
        
        $esaloon = $pmrow['v_pricing'];
        
        $lmpv = $pmrow['v_pricing'];
        
        $empv = $pmrow['v_pricing'];
        
        $minibus = $pmrow['v_pricing'];
        
        $delivery = $pmrow['v_pricing'];
        
                                                    
        
        } else {           			

            
        
            return 0; 			
        
                
            
                
            
            
        }
    
         
            

                
            
        
        }


?>