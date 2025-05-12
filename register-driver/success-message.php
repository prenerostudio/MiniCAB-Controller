<?php
include('config.php');
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>            
        <meta charset="utf-8">      
        <title>Driver Registration Form | Minicaboffice.com</title>      
        <link rel="stylesheet" href="css/style.css">   
    </head>
    <body>
        <div class="wrapper">
            <?php
            session_start();
            if(isset($_SESSION['success_msg'])){
                echo '<h4 style="color: #58B860; margin-top: 30px; font-size: 24px; line-height: 1.5" align="center"> '.$_SESSION['success_msg'].' </h4>';
                unset($_SESSION['success_msg']);
                }
            ?>
            <div align="center" style="margin-top: 50px; line-height: 2.5">
                <a href="index.php">
                    <button class="btn">Click Here to continue</button>
                </a>
            </div>
        </div>       
    </body>
</html>