<style>
table{table-layout: auto | fixed;}
td{white-space: nowrap; overflow:hidden;word-break:break-all;} /*防止换行*/ 
</style>

<?php
include ("conn.php");
mysqli_query($conn, "set names utf8");
$name=$_GET['name'];

$index = 0;// 主键索引
$query1 = "desc $name"; // 显示列属性
$res1 = mysqli_query( $conn, $query1);
$row1 = mysqli_num_rows($res1);
// 输出表头
echo '<table border="1" width="700" align="center">';
echo "<tr>";
for ($i = 0; $i < $row1; $i++)
{
    $dbrow1 = mysqli_fetch_array($res1);
    $attr = $dbrow1['Field'];
    echo "<th>";
    echo "$attr";
    echo "</th>";
}
echo "</tr>";

$procedure = array(
    'purchases' => 'show_pur',
    'customers' => 'show_cus',
    'employees' => 'show_emp',
    'products' => 'show_prod',
    'suppliers' => 'show_suppli',
    'logs' => 'show_log'
);
$query2 = "call " . $procedure["$name"] . "()";
echo $query2;
$res2 = mysqli_query( $conn, $query2);
$row2 = mysqli_num_rows($res2);

// 输出内容
if ($row2)
{
    for ($i = 0; $i < $row2; $i++)
    {
        $dbrow2 = mysqli_fetch_array($res2);
        echo "<tr>";
        for ($j = 0; $j < $row1; $j++)
        {
            if ($dbrow2[$j] == NULL)
            {
                echo "<td>"."NULL"."</td>";
            }   
            else
            {
                echo "<td>" . $dbrow2[$j] . "</td>";
            }
        }
        echo "</tr>";
    }
}
echo "</table>";
?>