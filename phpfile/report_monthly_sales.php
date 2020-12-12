<?php
include ("conn.php");
$p_id = $_POST["p_id"];

$sql = "call report_monthly_sale($p_id)";
echo $sql;
$res = mysqli_query($conn, $sql);
$rownum = mysqli_num_rows($res);

echo "<table align='center' border='1'>";
// 首先输出表头
echo "<tr>";

$attr = array('pname', 'month', 'year', 'total qty', 'total price', 'avg');
$attrnum = 6;

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
?>