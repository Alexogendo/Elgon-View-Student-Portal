<option value="select-deg">Select Degree</option>
<?php
	include 'config.php';
	session_start();
	error_reporting(0);
	$query = "select distinct sub_name from sub_tbl";
	            	   				$table = mysqli_query($connection,$query);
									if($table){
										$rows=mysqli_num_rows($table);
										if($rows > 0){
											for($x = 0; $x<= $row; $x++){
				    							$row = mysqli_fetch_assoc($table);
				    							if ($row){
		?>
						<option value="<?php echo $row['sub_id'];?>"><?php echo $row['sub_name'];?></option>
		<?php							
					}
				}
			}
		}
	?>