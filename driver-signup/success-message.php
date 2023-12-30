<!doctype html>

<html lang="en">
  
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Sign up - MiniCAB Taxi Service.</title>
    <script defer data-api="/stats/api/event" data-domain="register.minicaboffice.com" src="js/script.js"></script>
    
    <link rel="icon" href="img/icon.png" type="image/x-icon"/>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon"/>
    
    <!-- CSS files -->
    <link href="css/tabler.min.css" rel="stylesheet"/>
    <link href="css/tabler-flags.min.css" rel="stylesheet"/>
    <link href="css/tabler-payments.min.css" rel="stylesheet"/>
    <link href="css/tabler-vendors.min.css" rel="stylesheet"/>
    <link href="css/demo.min.css" rel="stylesheet"/>
	
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
	
    
  </head>
  <body  class=" d-flex flex-column">
    <script src="js/demo-theme.min.js"></script>
    <div class="row g-0 flex-fill">
      <div class="col-12 col-lg-6 col-xl-4 border-top-wide border-primary d-flex flex-column justify-content-center">
        <div class="container container-tight my-5 px-lg-5">
          <div class="text-center mb-4">
            <a href="index.php" class="navbar-brand navbar-brand-autodark"><img src="img/logo.png" height="110" alt=""></a>
          </div>
			
			
          <h2 class="text-center mb-3">
            <?php										
					session_start();										
					if(isset($_SESSION['success_msg'])){										
						echo '<h4 style="color: #58B860; margin-top: 30px; font-size: 24px; line-height: 1.5" align="center"> '.$_SESSION['success_msg'].' </h4>';										
						unset($_SESSION['success_msg']);															
					}																				
					?>							
					<div align="center" style="margin-top: 50px; line-height: 2.5">						
						<a href="index.php">							
							<button class="btn d-block">Click Here to continue</button>							
						</a>													
																		      
					</div>        
          </h2>
          
         
        </div>
      </div>
      <div class="col-12 col-lg-6 col-xl-8 d-none d-lg-block">
        <!-- Photo -->
        <div class="bg-cover h-100 min-vh-100" style="background-image: url(img/ONZ7XS0.jpg)"></div>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="js/tabler.min.js" defer></script>
    <script src="js/demo.min.js" defer></script>
  </body>
</html>