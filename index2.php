<?php
	include 'login.php';
	if (!empty($_SESSION['login_user'])){
		header("location: profile.php?user=".$_SESSION['login_user']);
		exit();
	}
	$error = $_GET['error'];
	$error = stripslashes($_GET['error']);
	$error = mysql_real_escape_string($_GET['error']);
	$error = strip_tags($_GET['error']);
	echo "<center>$error</center>";
?>

<!DOCTYPE html>
<html>
<head>
<title>Elgon View tudent</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/media.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link href="https://fonts.googleapis.com/css?family=Fjalla+One|Maitree|Ropa+Sans" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery.js"></script>
<script src="js/main.js"></script>
<style>
.msg-alert{
  display: none;
  position: fixed;
  left: 50%;
 -ms-transform: translate(-50%);
  transform: translate(-50%); 
  bottom:0;
  z-index: 9999;
}

.msg-alert p{
  font-family: calibri;
  border-radius: 5px 5px 0px 0px;
  padding: 5px 8px;
  font-size: 20px;
  color: white;
}
</style>
</head>

<body id="home" style="background-color: fff">
	<div class="msg-alert"><p></p></div>
	<div class="cssload-loader">
	<div class="cssload-flipper">
		<div class="cssload-front"></div>
		<div class="cssload-back"></div>
	</div><br/>
	<center><span id="loading">Loading</span></center>
	</div>

	<div class="clr-switch"></div>
	<div class="bubble-1"></div>
	<div class="bubble-2"></div>
	<div class="bubble-3"></div>
	
	<div id="login-form">
	<input type="radio" id="login" name="switch" class="hide" checked>
	<input type="radio" id="signup" name="switch" class="hide">
	<div>
		<ul class="form-header">
		<li><label for="login"><i class="material-icons">lock</i> LOGIN</li>
		<li><label for="signup"><i class="material-icons">credit_card</i> REGISTER</label></li>
		</ul>
	</div>

	<div class="section-out">
		<section class="login-section">
			<div class="login">
				<form id="form_login" name="form_login" action="login.php" method="post">
					<ul class="ul-list">
						<li><input type="email" id="log_email" name="log_email" required class="input" placeholder="Email Address" required="" /><span class="icon"><i class="material-icons">local_post_office</i></span></li>

						<li><input type="password" id="log_passwd" name="log_passwd" required class="input" minlength="4" maxlength="32" placeholder="Your Password" required="" /><span class="icon"><i class="material-icons">lock</i></span></li>

						<li><input type="submit" id="submit" name="submit" value="Sign in" class="btn"></li>

						<!-- <li><input type="button" value="Sign in with Facebook" class="btn fb" onclick="login()"></li> -->

						<li><input type="button" value="Close" class="btn close"></li>

						<span class="errorTxt"></span>
						<div id="status"></div>
					</ul>
				</form>
			</div>	<!-- login -->
		</section>

		<section class="signup-section">
			<div class="login">
				<form id="form_signup" name="form_signup" action="signup.php" method="post">
					<ul class="ul-list">
						<li><input type="radio" id="student" name="check-type" onchange="check_type()" value="student" checked> Student&emsp;&emsp;<input type="radio" id="comp" name="check-type" value="company" onchange="check_type()"> Tutor</li>

						<li><input type="text" required pattern="^[a-zA-Z ]+$" class="input" id="reg_name" name="reg_name" maxlength="32" placeholder="Student Name"/><span class="icon"><i class="material-icons">account_box</i></span></li>

						<li><input type="text" required class="input" id="reg_uname" name="reg_uname" pattern="^[a-z\d\.]{5,}$" placeholder="User Name" onchange="check_user()"/><span class="icon"><i class="material-icons">person</i></span></li>

						<li><input type="email" required class="input" id="reg_email" name="reg_email" placeholder="Email Address"/><span class="icon"><i class="material-icons">local_post_office</i></span></li>

						<li><input type="password" required class="input" id="reg_passwd" name="reg_passwd" placeholder="Password"/><span class="icon"><i class="material-icons">lock</i></span></li>

						<li><input type="password" required="" class="input" id="c_password" name="c_password" placeholder="Confirm Password"/><span class="icon"><i class="material-icons">lock</i></span></li>
						<li><label>By signing up, you agree to our Terms of Service</label></li>

						<li><input type="submit" id="signup-btn" value="Sign up" class="btn"></li>

						<!-- <li><input type="button" value="Contiue using Facebook" class="btn fb" onclick="login()"></li> -->

						<li><input type="button" value="Close" class="btn close"></li>
					</ul>					
					<script type="text/javascript">
						function check_type(){
							if ($("#student").is(":checked")){
								$("input#reg_name").prop("placeholder","Student Name");
								$("input#reg_name span i").text("account_box");
							}

							else if ($("#inst").is(":checked")){
								$("input#reg_name").prop("placeholder","Institute Name");
								$("input#reg_name span i").text("account_balance");	
							}
							else{
								$("input#reg_name").prop("placeholder","Tutor Name");
								$("input#reg_name span i").text("business_center");
							}
						}
					</script>

					<script type="text/javascript">
   					function check_user(){
   						var uname = $("#reg_uname").val();
   						$.ajax({
            				url: "check_user.php?username="+uname,
            				success: function(data){
            					$(".msg-alert p").html(data);
            					if (data == "Username Available"){
            						$(".msg-alert p").css("background-color","green");
            					}
            					else{
            						$(".msg-alert p").css("background-color","red");
            					}
            					$(".msg-alert").show(0,function(){
            						$(".msg-alert").delay(3000).fadeOut('slow');
            					});
             				}
          				});
					}
					</script>

				</form>
			</div>	<!-- login -->
		</section>
	</div>	<!-- section-out -->
	</div>	<!-- login-form -->

	<header>
		<div class="wrap-width">
		<a href="#home">
			<div class="navbar-logo">
				<img src="images/logo.jpg"/>
				<img id="hat" src="images/hat.png"/>
			</div> <!-- navbar-logo -->
		</a>
		<!--<a href="#nav"><i class="material-icons">reorder</i></a>-->
		<div class="horizontal-page-links" id="nav">

			<div class="register-user">
				<a id="register">Register</a>
				<a id="login">Login</a>
				<!--<a id="register" href="#register">Register</a>-->
			</div>	<!-- register-user -->
			
			<ul>	
				<div class="sliding-out links"><li><a href="index.php">Home</a></li></div>
				<div class="sliding-out links"><li><a href="#about">About </a></li></div>
				<div class="sliding-out links"><li><a href="#contact">Contact </a></li></div>
				<div class="last-navbar-link"><li></li></div>
			</ul>
			
		</div> <!-- horizontal-page-links -->
		</div>
	</header>
	
	<div class="content">	
	<!-- Welcome Page -->
	<div class="welcome wrap-width">
		<div class="empty-layout"></div>
		<center>
		<img class="welcome-image" src="images/img1.jpg">
		<p id="text-heading">Elgon View College Student Portal.</p>
		<div class="welcome-text">
			
			<p id="text-context">Elgon View Student Portal is a platform where students can view there school information <br>It allows upload of educational documents<br>by administrators which are further seen by both students and staff.</p>
			<a id="readmore" href="#about">Read More</a>
		</div> <!-- welcome-text -->
		</center>
	</div>	<!-- welcome -->

	<div class="link-container clearfix" style="background-color: #2e86c1">
		<div class="wrap-width">
			<!-- <a id="register">Sign Up Now</a> -->
			<p id="join" style="margin-left: 300px">Join the Elgon View Student - Join us and be a part of the success.</p></center>
		</div> 
	</div>	 <!-- link-container -->
	
	</div>
	<footer>
		<a href="#home"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></a>
		<div id="copyrights">
				<span class="siteName"> Copyright &copy;Elgon View College <script>document.write(new Date().getFullYear());</script> | All rights reserved.</span>
            </div><!--copyrights-->
	</footer>
<script async type="text/javascript">
		
  	function login(){
  	FB.login(function(response) {
  		if (response.status === 'connected') {
  
  			$("#login-form").hide();
  			$('.content, footer,header').css("pointer-events","auto");
  			$("a#login").html("Logout");
  			FB.api('/me', function(response) {
      			alert('Successful login for: ' + response.name);
    		});

  			setTimeout(dashboard, 1000); 
        function dashboard(){
            window.open("profile.php","_self");
        }

  			$("a#login").click(function(){
  				FB.logout(function(response) {
  					$("a#login").html("Login");
   					alert("logged out successfully.");
				});
  			});
        

  		} else {
    		// The person is not logged into your app or we are unable to tell.
      		document.getElementById('status').innerHTML = 'Please log ' +
        	'into this website.';
  		}
	});
  	}

  	// This function is called when someone finishes with the Login
  	// Button.  See the onlogin handler attached to it in the sample
  	// code below.
  	function checkLoginState() {
    	FB.getLoginStatus(function(response) {
     		statusChangeCallback(response);
    	});
  	}

  	window.fbAsyncInit = function() {
  		FB.init({
    		appId      : '732114246968740',
    		cookie     : true,  // enable cookies to allow the server to access the session
    		xfbml      : true,  // parse social plugins on this page
    		version    : 'v2.8' // use graph api version 2.8
  		});

  		FB.getLoginStatus(function(response) {
    		statusChangeCallback(response);
  		});
  	};

  	// Load the SDK asynchronously
  	(function(d, s, id) {
    	var js, fjs = d.getElementsByTagName(s)[0];
    	if (d.getElementById(id)) return;
    		js = d.createElement(s); js.id = id;
    		js.src = "//connect.facebook.net/en_US/sdk.js";
    		fjs.parentNode.insertBefore(js, fjs);
  	}(document, 'script', 'facebook-jssdk'));

	</script>
	

<script defer src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script defer type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.12.0/additional-methods.js"></script>
<script defer src="js/animate.js"></script>

</body>

</html>