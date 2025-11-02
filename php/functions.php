<?php
require('connection.php');
function getNav(){
    echo "<nav>
        <div>
            <button onclick=\"location.href='index.php'\">Stock</button>
            <button onclick=\"location.href='locations.php'\">Locations</button>
            <button onclick=\"location.href='items.php'\">Items</button>
            <button onclick=\"location.href='employees.php'\">Employees</button>
            <button id='logout' onclick=\"location.href='logout.php'\">Log out</button>
        </div>
    </nav>";
}
function checkSession($con){
    if(isset($_SESSION["userID"])){
        $id = $_SESSION["userID"];
        
        $query = $con->prepare("SELECT * FROM users WHERE userID = ? LIMIT 1");
        $query->bind_param("i", $id);
        $query->execute();
        $result = $query->get_result(); 

        if($result && mysqli_num_rows($result) > 0){
            return $result->fetch_assoc();
        }
    }
    else{
        header("location: login.php");
    }
}
?>