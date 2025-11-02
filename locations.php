<?php
session_start();
require('php/connection.php');
include('php/functions.php');

$user = checkSession($con);

$buildingSelected = 11;

if(isset($_GET['building'])){
    $buildingSelected = $_GET['building'];
}
$buildings = $con->query("SELECT buildingID,address FROM building")->fetch_all(MYSQLI_ASSOC);

$query = $con->prepare("SELECT * FROM location WHERE buildingID = ? ORDER BY row + 0 ASC, shelf + 0 ASC");
$query->bind_param("i",$buildingSelected);
$query->execute();
$locations = $query->get_result()->fetch_all(MYSQLI_ASSOC);

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Locations</title>
</head>
<body>
    <?php getNav() ?>
    <main id="locations">
        <aside>
            <?php
            foreach($buildings as $building){
                echo "<button ";
                if($building['buildingID'] == $buildingSelected){
                    echo "class=\"selected\"";
                }
                echo" onclick=\"location.href='locations.php?building=".$building['buildingID']."'\">"
                .$building['address']."</button>";
            }
            ?>
        </aside>
        <div>
            <table>
            <tr>
                <td>Row</td>
                <td>Shelf</td>
                <td>Edit</td>
                <td>Shelf</td>
            </tr>
            <?php
            foreach($locations as $location){
                echo "<tr>";
                echo "<td>".$location['row']."</td>
                      <td>".$location['shelf']."</td>";
                echo "<td> <button>Edit</button> </td>";
                echo "<td> <button>Remove</button> </td>";
                echo "</tr>";
            }
            ?>
        </table>
        </div>
    </main>
</body>
</html>