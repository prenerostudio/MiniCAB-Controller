<?php

function fetchVehiclePricingFromDatabase($vehicleId) {
	//global $connect;    	    
	$vehicleId = mysqli_real_escape_string($connect, $vehicleId);    	
    $query = "SELECT v_pricing FROM vehicles WHERE v_id = '$vehicleId'";   	
    $result = mysqli_query($connect, $query);   	
    if ($result) {        		
        $row = mysqli_fetch_assoc($result);       		
        if ($row) {           			
            return $row['v_pricing'];
        } else {           			
            return 0; 			
        }
    } else {       		
        return 0; 		
    }
}


?>