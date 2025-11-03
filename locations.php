<?php
session_start();
require('php/connection.php');
include('php/functions.php');

$user = checkSession($con);

$buildingSelected = 11;

if(isset($_GET['building'])){
    $buildingSelected = $_GET['building'];
}
if(isset($_GET['edit'])){
    $query = $con->prepare("SELECT * FROM location WHERE locationID = ? LIMIT 1");
    $query->bind_param("i",$_GET['edit']);
    $query->execute();
    $edit = $query->get_result()->fetch_assoc();    
}

if(isset($_GET['delete'])){
    $query = $con->prepare("DELETE FROM location WHERE locationID = ?");
    $query->bind_param("i", $_GET['delete']);

    if ($query->execute()) {
        header("Location: locations.php?status=deleted&building=".$buildingSelected);
        exit;
    }
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $locationID = $_POST['locationID'];
    $row = $_POST['row'];   
    $shelf = $_POST['shelf'];
    $buildingID = $_POST['buildingID'];
    if($locationID && $row && $shelf){

        $query = $con->prepare("UPDATE location SET row = ?, shelf = ? WHERE locationID = ?");
        $query->bind_param("ssi", $row, $shelf, $locationID);

        if ($query->execute()) {
            header("Location: locations.php?status=update&building=".$buildingSelected);
            exit;
        }else {
            header("Location: locations.php?status=invalidInput&building=".$buildingSelected);
            exit;
        }
    }
    else if($buildingID && $row && $shelf){
        $query = $con->prepare("INSERT INTO location(buildingID,row,shelf) VALUES(?,?,?)");
        $query->bind_param("iss", $buildingID, $row, $shelf);

        if ($query->execute()) {
            header("Location: locations.php?status=add&building=".$buildingSelected);
            exit;
        }
    }
}

$buildings = $con->query("SELECT buildingID,address FROM building")->fetch_all(MYSQLI_ASSOC);

$query = $con->prepare("SELECT * FROM location WHERE buildingID = ? ORDER BY row + 0 ASC, shelf + 0 ASC");
$query->bind_param("i",$buildingSelected);
$query->execute();
$locations = $query->get_result()->fetch_all(MYSQLI_ASSOC);

$con->close();
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
    <?php 
    getNav();
    if(isset($_GET['edit'])){
    ?>
        <div id="update">
            <form action="locations.php?building=<?= $buildingSelected ?>" method="post">
                <h1>Update Location</h1>
                <input type="hidden" name="locationID" value="<?= $edit['locationID'] ?>">
                <div>
                    <label for="row">Row:</label>
                    <input type="text" id="row" name="row" placeholder="Row" value="<?= $edit['row'] ?>" required>
                </div>
                <div>
                    <label for="shelf">Shelf:</label>
                    <input type="text" id="shelf" name="shelf" placeholder="Shelf" value="<?= $edit['shelf'] ?>" required>
                </div>
                <button type="submit">Update</button>
            </form>
        </div>
    <?php
        }
    if(isset($_GET['add'])){
    ?>
        <div id="update">
            <form action="locations.php?building=<?= $buildingSelected ?>" method="post">
                <h1>Add Location</h1>
                <input type="hidden" name="buildingID" value="<?= $buildingSelected?>">
                <div>
                    <label for="row">Row:</label>
                    <input type="text" id="row" name="row" placeholder="Row" required>
                </div>
                <div>
                    <label for="shelf">Shelf:</label>
                    <input type="text" id="shelf" name="shelf" placeholder="Shelf" required>
                </div>
                <button type="submit">Add</button>
            </form>
        </div>
    <?php
        }
    ?>
    
    <button id="add" onClick="location.href = 'locations.php?add=true&building=<?php echo $buildingSelected?>'">Add new location</button>
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
                <td>Remove</td>
            </tr>
                <?php
            foreach($locations as $location){
                echo "<tr>";
                echo "<td>".$location['row']."</td>
                      <td>".$location['shelf']."</td>";
                echo "<td> <button onclick=\"location.href='locations.php?edit=".$location['locationID']."&building=".$buildingSelected."'\">Edit</button> </td>";
                echo "<td> <button onclick=\"location.href='locations.php?delete=".$location['locationID']."&building=".$buildingSelected."'\">Remove</button> </td>";
                echo "</tr>";
            }
            ?>
        </table>
        </div>
        <?php
        ?>
    </main>
</body>
</html>