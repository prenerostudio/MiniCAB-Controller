<?php
include('config.php');
$clientOptions = '';
if (isset($_POST['b_type_id'])) {
	$selectedBookingType = $_POST['b_type_id'];
	switch ($selectedBookingType) {
	case '1':
		$query = "SELECT * FROM `clients` WHERE `account_type`= 1";
		break;
	case '2':
		$query = "SELECT * FROM `companies`";
		break;
	case '3':
		$query = "SELECT * FROM `clients` WHERE `account_type`= 2";
		break;
	case '4':
	case '5':
	case '6':
		echo ' ';
		mysqli_close($connect);
		exit;
	default:
		echo '<option value="">Invalid booking type</option>';
		mysqli_close($connect);
		exit;
}

	$result = mysqli_query($connect, $query);
	if ($result) {
		while ($row = mysqli_fetch_assoc($result)) {
			if ($selectedBookingType == '2') {
				$clientOptions .= '<option value="' . $row['com_id'] . '">' . $row['com_name'] . '</option>';
			} elseif ($selectedBookingType == '3') {
				$clientOptions .= '<option value="' . $row['c_id'] . '">' . $row['c_name'] . '</option>';
			} else {
				$clientOptions .= '<option value="' . $row['c_id'] . '">' . $row['c_name'] . '</option>';
			}                                            
		}                
		echo $clientOptions;    		                                
	} else {            
		echo '<option value="">Error fetching clients</option>';                                        
	}                            
} else {   
	echo '<option value="">Invalid request</option>';                                
}
mysqli_close($connect);
?>