<?php
include "conn.php";

$c_name = $_POST['c_name'];
$query = "select cid from customers where '$c_name' = cname";
echo $query . "<br>";
$res = mysqli_query($conn, $query);
$row = mysqli_num_rows($res);

if(!$row) {
    echo "customer not exists";
} else {
    $c_id = $res;
    $query = "select cname, pname, qty, total_price, ptime from customers, products, purchases
     where cname = '$c_name' and purchases.cid=customers.cid and purchases.pid=products.pid";
    echo $query;
    $res = mysqli_query($conn, $query);
    $rownum = mysqli_num_rows($res);

    echo "<table align='center' border='1'>";
    // 首先输出表头
    echo "<tr>";

    $attr = array('cname', 'pname', 'qty', 'total_price', 'ptime');
    $attrnum = 5;

    for ($i = 0; $i < $attrnum; $i = $i + 1) {
        echo "<th>";
        echo $attr[$i];
        echo "</th>";
    }

    echo "</tr>";
    // 输出表格
    for ($i = 0; $i < $rownum; $i = $i + 1) {
        $rowcontent = mysqli_fetch_array($res);
        // 输出某一行的内容
        echo "<tr>";
        for ($j = 0; $j < $attrnum; $j++) {
            echo "<td>" . $rowcontent[$j] . "</td>";
        }
        echo "</tr>";
    }

    echo "</table>";
}

?>