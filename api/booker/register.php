<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");
if (isset($_POST['b_phone'])) {
	$b_name = $_POST['b_name'];
    $b_email = $_POST['b_email'];
    $b_phone = $_POST['b_phone'];
    $acount_status = 0;
    $date = date("Y-m-d h:i:s");
	$checksql = "SELECT * FROM `bookers` WHERE `b_phone`='$b_phone'";
	$checkr = mysqli_query($connect, $checksql);
	$datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);
        
	if (count($datacheck) > 0) {    	
		echo json_encode(array('message' => "This User Already Exists! Try to Sign in", 'status' => false));        
	} else {    
		$sql = "INSERT INTO `bookers`(
										`b_name`, 
										`b_email`, 
										`b_phone`, 
										`booker_reg_date`
										) VALUES (
										'$b_name',
										'$b_email',
										'$b_phone',
										'$date')";
            
            $r = mysqli_query($connect, $sql);
            if ($r) {
                echo json_encode(array('message' => "Booker Registered Successfully", 'status' => true));
            } else {
                echo json_encode(array('message' => "Error In Registering Driver", 'status' => false));
            }
        }    
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
