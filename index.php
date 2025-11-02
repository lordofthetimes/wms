<?php
session_start();
require('php/connection.php');
include('php/functions.php');

checkSession($con);

$stored = $con->query("SELECT si.quantity,si.storedID, i.itemName,iT.itemType, b.address, l.row,l.shelf FROM item i JOIN storeditems si ON i.itemID = si.itemID JOIN location l ON si.locationID=l.locationID JOIN itemtypes iT on i.itemType = iT.typeID JOIN building b ON b.buildingID = l.buildingID ");

if(isset($_GET['change'])){
    $query = $con->prepare("SELECT * FROM storeditems WHERE storedID = ? LIMIT 1");
    $query->bind_param("i",$_GET['change']);
    $query->execute();
    $edit = $query->get_result()->fetch_assoc();
}

if(isset($_GET['add'])){

    $results = $con->query("SELECT b.address, l.locationID, l.row, l.shelf FROM building b JOIN location l ON b.buildingID = l.buildingID ORDER BY b.address ASC, l.row ASC;")->fetch_all(MYSQLI_ASSOC);

    $locationsGroup = [];
    foreach($results as $location){
        $address = $location['address'];
        $locationID = $location['locationID'];
        $row = $location['row'];
        $shelf = $location['shelf'];

        if (!isset($locationsGroup[$address])) {
            $locationsGroup[$address] = [];
        }

        $locationsGroup[$address][] = [
            'locationID' => $locationID,
            'row' => $row,
            'shelf' => $shelf
        ];
    }
    $items = $con->query("SELECT * FROM item")->fetch_all(MYSQLI_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['locationID'], $_POST['itemID'], $_POST['quantity']) ){
        $locationID = $_POST['locationID'];
        $itemID = $_POST['itemID'];
        $quantity = $_POST['quantity'];

        $query = $con->prepare("INSERT INTO storeditems(locationID,itemID,quantity) VALUES(?,?,?)");
        $query->bind_param("iii", $locationID,$itemID,$quantity);

        if ($query->execute()) {
            header("Location: index.php?status=added");
            exit;
        }

    }
    else if (isset($_POST['locationID'], $_POST['quantity'])) {
        $locationID = $_POST['locationID'];
        $quantity = $_POST['quantity'];
        if($quantity == 0){
            $query = $con->prepare("DELETE FROM storeditems WHERE locationID = ?");
            $query->bind_param("i", $locationID);
        }else{
            $query = $con->prepare("UPDATE storeditems SET quantity = ? WHERE locationID = ?");
            $query->bind_param("ii", $quantity, $locationID);
        }
        

        if ($query->execute()) {
            header("Location: index.php?status=updated");
            exit;
        }
    }
}

$con->close();
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
    <?php 
    getNav();
    if(isset($_GET['change'])){
    ?>
        <div id="update">
            <form action="index.php" method="post">
                <h1>Update Quantity</h1>
                <input type="hidden" name="locationID" value="<?= $edit['locationID'] ?>">
                <div>
                    <label for="quantity">QUantity:</label>
                    <input type="number" id="quantity" name="quantity" placeholder="Quantity" required>
                </div>
                <button type="submit">Update</button>
            </form>
        </div>
    <?php
        }
    if(isset($_GET['add'])){
    ?>
        <div id="update">
            <form action="index.php" method="post">
                <h1>Add new entry</h1>
                
                <div>
                    <label for="itemID">Item:</label>
                    <select name="itemID" id="itemID" required>
                        <?php
                        foreach($items as $item){
                            echo "<option value='".$item['itemID']."'>".$item['itemName']."</option>";
                        }
                        ?>
                    </select>
                </div>

                <div>
                    <label for="locationID">Location:</label>
                    <select name="locationID" id="locationID" required>
                        <?php
                        foreach($locationsGroup as $address => $locations){
                            echo "<optgroup label=\"".$address."\">";
                            foreach($locations as $location){
                                echo "<option value='".$location['locationID']."'> Row ".$location['row']." | Shelf ".$location['shelf']."</option>";
                            }
                            echo "</optgroup>";
                        }
                        ?>
                    </select>
                </div>

                <div>
                    <label for="quantity">QUantity:</label>
                    <input type="number" id="quantity" name="quantity" placeholder="Quantity" value="<?= $edit['quantity'] ?>" required>
                </div>

                <button type="submit">Add</button>
            </form>
        </div>
    <?php
        }
    ?>
    <button onClick="location.href = 'index.php?add=true'">Add new entry</button>
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
            echo "<td> <button onclick=\"location.href='index.php?change=".$record['storedID']."'\">Change</button> </td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>