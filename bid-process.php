<?php
include("config.php");
include('session.php');


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    

    $book_id = mysqli_real_escape_string($connect, $_POST["book_id"]);
	
    $bid_date = mysqli_real_escape_string($connect, $_POST['bid_date']);

    $bid_time = mysqli_real_escape_string($connect, $_POST['bid_time']);

    $bid_note = mysqli_real_escape_string($connect, $_POST["bid_note"]);

    $status = 1;

    

    $pickup_sql = "SELECT `pick_date`, `pick_time` FROM `bookings` WHERE `book_id` = ?";

    if ($pickup_stmt = mysqli_prepare($connect, $pickup_sql)) {
    

        mysqli_stmt_bind_param($pickup_stmt, 'i', $book_id);

        mysqli_stmt_execute($pickup_stmt);

        mysqli_stmt_bind_result($pickup_stmt, $pick_date, $pick_time);

        mysqli_stmt_fetch($pickup_stmt);

        mysqli_stmt_close($pickup_stmt);

    

        $pickup_datetime = new DateTime("$pick_date $pick_time");

        $current_datetime = new DateTime(); 
        

        
    
       
        if ($current_datetime > $pickup_datetime) {
          
            echo "You cannot add a booking for bid because the Booking Pickup time has already passed.";
       
            } else {
    
          
                
                $update_sql = "UPDATE `bookings` SET `bid_status` = ?, `bid_date` = ?, `bid_time` = ?, `bid_note` = ? WHERE `book_id` = ?";

            
                if ($stmt = mysqli_prepare($connect, $update_sql)) {
    
                
                    mysqli_stmt_bind_param($stmt, 'isssi', $status, $bid_date, $bid_time, $bid_note, $book_id);

                
                    if (mysqli_stmt_execute($stmt)) {
                        
                                          
                        $bid_msg = "Controller has opened a bid for booking # $book_id";

    

                        $bid_sql = "INSERT INTO `bids_notifications`(`book_id`, `bid_date`, `bid_time`, `bid_msg`) VALUES (?, ?, ?, ?)";

                    
                        if ($bid_stmt = mysqli_prepare($connect, $bid_sql)) {
    
                        
                            mysqli_stmt_bind_param($bid_stmt, 'ssss', $book_id, $bid_date, $bid_time, $bid_msg);
                        
                            mysqli_stmt_execute($bid_stmt);
                        
                            mysqli_stmt_close($bid_stmt);
                    
                            
                        } else {
                        
                            echo "Error preparing Notification query: " . mysqli_error($connect);
                    
                            
                        }
                        
                        
                        
                        
                        

                        $activity_type = 'Booking Opens for Bid';
                    
                        $user_type = 'user';
                    
                        $details = "Controller has opened a bid for booking $book_id";

    

                        $log_sql = "INSERT INTO `activity_log` (
                        				`activity_type`, 
                        				`user_type`, 
                        				`user_id`, 
                        				`details`
                        				) VALUES (?, ?, ?, ?)";

                    
                        if ($log_stmt = mysqli_prepare($connect, $log_sql)) {
    
                        
                            mysqli_stmt_bind_param($log_stmt, 'ssis', $activity_type, $user_type, $myId, $details);
                        
                            mysqli_stmt_execute($log_stmt);
                        
                            mysqli_stmt_close($log_stmt);
                    
                            
                        } else {
                        
                            echo "Error preparing activity log query: " . mysqli_error($connect);
                    
                            
                        }

                    
                        echo "Bid added successfully!";
                    
                        header('Location: bid-bookings.php');
                    
                        exit();
                
                        
                        } else {
                    
                            echo "Error updating booking: " . mysqli_stmt_error($stmt);
                
                            
                        }



                        mysqli_stmt_close($stmt);
            
                        
                        } else {

                            echo "Error preparing update query: " . mysqli_error($connect);
            
                            
                        }
        
                        
                        }
    
                        
                        } else {
        
                            echo "Error preparing pickup query: " . mysqli_error($connect);
    
                            
                        }

    
    
                        mysqli_close($connect);

                        
                        }
?>
