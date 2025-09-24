<?php
include('header.php');
$user_id = $_GET['user_id'];
$usql=mysqli_query($connect,"SELECT users.*, countries.*, user_page_access.* FROM users JOIN countries ON users.country_id = countries.country_id JOIN user_page_access ON user_page_access.user_id = users.user_id WHERE users.user_id = '$user_id'");											
$urow = mysqli_fetch_array($usql);	
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
                    <div class="card">                
                        <div class="card-header">                    
                            <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">                        
                                <li class="nav-item">                            
                                    <a href="#tabs-profile" class="nav-link active" data-bs-toggle="tab">                                
                                        <i class="ti ti-user-scan"></i>                                
                                        User Profile                            
                                    </a>                        
                                </li>                        
                                <li class="nav-item">                            
                                    <a href="#tabs-document" class="nav-link" data-bs-toggle="tab">                                
                                        <i class="ti ti-calendar-user"></i>                               
                                        Permissions                            
                                    </a>                        
                                </li>			                                
                                <li class="nav-item">                           
                                    <a href="#tabs-activity" class="nav-link" data-bs-toggle="tab">
                                        <i class="ti ti-activity"></i>
                                        Activity Logs
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">                    
                            <div class="tab-content">                        
                                <div class="tab-pane active show" id="tabs-profile">                            
                                    <?php                            
                                    include('templates/users/user-profile-section.php');                            
                                    ?>                        
                                </div>                        
                                <div class="tab-pane" id="tabs-document">                            
                                    <?php                            
                                    include('templates/users/user-permissions.php');                            
                                    ?>                        
                                </div>                                                       		
                                <div class="tab-pane" id="tabs-activity">                            
                                    <?php                            
                                    include('templates/users/user-activity-logs.php');                            
                                    ?>                        
                                </div>                    
                            </div>                
                        </div>            
                    </div>                             	
                </div>
            </div>	
        </div>	
    </div>
</div>       
<?php
include('footer.php')
?>