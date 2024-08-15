<?php
include('config.php'); 
$job_list_html = '';
$y = 0;
$jobsql = mysqli_query($connect, "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, drivers.*, booking_type.*, vehicles.* FROM jobs JOIN clients ON jobs.c_id = clients.c_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.job_status <> 'completed' ORDER BY jobs.job_id DESC");
$row_classes = ['odd', 'even'];
$current_class_index = 0;
while ($jobrow = mysqli_fetch_array($jobsql)) {
	$y++;    
	$current_class = $row_classes[$current_class_index];    
	$current_class_index = 1 - $current_class_index;     
	$job_list_html .= '<tr class="' . $current_class . '">';     
	$job_list_html .= '<td>' . $y . '</td>'; // ID    
	$job_list_html .= '<td>' . $jobrow['pick_date'] . '</td>'; // Date    
	$job_list_html .= '<td>' . $jobrow['pick_time'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['postal_code'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['pickup'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['stops'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['destination'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['passenger'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['journey_type'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['journey_fare'] . '</td>';    
	$job_list_html .= '<td>' . $jobrow['v_name'] . '</td>';	
    $job_list_html .= '<td>    
	<form method="post" action="dispatch-process.php">    
	<input type="hidden" value="' . $jobrow['book_id'] . '" name="book_id">    
	<input type="hidden" value="' . $jobrow['c_id'] . '" name="c_id">    
	<input type="hidden" value="' . $jobrow['journey_fare'] . '" name="journey_fare">    
	<input type="hidden" value="' . $jobrow['booking_fee'] . '" name="booking_fee">    
	<select class="form-control mb-2" name="d_id" required>                    
	<option value="">Select Driver</option>';    	    
	$drsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1");    
	while ($drrow = mysqli_fetch_array($drsql)) {    
		$job_list_html .= '<option value="' . $drrow['d_id'] . '">        
		' . $drrow['d_id'] . ' - ' . $drrow['d_name'] . ' - ' . $drrow['d_phone'] . '        
		</option>';                                                
	}    	    
	$job_list_html .= '</select>    
	<button type="submit" class="btn btn-success">    
	<i class="ti ti-plane-tilt"></i> Dispatch Job
	</button>
	</form>
	</td>';   
	$job_list_html .= '</tr>';
}
echo $job_list_html;
?>