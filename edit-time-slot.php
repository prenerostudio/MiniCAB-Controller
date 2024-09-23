<?php
include('header.php');

$ts_id = $_GET['ts_id'];

$atsql=mysqli_query($connect,"SELECT time_slots.*, drivers.* FROM time_slots LEFT JOIN drivers ON time_slots.d_id = drivers.d_id WHERE time_slots.ts_id = '$ts_id'");
								$atrow = mysqli_fetch_array($atsql);


?>  
<div class="page-header d-print-none page_padding">
	<div class="row g-2 align-items-center">        		
		<div class="col">		
			<div class="page-pretitle">			
				Overview			
			</div>
			<h2 class="page-title">
				Time Slots For Drivers			
			</h2>		
		</div>		
	</div>	
</div>
<div class="page-body page_padding">          
	<div class="row row-deck row-cards">			      		
						
		<div class="col-5">            					
			<div class="card">                							
				<div class="card-header">                    									
					<h3 class="card-title">
						Add Time Slot
					</h3>                  										
				</div>                  				
				<div class="card-body border-bottom py-3">					
					<form method="post" action="time-slot-process.php" onsubmit="return validateForm();">				
						<div class="modal-body">																		
							<div class="row">					
								<div class="col-lg-12">						
									<div class="mb-3">								
										<label class="form-label">Select Date:</label>
										<input type="date" name="mdate" value="<?php echo $atrow['ts_date']; ?>" class="form-control" required>							
									</div>						
								</div>						
								<div class="col-lg-12">							
									<div class="mb-3">								
										<label class="form-label">Start Time:</label>								
										<input type="time" name="stime" value="<?php echo $atrow['start_time']; ?>" class="form-control" required>							
									</div>						
								</div>												
								<div class="col-lg-12">                													
									<div class="mb-3">								
										<label class="form-label">End Time:</label>								
										<input type="time" name="etime" value="<?php echo $atrow['end_time']; ?>" class="form-control" required>
									</div>						
								</div>	.
								<div class="col-lg-12">                													
									<div class="mb-3">								
										<label class="form-label">Price per Hour:</label>								
										<input type="text" name="pph" value="<?php echo $atrow['price_hour']; ?>" class="form-control" required>
									</div>						
								</div>	
							</div>							          				          				
						</div>				       							
						<div class="modal-footer">					
											
							<button type="submit" class="btn btn-success">												
								<i class="ti ti-clock-plus"></i>						
								Update Time Slot											
							</button>       							
						</div> 											
					</form>									
				</div>                                                    				
			</div>              					
		</div>				
	</div>
</div>        
<script>
	function validateForm() {       
        var dateInput = document.getElementsByName("date")[0].value;
        var stimeInput = document.getElementsByName("stime")[0].value;
        var etimeInput = document.getElementsByName("etime")[0].value;
        if (dateInput === "" || stimeInput === "" || etimeInput === "") {            
            alert("Please fill in all required fields.");
            return false;
        }        
        return true;
    }
</script>
<?php
include('footer.php');
?>