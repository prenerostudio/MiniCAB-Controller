<?php

include('config.php'); 


$job_list_html = '';
$y = 0;

$jobsql = mysqli_query($connect, "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, bookings.*, drivers.*, booking_type.*, vehicles.* FROM jobs, clients, bookings, drivers, booking_type, vehicles WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.job_status = 'waiting' AND bookings.b_type_id = booking_type.b_type_id AND bookings.v_id = vehicles.v_id ORDER BY jobs.job_id DESC");

// Define CSS classes for table rows
$row_classes = ['odd', 'even'];
$current_class_index = 0;

while ($jobrow = mysqli_fetch_array($jobsql)) {
    $y++;
    $current_class = $row_classes[$current_class_index];
    $current_class_index = 1 - $current_class_index; // Toggle between 0 and 1 for odd and even rows

    // Start table row with the CSS class
    $job_list_html .= '<tr class="' . $current_class . '">'; 

    // Table data for each column
    $job_list_html .= '<td class="sort-id">' . $y . '</td>'; // ID
    $job_list_html .= '<td class="sort-date">' . $jobrow['pick_date'] . '</td>'; // Date
	$job_list_html .= '<td class="sort-date">' . $jobrow['pick_time'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['passenger'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['pickup'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['destination'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['journey_fare'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['v_name'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['job_status'] . '</td>';
	$job_list_html .= '<td class="sort-date">' . $jobrow['d_name'] . '</td>';

    // Add other columns here similarly

    // End table row
    $job_list_html .= '</tr>';
}

// Output the HTML content of the updated job list
echo $job_list_html;
?>
