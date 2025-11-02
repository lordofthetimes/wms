<?php
session_start();
require('php/connection.php');
include('php/functions.php');

checkSession($con);

$employees = $con->query("SELECT * FROM employees ORDER BY surname");

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Stock</title>
</head>
<body>
    <?php getNav() ?>
    <table>
        <tr>
            <td>Name</td>
            <td>Surname</td>
            <td>Position</td>
            <td>Phone</td>
            <td>E-Mail</td>
            <td>Birth Date</td>
        </tr>
        <?php
        foreach($employees as $employees){
            echo "<tr>";
            echo "<td>".$employees['name']."</td> 
            <td>".$employees['surname']."</td>
            <td>".$employees['position']."</td>
            <td>".$employees['phoneNumber']."</td>
            <td>".$employees['email']."</td>
            <td>".$employees['birthDate']."</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>