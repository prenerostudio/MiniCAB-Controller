<?php
include('header.php');

// Include configuration and session management files
require_once('config.php');
require_once('session.php');

// Check if pp_id is provided in the URL
if (isset($_GET['pp_id'])) {
    $pp_id = $_GET['pp_id'];

    // Fetch record from database
    $sql = "SELECT * FROM `price_postcode` WHERE `pp_id` = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("i", $pp_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
		$pickup	= $row['pickup'];
		$dropoff = $row['dropoff'];
		$salon = $row['saloon'];
		$estate = $row['estate'];
		$mpv = $row['mpv'];
		$esalon = $row['esaloon'];
		$lmpv = $row['lmpv'];
		$empv = $row['empv'];
		$minibus = $row['minibus'];
		$delivery = $row['delivery'];
               
?>     
<div class="page-header d-print-none">
	<div class="container-xl">    
		<div class="row g-2 align-items-center">        
			<div class="col">            
				<h2 class="page-title">                
					Edit Price By Post Code            
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
						<form method="POST" action="update-postcode-price.php">													
							<div class="row">
								<div class="col-md-6 mb-3">
									<input type="hidden" name="pp_id" value="<?php echo $pp_id; ?>">
									<label for="pickup_location">Pickup:</label>
									<input type="text" name="pickup" class="form-control" value="<?php echo $pickup; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Dropoff:</label>
									<input type="text" name="dropoff" class="form-control" value="<?php echo $dropoff; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Saloon / Mile:</label>
									<input type="text" name="salon" class="form-control" value="<?php echo $salon; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">EState / Mile:</label>
									<input type="text" name="estate" class="form-control" value="<?php echo $estate; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">MPV / Mile:</label>
									<input type="text" name="mpv" class="form-control" value="<?php echo $mpv; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Executive Saloon / Mile:</label>
									<input type="text" name="esalon" class="form-control" value="<?php echo $esalon; ?>">
								</div>
								
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Large MPV / Mile:</label>
									<input type="text" name="lmpv" class="form-control" value="<?php echo $lmpv; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Executive Large / Mile:</label>
									<input type="text" name="empv" class="form-control" value="<?php echo $empv; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">MiniBus / Mile:</label>
									<input type="text" name="minibus" class="form-control" value="<?php echo $minibus; ?>">
								</div>
								<div class="col-md-6 mb-3"> 
									<label for="pickup_charges">Delivery / Mile:</label>
									<input type="text" name="delivery" class="form-control" value="<?php echo $delivery; ?>">
								</div>																
							</div>														
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