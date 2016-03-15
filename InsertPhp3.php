<?php
error_reporting(E_ALL ^ E_DEPRECATED);
$con = mysql_connect("localhost","root"); //connecting to database
if (!$con)
  {
  die('Could not connect: ' . mysql_error()); //if connection is unsuccessful it give a message 'could not connect'
  }

mysql_select_db("convoy_truckers", $con); //tells which database that you want to work with

$sql1="INSERT INTO bookings (Vehicle_ID, Date_From, Date_To, Booking_Ref, Driver_Required, Driver_ID, Additional_Details, Customer_ID)
VALUES
('$_POST[Vehicle_ID]', '$_POST[Date_From]','$_POST[Date_To]', '$_POST[Booking_Ref]', '$_POST[Driver_Required]', '$_POST[Driver_ID]', '$_POST[Additional_Details]', '$_POST[Customer_ID]')";

    
   
if (!mysql_query($sql1,$con)) //this executes all the code above for the sql statement
  {
  die('Error: ' . mysql_error());
  }

 
 
echo "Thank you for entering information needed";

mysql_close($con); //closing connection to database

header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;
?> 