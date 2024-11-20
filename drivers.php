<?php
include('header.php');
?>  
<div class="page-header d-print-none page_padding">
    <div class="row g-2 align-items-center">
        <div class="col">
            <div class="page-pretitle">
                Overview
            </div>
            <h2 class="page-title">
                Drivers Section
            </h2>
        </div>
        <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-driver">
                    <i class="ti ti-user-plus"></i>
                    Add New Driver
                </a>
            </div>
        </div>
    </div>
</div>
<div class="page-body page_padding">
    <div class="row row-deck row-cards">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    Active Drivers List
                </h3>
            </div>
            <div class="card-body border-bottom py-3">
                <div id="table-adriver" class="table-responsive">
                    <table class="table" id="table-driver">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Post Code</th>
                                <th>License Authority</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="table-tbody">
				<?php
                                $x = 0;
                                $adsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1 ORDER BY drivers.d_id DESC");
                                while ($adrow = mysqli_fetch_array($adsql)) :
                                    $x++;
                                ?>
                            <tr>
                                <td>
                                    <?php echo $x; ?>
                                </td>
                                <td>
                                    <?php
                                    if (!$adrow['d_pic']) :
                                        ?>
                                    <img src="img/user-1.jpg" alt="Driver Img" style="width: 50px; height: 50px; border-radius: 5px;">
                                        <?php else : ?>
                                    <img src="img/drivers/<?php echo $adrow['d_pic']; ?>" alt="Driver Img" style="width: 50px; height: 50px; background-size: 100% 100%; border-radius: 5px;">
                                        <?php endif; ?>								
                                </td>
                                <td>
                                    <strong style="text-transform: capitalize;">
                                        <?php echo $adrow['d_name'];?>
                                    </strong>
                                </td>
                                <td>
                                    <?php echo $adrow['d_email'];?>
                                </td>
                                <td>
                                    <?php echo $adrow['d_phone'];?>
                                </td>
                                <td>
                                    <?php echo $adrow['d_gender'];?>
                                </td>
                                <td>
                                    <?php echo $adrow['d_post_code'];?>
                                </td>
                                <td>									
                                    <?php echo $adrow['licence_authority'];?>
                                </td>
                                <td>
                                    <a href="view-driver.php?d_id=<?php echo $adrow['d_id']; ?>">
                                        <button class="btn btn-info">
                                            <i class="ti ti-eye"></i>
                                            View
                                        </button>
                                    </a>
                                    <a href="del-driver.php?d_id=<?php echo $adrow['d_id']; ?>">
                                        <button class="btn btn-danger delete_btn">
                                            <i class="ti ti-square-rounded-x"></i>
                                            Delete
                                        </button>
                                    </a>
                                    <a href="make-inactive.php?d_id=<?php echo $adrow['d_id']; ?>">
                                        <button class="btn btn-instagram">
                                            <i class="ti ti-user-x"></i>
                                            Make Inactive
                                        </button>
                                    </a>
                                </td>
                            </tr>
				<?php endwhile; ?>
                                    <?php if ($x === 0) : ?>
                            <tr>
                                <td colspan="8">
                                    <p align="center">No Driver Found!</p>
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
<script>			
    $(document).ready(function() {   	
        $('#table-driver').DataTable();	
    });
</script>
<div class="modal modal-blur fade" id="modal-driver" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Add New Driver		
                </h5>            										
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>		
            </div> 				
            <form method="post" enctype="multipart/form-data" action="driver-process.php" onsubmit="return validateForm();">
                <div class="modal-body">
                    <div class="row">
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Driver Name</label>
                            <input type="text" class="form-control" name="dname" placeholder="Driver Name" required>
                        </div>			
                        <div class="mb-3 col-lg-6">                  																
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="demail" placeholder="hello@example.com" required>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Phone</label>
                            <input type="text" class="form-control" name="dphone" placeholder="+44 xx xxxx xxxx" required>
                        </div> 
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="dpass" placeholder="xxxxxxxx" required>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">License Authority</label>
                            <select class="form-select" name="dauth" required>
                                <option value="" selected>Select Authority</option>
                                <option>London</option>
                                <option>Bermingham</option>
                                <option>Ireland</option>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Gender</label>
                            <select class="form-select" name="dgender">
                                <option value="" selected>Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Transgender</option>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Language</label>
                            <select class="form-select" name="dlang">
                                <option value="" selected>Select Language</option>
				<?php
                                $lsql=mysqli_query($connect,"SELECT * FROM `language`");
                                while($lrow = mysqli_fetch_array($lsql)){
                                    ?>
                                <option><?php echo $lrow['language'] ?></option>
				<?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Picture</label>
                            <input type="file" class="form-control" name="dpic">
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Post Code</label>
                            <input type="text" class="form-control" name="post_code" placeholder="xxxxx">
                        </div>
                        <div class="mb-3 col-lg-6">
                            <label class="form-label">Address</label>
                            <textarea class="form-control" rows="3" name="address"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-danger" data-bs-dismiss="modal">
                        <i class="ti ti-circle-x"></i>
                        Cancel
                    </a>
                    <button type="submit" class="btn ms-auto btn-success">
                        <i class="ti ti-user-plus"></i>
                        Save Driver
                    </button>
                </div>
            </form>
            <script>
    function validateForm() {
        var dnameInput = document.getElementsByName("dname")[0].value;	
        var demailInput = document.getElementsByName("demail")[0].value;        	
        var dphoneInput = document.getElementsByName("dphone")[0].value;			
        var dauthInput = document.getElementsByName("dauth")[0].value;		      	
        if (dnameInput === "" || demailInput === "" || dphoneInput === "" || dauthInput === "" ) {	
            alert("Please fill in all required fields.");           	
            return false;	
        }
        return true;
    }
            </script>
        </div>
    </div>
</div>
<?php
include('footer.php');
?>