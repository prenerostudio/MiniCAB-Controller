<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                Special Date / Holidays
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <span class="d-none d-sm-inline">
                    <a href="#" class="btn" data-bs-toggle="modal" data-bs-target="#modal-date">
                        <i class="ti ti-clock-plus"></i>
                        Add Date
                    </a>
                </span>
            </div>
        </div>
    </div>
</div>
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h2 class="mb-4">
                        Special Date / Holidays
                    </h2>
                    <div class="row mb-3">
                        <div class="card">
                            <div class="card-body border-bottom py-3">
                                <div id="table-adriver" class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Date</th>
                                                <th>Event / Holiday</th>
                                                <th>Price Increment %</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-tbody">
                                            <?php
                                            $x = 0;
                                            $dsql = mysqli_query($connect, "SELECT * FROM `special_dates`");
                                            while ($drow = mysqli_fetch_array($dsql)) :
                                                $x++;
                                            ?>
                                            <tr>
                                                <td>
                                                    <?php echo $x; ?>
                                                </td>
                                                <td>													
                                                    <?php echo $drow['special_date']; ?>
                                                </td>
                                                <td>
                                                    <?php echo $drow['event_name']; ?>
                                                </td>
                                                <td>
                                                    <?php echo $drow['percent_increment']; ?>
                                                </td> 
                                                <td>
                                                    <a href="#">
                                                        <button class="btn btn-info">
                                                            <i class="ti ti-pencil"></i>
                                                            Edit
                                                        </button>
                                                    </a>
                                                    <a href="del-date.php?dt_id=<?php echo $drow['dt_id']; ?>">
                                                        <button class="btn btn-danger">
                                                            <i class="ti ti-basket-cancel"></i>
                                                            Delete
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
						<?php endwhile; ?>
                                                    <?php if ($x === 0) : ?>
                                            <tr>
                                                <td colspan="8">
                                                    <p align="center">No Special Date Found!</p>
                                                </td>
                                            </tr>
						<?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>				
                            </div>       													
                        </div>						
                    </div>					
                </div>		
            </div>	
        </div>	
    </div>	
</div>
<div class="modal modal-blur fade" id="modal-date" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Date</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="date-process.php" onsubmit="return validateForm();">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Select Date:</label>
                                <input type="date" name="mdate" class="form-control" required>
                            </div>
                        </div> 
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Event Name:</label>
                                <input type="text" name="ename" class="form-control" required>
                            </div>
                        </div>			
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Price Increment %:</label>
                                <input type="number" name="inc" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
                        Cancel
                    </a>
                    <button type="submit" class="btn btn-success">
                        <i class="ti ti-clock-plus"></i>
                        Add Date
                    </button>
                </div> 
            </form>
            <script>
    function validateForm() {
        // Perform your form validation here
        var dateInput = document.getElementsByName("date")[0].value;
        var eventNameInput = document.getElementsByName("ename")[0].value;
        var priceIncrementInput = document.getElementsByName("inc")[0].value;
        if (dateInput === "" || eventNameInput === "" || priceIncrementInput === "") {
            // Display an error message or prevent the form submission 
            alert("Please fill in all required fields.");
            return false;
        } 
        // If validation passes, you can proceed with the form submission
        return true; 
    }   
            </script>			
        </div>      			
    </div>    
</div>