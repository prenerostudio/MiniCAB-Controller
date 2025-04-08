<div class="card-body">
    <h2 class="mb-4">
        Peak Hours Time
    </h2>
    <div class="row">
        <table class="table">
            <tbody>
                <tr>
                    <td>Start Time</td>	
                    <td>End Time</td>
                    <td>Select Days</td>
                    <td>Charges Increment %</td>
                    <td></td>
                </tr>
            <form action="peak-hours-process.php" method="post">
                <tr>
                    <td style="width: 30%;">
                        <input type="time" name="st" class="form-control" required />
                    </td>
                    <td style="width: 30%;">
                        <input type="time" name="et" class="form-control" required />
                    </td>
                    <td>
                        <p>
                            <label>
                                <input type="checkbox" name="days[]" value="monday">
                                Monday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="tuesday">
                                Tuesday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="wednesday">
                                Wednesday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="thursday">
                                Thursday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="friday">
                                Friday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="saturday">
                                Saturday
                            </label>
                            <br>
                            <label>
                                <input type="checkbox" name="days[]" value="sunday">
                                Sunday
                            </label>
                            <br>
                        </p>
                    </td>
                    <td>
                        <div class="input-group mb-3">
                            <input type="text" name="price" class="form-control" aria-label="Amount (to the nearest pound)" required />
                        </div>
                    </td>
                    <td>
                        <button type="submit" class="btn btn-success" style="width: 100%;">
                            <i class="ti ti-plus"></i>
                            Add
                        </button>
                    </td>
                </tr>
            </form>
        </tbody>
        </table>
    </div>
    <div class="row">
        <table class="table table-responsive">
             <tbody>
                 <tr>
                     <td>ID</td>
                     <td>Start Time</td>
                     <td>End Time</td>
                     <td>Days</td>
                     <td>Price Increment</td>
                     <td></td>
                 </tr>		
				 <?php                
				 $n=0;                
				 $phsql=mysqli_query($connect,"SELECT * FROM `peak_hours`");                
				 while($phrow = mysqli_fetch_array($phsql)){                    
					 $n++;                   
				 ?>
                 <tr>
                     <td style="width: 4%;">			
						 <?php echo $n; ?>
                     </td>
                     <td>			
						 <?php echo $phrow['start_time'] ?>
                     </td>
                     <td>			
						 <?php echo $phrow['end_time'] ?>
                     </td>
                     <td>			
						 <?php echo $phrow['peak_hours_days'] ?>
                     </td>
                     <td>			
						 <?php echo $phrow['price_increment'] ?>
                     </td>
                     <td>
                         <a href="del-peak-hours.php?ph_id=<?php echo $phrow['ph_id'];?>">
                             <button class="btn btn-danger">Delete</button>
                         </a>
                     </td>
                 </tr>		
				 <?php
                }
                ?>
             </tbody>
        </table>
    </div>
</div>