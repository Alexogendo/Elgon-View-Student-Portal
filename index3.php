<?php
	session_start();
	
	require("conection/connect.php");
	
	$msg="";
	if(isset($_POST['btn_log'])){
		$uname=$_POST['unametxt'];
		$pwd=$_POST['pwdtxt'];
		
		$sql="SELECT * FROM users_tbl WHERE username='$uname' AND password='$pwd' AND role='admin' ";
		$result = $connection->query($sql);
			
		if ($result->num_rows > 0) {
			 while($row = $result->fetch_assoc()) {
					if($row['type']=='admin')
						$msg="Logged in successfully!.....";	
					else
						header("location: everyone.php");
					
			}
			}
			else
					$msg="Invalid login authentication, try again!";
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css.map"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.css"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.css.map"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css"/>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css2/login.css" />
<title>Elgon View | College management System.</title>
<style type="text/css">
	a:hover{
		color: red;
	}
</style>
</head>

<body>

	<div class="container">
<div style="margin-left: -800px; margin-top: auto;">
	<a href="index.php" style="float: right; font-size: 18px; text-decoration: underline;">Home</a>
	<p style="margin-left: 280px; font-size: 20px; color: lightblue"><i>Persuit for Excellence</i></p>
		<img src="images2/rtupic.jpg" height="400" width="700">
	</div>
    	<div class="container2" style="margin-top: -290px;">

    		<div class="h1_pos">
    			
    			<h1 style="color: blue">College Login for Staff Only!</h1>
    		</div><br><br><br>
    		<form method="post">
                    <input type="text" class="form-control" name="unametxt" placeholder="Username" title="Enter username here" autocomplete="off" required="" /><br>
                    <input type="password" class="form-control" name="pwdtxt" placeholder="Password" title="Enter username here" autocomplete="off" required="" /><br>
    		<input type="submit" href="#" class="btn btn-default" name="btn_log" value="Sign in" style="float: right;"/>
    		<div class="about_pos">
                    <a href="#" style="text-decoration:none; color: silver">About management</a>
    		</div>
    		</form>
    	</div>
    	
	</div>
    </div>
	
        <h2 style="color: #3a28a5; text-align: center;">
            <?php echo $msg; ?>
        </h2>  

</body>
</html>