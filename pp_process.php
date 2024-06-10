<?php
include('config.php');
include('session.php');
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
    if (
        isset($_POST['pickup'], $_POST['dropoff'], $_POST['1-4pass'], $_POST['1-4es'], $_POST['5-6pass'], 
        $_POST['7pass'], $_POST['8pass'], $_POST['9pass'], $_POST['10_14pass'], $_POST['15_16pass'])
    ) {    
        $pickup = $_POST['pickup'];
        $dropoff = $_POST['dropoff'];
        $p1_4 = $_POST['1-4pass'];
        $e1_4 = $_POST['1-4es'];
        $p5_6 = $_POST['5-6pass'];
        $p7 = $_POST['7pass'];
        $p8 = $_POST['8pass'];
        $p9 = $_POST['9pass'];
        $p10_14 = $_POST['10_14pass'];
        $p15_16 = $_POST['15_16pass'];        
        try {            
            $sql = "INSERT INTO `price_postcode`(`pickup`, `dropoff`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pp`)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";            
            $stmt = $connect->prepare($sql);
            $stmt->execute([$pickup, $dropoff, $p1_4, $e1_4, $p5_6, $p7, $p8, $p9, $p10_14, $p15_16]);			
		
			$activity_type = 'PostCode Price Added';
			$user_type = 'user';
			$details = "PostCode Price Has Been Added by Controller.";
			
			$actsql = "INSERT INTO `activity_log`(
												`activity_type`, 
												`user_type`, 
												`user_id`, 
												`details`
												) VALUES (
												'$activity_type',
												'$user_type',
												'$myId',
												'$details')";
			$actr = mysqli_query($connect, $actsql);			
            echo "Data inserted successfully.";
            header("Location: pricing.php"); 
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        } finally {
            $connect = null;
        }
    } else {
        echo "Error: Insufficient data.";
    }
} else {    
    header("Location: pricing.php"); 
    exit();
}
?>