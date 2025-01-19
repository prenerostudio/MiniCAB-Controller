<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id=$_POST['d_id'];
 
if(isset($_POST['d_id' ])){		

    $sql="SELECT drivers.`status` FROM drivers WHERE drivers.d_id = '$d_id'";	

    $r=mysqli_query($connect,$sql);
	

    if($r){   

        $output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	
        echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Driver Status Fetch Successfully"));
	
        
    }else{    
	
        echo json_encode(array('message'=>'User Does Not Exist','status'=>false));
	
        
    }
}else{    
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>