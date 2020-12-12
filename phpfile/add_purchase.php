<?php
include("conn.php");
$pur_no = $_POST['pur_no'];
$c_id = $_POST['c_id'];
$e_id = $_POST['e_id'];
$p_id = $_POST['p_id'];
$pur_qty = $_POST['pur_qty'];

$sql = "call add_purchase($pur_no, '$c_id', '$e_id', '$p_id', $pur_qty)";
echo $sql;
$res = mysqli_query($conn, $sql);
if($res) {
    echo "successful!";
} else {
    echo "something wrong happens!";
}
?>