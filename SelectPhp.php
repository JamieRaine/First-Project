<?php
error_reporting(E_ALL^E_DEPRECATED);
$con = mysql_connect("localhost","root"); //connects to the database on local host
if (!$con)
  {
  die('Could not connect: ' . mysql_error()); //if the connection is unsuccessful, an error message will be displayed
  }

mysql_select_db("convoy_truckers", $con); //connects to the convoy_truckers database

$result = mysql_query("SELECT * FROM bookings"); //Selects all the information from the bookings table within the database

echo "<table border='1'> 
<tr> 
<th>Booking_Ref</th>
<th>Customer_ID</th>
<th>Date_From</th>
<th>Date_To</th>
<th>Driver_Required</th>
<th>Driver_ID</th>
<th>Vehicle_ID</th>
<th>Additional_Details</th>
</tr>";

while($row = mysql_fetch_array($result)) //executes a while loop to loop over the information contained within the selected table
  {
  echo "<tr>";
  echo "<td>" . $row['Booking_Ref'] . "</td>";
  echo "<td>" . $row['Customer_ID'] . "</td>";
  echo "<td>" . $row['Date_From'] . "</td>";
   echo "<td>" . $row['Date_To'] . "</td>";
   echo "<td>" . $row['Driver_Required'] . "</td>";
   echo "<td>" . $row['Driver_ID'] . "</td>";
   echo "<td>" . $row['Vehicle_ID'] . "</td>";
   echo "<td>" . $row['Additional_Details'] . "</td>";
  echo "</tr>";
  }
echo "</table>";

mysql_close($con); //closes the connection to the database
?> 

<!DOCTYPE html> 
<html lang="en">
<head>
<title> Selection </title>
<meta http-equiv="content-type" content="text/html; charset=UTF8"/>
<link rel="stylesheet" type="text/css" href="css/project.css"> 

<ul style="list-style-type:none">
	<li><a href="homePage.html">Return to Homepage</a> </li><br>
</head>
</html>

<!-- line 43-53 inserts css into the select file and provides a link back to the home page -->
