<?php
session_start();
require('php/connection.php');
include('php/functions.php');

checkSession($con);

$stored = $con->query("SELECT si.quantity, i.itemName,iT.itemType, b.address, l.row,l.shelf FROM item i JOIN storeditems si ON i.itemID = si.itemID JOIN location l ON si.locationID=l.locationID JOIN itemtypes iT on i.itemType = iT.typeID JOIN building b ON b.buildingID = l.buildingID ");



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
            <td>Type</td>
            <td>Building</td>
            <td>Row</td>
            <td>Shelf</td>
            <td>Amount</td>
            <td>Change</td>
        </tr>
        <?php
        foreach($stored as $record){
            echo "<tr>";
            echo "<td>".$record['itemName']."</td> 
            <td>".$record['itemType']."</td>
            <td>".$record['address']."</td>
            <td>".$record['row']."</td>
            <td>".$record['shelf']."</td>
            <td>".$record['quantity']."</td>";
            echo "<td> <button>Change</button> </td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>