<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$d_phone = $_POST['d_phone'] ?? null;
$d_password = $_POST['d_password'] ?? null;

if(isset($d_phone, $d_password)) {    
    $sql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";
    $r = mysqli_query($connect, $sql);   
    if($r) {       
        if(mysqli_num_rows($r) > 0) {           
            $row = mysqli_fetch_assoc($r);           
            if($row['d_password'] === $d_password) {               
                echo json_encode(array('data'=>$row, 'message'=>'User Logged in Successfully','status'=>true));
            } else {                
                echo json_encode(array('message'=>'Incorrect password','status'=>false));
            }
        } else {            
            echo json_encode(array('message'=>'User does not exist','status'=>false));
        }
    } else {        
        echo json_encode(array('message'=>'Query failed','status'=>false));
    }
} else {    
    echo json_encode(array('message'=>"Some fields are missing",'status'=>false));
}
?>