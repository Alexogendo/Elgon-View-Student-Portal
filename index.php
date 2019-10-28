<?php
/**
 * FILE TITLE: INDEX.PHP
 * This program is a website demo for a fictitious charity 'Students Page', featuring a volunteer registration with email verification app. PHP mailer is used.  TO INVOKE THE WORKING PORTION OF THIS APP PLEASE REGISTER AS A VOLUNTEER to test the registration, validation, verification, reset, signin and signout files. You will need a valid email address and may need to check the junk folder for a verification email from 'Community Cupboard.' Just follow the links and instructions provided. 
 * 
 *
 *
 */
				//session_start();
				// require_once 'class.user.php';
				// $user_login = new USER();

				// 		// include phpmailer class
				// 		require_once 'mailer/class.phpmailer.php';
				// 		// creates object
				// 		$mail = new PHPMailer(true);

				// 		//if the user is logged in already go straight to the home page
				// 		if($user_login->is_logged_in()!="")
				// 		{
				// 			$user_login->redirect('home.php');
				// 		}

				// 				if(isset($_POST['btn-login']))
				// 				{
				// 					$email = trim($_POST['txtemail']);
				// 					$upass = trim($_POST['txtupass']);

				// 					if($user_login->login($email,$upass))
				// 					{
				// 						$user_login->redirect('home.php');
				// 					}
				// 				}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="Charity Organization" content="Demo of homepage with signup/sign in and email verification">

    <title>Elgon View Student Portal</title>

    <!-- Bootstrap Core CSS -->
     <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="color: white; background-color: #2e86c1">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>    
                <a class="navbar-brand" href="#">
                    <div style="width: 150px; height: 50px; color:#fff; background: #2e86c1; text-align: center; 
                    padding: 15px 0px; margin-top: -17px">Home </div>
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color:#2e86c1; color: white">
                <ul class="nav navbar-nav">
                <li>
                        <a href="#">Courses</a>
                    </li>
                    <li>
                        <a href="#">About Us</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact Us</a>
                </li>
        
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
<h1 style="color:#2e86c1"> Elgon View College<span id= "header_subtitle" style="color:#2e86c1"> Students Portal.</span></h1>
        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded" src="css/girl.jpg" alt="">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
               

<div id="login">
<div class="container">
<!--form for sign in or sign up-->
    <div class="col-md-4">
    <form class="form-signin" method="post">
    <?php
    if(isset($_GET['inactive']))
    {
        ?>
        <div class='alert alert-danger'>
                <button class='close' data-dismiss='alert'>&times;</button>
                <strong>Sorry!</strong> This Account is not Activated. <br> Go to your Inbox and Activate it.
        </div>
        <?php
    }
    ?>
        <?php
        if(isset($_GET['error']))
        {
            ?>
            <div class='alert alert-success'>
                <button class='close' data-dismiss='alert'>&times;</button>
                <strong>Sorry, we can't find that account.<br> Try again.</strong>
            </div>
            <?php
        }
        ?>
        <h3 class="form-signin-heading">Student Sign In.</h3><hr />
        <input type="email" class="input-block-level" placeholder="Email address" name="txtemail" />
        <input type="password" class="input-block-level" placeholder="Password" name="txtupass" />
     <br><br>
        <button class="btn btn-large btn-primary" type="submit" name="btn-login">Sign in</button>
        <a href="#" button class="btn btn-large btn-primary" >Register a now</button> </a>  
       <!-- <a href="signup.php" class="btn btn-large">Register As A Volunteer</a><hr />-->
     <br><br>
        <a href="#" style= "font-weight: bold; color: green">Forgot your Password ? </a>
     </form>
   </div>
 </div> <!-- /container -->
</div>  
</div>      

        <hr>

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
              <hr> 
                </div>
            </div>
         </div>
        <!-- /.row -->

        <!-- Content Row -->
        <!-- /.col-md-3 -->
        <div class="row">
            <div class="col-md-3">
                <h3>Online Application</h3>
                <p>Fill in all mandatory fields (marked in *) on the form.
2. Pay the application fee via MPESA Paybill No: 698386 ACCOUNT NAME: Student Names and indicate the Mpesa confirmation code on the form.
N.B: The application fee for certificate and diploma level is ksh.1000.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-3 -->
            <div class="col-md-3">
                <h3>Our Staff</h3>
                <p>We wish to appreciate all Elgonview stakeholders and our staff<br>Who are committed to deliver and ensure that<br> our motto "Persuit for Excellence" is implemented</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-3 -->
            <div class="col-md-3">
                <h3>Our Courses</h3>
                <p>Certified ICT<br>
Certified ICT Part II<br>
Certified Information Communication Technology I<br>
CPA/CPS Part III:Section 5 or 6 <br>
Certificate Certified Credit Professionals (CCP)<br>
Dip. in Information Comm. Tech.(DICT)<br>

</p> <br>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-3 -->
            <div class="col-md-3">
                <h3>Contact Us</h3>
                <p>Location: Golf House, Near Gusii Studium
Tel No: 0712329727, 0711631653,0721157223 <br>
Email: infor@elgonviewcollege.ac.k</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-3 -->
        </div>
        </div>
        
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p style="margin-left: 38%; color:#2e86c1">
                Copyright &copy;Elgon View College <script>document.write(new Date().getFullYear());</script> | All rights reserved.
               
            </p>
                </div>
            </div>
        </footer>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
