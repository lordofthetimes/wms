<?php
session_start();
require('php/connection.php');
include('php/functions.php');

checkSession($con);

$items = $con->query("SELECT i.itemID,i.itemName,t.itemType FROM item i join itemtypes t on i.itemType = t.typeID ORDER BY i.itemID")->fetch_all(MYSQLI_ASSOC);

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Items</title>
</head>
<body>
    <?php getNav() ?>
    <table>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Type</td>
        </tr>
        <?php
        foreach($items as $items){
            echo "<tr>";
            echo "<td>".$items['itemID']."</td>
            <td>".$items['itemName']."</td> 
            <td>".$items['itemType']."</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>