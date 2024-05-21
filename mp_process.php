<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {    
    if (isset($_POST['from'], $_POST['to'], $_POST['1-4p'], $_POST['1-4e'], $_POST['5-6p'], $_POST['7p'], $_POST['8p'], $_POST['9p'], $_POST['10_14p'], $_POST['15_16p'])) {    
        $from = $_POST['from'];
        $to = $_POST['to'];
        $p1_4 = $_POST['1-4p'];
        $e1_4 = $_POST['1-4e'];
        $p5_6 = $_POST['5-6p'];
        $p7 = $_POST['7p'];
        $p8 = $_POST['8p'];
        $p9 = $_POST['9p'];
        $p10_14 = $_POST['10_14p'];
        $p15_16 = $_POST['15_16p'];

        try {            
            $sql = "INSERT INTO `price_mile` (`start_from`, `end_to`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pm`)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            $stmt = $connect->prepare($sql);
            $stmt->execute([$from, $to, $p1_4, $e1_4, $p5_6, $p7, $p8, $p9, $p10_14, $p15_16]);           			
            echo "Data inserted successfully.";
			
			$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Price Per Mile Added ',											
											'Controller',											
											'New Price Per Mile Has Been Added by Controller.')";		
	
			$actr = mysqli_query($connect, $actsql);
            header("Location: pricing.php");
        } catch (PDOException $e) {           			
            echo "Error: " . $e->getMessage();
        }
    } else {        		
        echo "Error: Insufficient data.";
    }
} else {    	
    header("Location: pricing.php");
    exit();
}
?>