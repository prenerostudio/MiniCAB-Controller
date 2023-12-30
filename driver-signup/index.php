<!doctype html>

<html lang="en">
  
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Sign up - MiniCAB Taxi Service.</title>
    <script defer data-api="/stats/api/event" data-domain="preview.tabler.io" src="js/script.js"></script>
    
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
    <script src="js/demo-theme.min6a55.js?1695847769"></script>
    <div class="page page-center">
      <div class="container container-tight py-4">
        <div class="text-center mb-4">
          <a href="error-404.html" class="navbar-brand navbar-brand-autodark">
            <img src="../minicab/img/logo.png" style="width: 400px; height: 120px;" alt="MiniCAB Taxi Service" class="navbar-brand-image">
          </a>
        </div>
        <form class="card card-md" action="register-process.php" method="post" autocomplete="off" novalidate>
			
			<?php										
					session_start();										
					if(isset($_SESSION['success_msg'])){										
						echo '<h4 style="color:red; margin-top: 10px; font-size: 18px;" align="center"> '.$_SESSION['success_msg'].' </h4>';										
						unset($_SESSION['success_msg']);															
					}																				
					?>	
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Create new account</h2>
            <div class="mb-3">
              <label class="form-label">Name</label>
              <input type="text" class="form-control" name="d_name" placeholder="Enter Your Name" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Phone Number</label>
              <input type="email" class="form-control" name="d_phone" placeholder="Enter Phone Number" required>
            </div>
			   <div class="mb-3">
              <label class="form-label">Email address</label>
              <input type="email" class="form-control" name="d_email" placeholder="Enter Email">
            </div>
			   <div class="mb-3">
              <label class="form-label">Post Code</label>
              <input type="email" class="form-control" name="post_code" placeholder="Enter Post Code" required>
            </div>
            
            <div class="mb-3">
              <label class="form-check">
                <input type="checkbox" class="form-check-input"/ required>
                <span class="form-check-label">Agree the <a href="#" tabindex="-1">terms and policy</a>.</span>
              </label>
            </div>
            <div class="form-footer">
              <button type="submit" class="btn btn-primary w-100">Create new account</button>
            </div>
          </div>
        </form>
     
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="js/tabler.min.js" defer></script>
    <script src="js/demo.min.js" defer></script>
  </body>
</html>