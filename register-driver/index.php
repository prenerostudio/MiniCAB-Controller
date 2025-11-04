<?php
include('config.php');
?>

<!DOCTYPE html>

<html lang="en" dir="ltr">

    <head>            

        <meta charset="utf-8">      

        <title>Driver Registration Form | Minicaboffice.com</title>      

        <link rel="stylesheet" href="css/style.css">   

        <!-- Include SweetAlert2 -->

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    </head>   
    
    <body>				
    
        <a href="index.php">
        
            <img src="img/logo.png" class="center-image"  alt="MiniCAB Taxi Service" >
        
        </a>       	
        
        <div class="wrapper">						         					        				          
        
            <div class="title">            
            
                Driver Registration Form            
            
            </div>              
         
            


            <form id="driverRegisterForm" enctype="multipart/form-data">
    
                <div class="field">               
        
                    <input type="text" name="fname" required>               
        
                    <label>Full Name</label>            
    
                </div>                
    
                <div class="field">               
        
                    <input type="email" name="email" required>               
        
                    <label>Email Address</label>            
    
                </div>                
    
                <div class="field">               
        
                    <input type="text" name="phone" required>               
        
                    <label>Mobile Phone</label>            
    
                </div>                
    
                <div class="field">               
        
                    <input type="text" name="whatsapp" required>               
        
                    <label>Whatsapp</label>            
    
                </div>                            
    
                <div class="field">               
        
                    <input type="password" name="password" required>               
        
                    <label>Password</label>            
    
                </div>                
    
                <div class="field">               
        
                    <input type="text" name="pco" required>               
        
                    <label>TFL PCO Number</label>            
    
                </div>                                                             
    
                <div class="field" style="margin-bottom: 20px;">               
        
                    <p style="color: #999999; padding-left: 15px; padding-bottom: 5px;">When You Start Work?</p>
        
                    <select name="shift" required>
            
                        <option value="">Select Shift</option>
            
                        <option>Day Shift</option>
            
                        <option>Afternoon Shift</option>
            
                        <option>Night Shift</option>
        
                    </select>                                               
    
                </div>

                
    
                <div class="field" style="margin-bottom: 20px;">               
        
                    <p style="color: #999999; padding-left: 15px; padding-bottom: 5px;">Vehicle Type</p>
        
                    <select name="v_id" required>
            
                        <option value="">Select Vehicle</option>
            
                            <?php
            
                            $vsql = mysqli_query($connect, "SELECT * FROM `vehicles`");
            
                            while ($vrow = mysqli_fetch_array($vsql)){
            
                                ?>
                
                        <option value="<?php echo $vrow['v_id']; ?>"><?php echo $vrow['v_name']; ?></option>						
            
                            <?php } ?>
        
                    </select>                                               
    
                </div>                


                <div class="field">               
        
                    <input type="text" name="make" required>               
        
                    
                    <label>Make</label>            
    
                </div>


                <div class="field">               
        
                    <input type="text" name="model" required>               
        
                    <label>Model</label>            
    
                </div> 


                <div class="field" style="margin-bottom: 25px;">   
        
                    <p style="color: #999999; padding-left: 15px; padding-bottom: 5px;">Post Code</p>
        
                    <select name="pcode" required>
            
                        <option value="">Select PostCode</option>
            
                            <?php
            
                            $psql=mysqli_query($connect,"SELECT * FROM `post_codes`");                               
            
                            while($prow = mysqli_fetch_array($psql)){                                   
            
                                ?>
                
                        <option><?php echo $prow['pc_name']; ?></option>				
            
                            <?php } ?>
        
                    </select> 
    
                </div>   
                                          

                <div class="field" style="margin-bottom: 30px; margin-top: 40px; width: 100%;">               
        
                    <input type="submit" name="register-driver" value="Register Driver">         
                </div>                                   
            </form>       
            <script>
                document.getElementById('driverRegisterForm').addEventListener('submit', function (e) {
                    e.preventDefault();

                    let form = this;
                    let formData = new FormData(form);

                    fetch('register-process.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Registration Successful!',
                                text: data.message,
                                confirmButtonText: 'OK'
                            }).then(() => {
                                form.reset();
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: data.message
                            });
                        }
                    })
                    .catch(error => {
                        Swal.fire({
                            icon: 'error',
                            title: 'Server Error!',
                            text: 'Something went wrong. Please try again later.'
                        });
                        console.error('Error:', error);
                    });
                });
            </script>  
        </div>   
    </body>
</html>