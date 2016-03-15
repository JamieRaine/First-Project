<?php
error_reporting(E_ALL ^ E_DEPRECATED);
$con = mysql_connect("localhost","root"); //connects to the database on local host
if (!$con)
  {
  die('Could not connect: ' . mysql_error()); //if the connection is unsuccessful, an error message will be displayed
  }

mysql_select_db("convoy_truckers", $con); //connects to the convoy_truckers database

$sql="INSERT INTO customer (Customer_ID, Customer_Name, Address, Email, Phone_Number)
VALUES
('$_POST[Customer_ID]', '$_POST[Customer_Name]','$_POST[Address]', '$_POST[Email]', '$_POST[Phone_Number]')";

// line 9-13 details the table and the columns in which to insert information.


if (!mysql_query($sql,$con)) // The execution of the code above
  {
  die('Error: ' . mysql_error());
  }
echo "Thank you for entering information needed";

mysql_close($con); //closes the connection to the database

header('Location: ' . $_SERVER['HTTP_REFERER']); // this allows the user to stay on the same page after entering the informtion into the database
exit;
?> 