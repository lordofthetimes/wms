<?php
session_start();
require('php/connection.php');
include('php/functions.php');

checkSession($con);

$items = $con->query("SELECT i.itemID,i.itemName,t.itemType FROM item i join itemtypes t on i.itemType = t.typeID ORDER BY i.itemID")->fetch_all(MYSQLI_ASSOC);

if(isset($_GET['add'])){
    $types = $con->query("SELECT * FROM itemtypes")->fetch_all(MYSQLI_ASSOC);
}
if(isset($_GET['edit'])){
    $query = $con->prepare("SELECT * FROM item WHERE itemID = ? LIMIT 1");
    $query->bind_param("i",$_GET['edit']);
    $query->execute();
    $edit = $query->get_result()->fetch_assoc();
    $types = $con->query("SELECT * FROM itemtypes")->fetch_all(MYSQLI_ASSOC);
}

if(isset($_GET['delete'])){
    $query = $con->prepare("DELETE FROM item WHERE itemID = ?");
    $query->bind_param("i", $_GET['delete']);

    if ($query->execute()) {
        header("Location: items.php?status=deleted");
        exit;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $itemID = $_POST['itemID'];
    $name = $_POST['name'];
    $typeID = $_POST['typeID'];
    if($name && $typeID && $itemID){
        $query = $con->prepare("UPDATE item SET itemName = ?, itemType = ? WHERE itemID = ?");
        $query->bind_param("sii", $name, $typeID, $itemID);

        if($query->execute()){
            header("Location: items.php?status=updated");
            exit;
        }
    }
    else if($name && $typeID){
        $query = $con->prepare("INSERT INTO item(itemName,itemType) VALUES(?,?)");
        $query->bind_param("si",$name,$typeID);

        if($query->execute()){
            header("location: items.php?status=added");
            exit;
        }
    }

}
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
    <?php
    getNav();
    if(isset($_GET['edit'])){
    ?>
        <div id="update">
            <form action="items.php" method="post">
                <h1>Update Item</h1>
                <input type="hidden" name="itemID" value="<?= $edit['itemID'] ?>">
                <div>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" placeholder="Name"  value="<?php echo $edit['itemName']?>"  required>
                </div>
                <div>
                    <label for="typeID">Type:</label>
                    <select name="typeID" id="typeID" required>
                        <?php
                        foreach($types as $type){
                            echo "<option value='".$type['typeID']."'";
                            if($type['typeID'] == $edit['itemType']){
                                echo " selected ";
                            }
                            echo ">".$type['itemType']."</option>";
                        }
                        ?>
                    </select>
                </div>
                <button type="submit">Update</button>
            </form>
        </div>
    <?php
        }
    if(isset($_GET['add'])){
    ?>
        <div id="update">
            <form action="items.php" method="post">
                <h1>Add Item</h1>
                <div>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" placeholder="Name" required>
                </div>
                <div>
                    <label for="typeID">Type:</label>
                    <select name="typeID" id="typeID" required>
                        <?php
                        foreach($types as $type){
                            echo "<option value='".$type['typeID']."'>".$type['itemType']."</option>";
                        }
                        ?>
                    </select>
                </div>
                <button type="submit">Add</button>
            </form>
        </div>
    <?php
        }
    ?>
    
    <button id="add" onClick="location.href = 'items.php?add=true'">Add new location</button>
    <table>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Type</td>
            <td>Change</td>
            <td>Delete</td>
        </tr>
        <?php
        foreach($items as $items){
            echo "<tr>";
            echo "<td>".$items['itemID']."</td>
            <td>".$items['itemName']."</td> 
            <td>".$items['itemType']."</td>";
            echo "<td> <button onclick=\"location.href='items.php?edit=".$items['itemID']."'\">Change</button> </td>";
            echo "<td> <button onclick=\"location.href='items.php?delete=".$items['itemID']."'\">Delete</button> </td>";
            echo "</tr>";
        }
        ?>
    </table>

</body>
</html>