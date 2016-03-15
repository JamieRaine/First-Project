<?php
error_reporting(E_ALL ^ E_DEPRECATED);
$con = mysql_connect("localhost","root"); //connects to the database on local host
if (!$con)
  {
  die('Could not connect: ' . mysql_error()); //if the connection is unsuccessful, an error message will be displayed
  }

mysql_select_db("convoy_truckers", $con);                               //connects to the convoy_truckers database

$sql="INSERT INTO payments (Booking_Ref, Amount_Due, Payment_Ref, 
Payment_Method, Date)
VALUES
('$_POST[Booking_Ref]', '$_POST[Amount_Due]','$_POST[Payment_Ref]', 
'$_POST[Payment_Method]', '$_POST[Date]')";

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