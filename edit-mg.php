<?php
include('header.php');
require_once('config.php');
require_once('session.php');

if (isset($_GET['mg_id'])) {
    $mg_id = $_GET['mg_id'];
    $sql = "SELECT * FROM `mg_charges` WHERE `mg_id` = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("i", $mg_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $pickup_location = $row['pickup_location'];
        $pickup_charges = $row['pickup_charges'];

        // Display edit form
?>     
<div class="page-header d-print-none">
    <div class="container-xl">    
        <div class="row g-2 align-items-center">        	
            <div class="col">            	
                <h2 class="page-title">                		
                    Account Settings                		
                </h2>              		
            </div>	
        </div>        	
    </div>    
</div>      
<div class="page-body">
    <div class="container-xl">    		
        <div class="card">	
            <div class="row g-0">												                		
                <div class="col-12 col-md-12 d-flex flex-column">		
                    <div class="card-body">
                        <form method="POST" action="update-mg.php">            			
                            <input type="hidden" name="mg_id" value="<?php echo $mg_id; ?>">
                            <label for="pickup_location">Pickup Location:</label>            			
                            <input type="text" name="pickup_location" class="form-control" value="<?php echo $pickup_location; ?>"><br><br>            			
                            <label for="pickup_charges">Pickup Charges:</label>            			
                            <input type="text" name="pickup_charges" class="form-control" value="<?php echo $pickup_charges; ?>"><br><br>            			
                            <button type="submit" class="btn btn-primary">Update</button>        			
                        </form>
                    </div>           		
                </div>                  														
            </div>	
        </div>	
    </div>
</div>       
<?php		
} else {    
    echo "Record not found.";        
}
} else {
    echo "Invalid request.";
}
include('footer.php')
?>