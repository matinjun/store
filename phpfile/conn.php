<?php
$severname = 'localhost:3308';
$username = 'root';
$password = '';
$database = 'store';

$conn = mysqli_connect($severname, $username, $password, $database);

if($conn === false) {
    echo "Error connecting to<br>";
    die("Connection failed: " . mysqli_connect_error());
}
?>