<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>all tables</title>
<style>
table{table-layout: auto | fixed;}
td{white-space: nowrap; overflow:hidden;word-break:break-all;} /*防止换行*/ 
</style>
</head>

<body>
<?php
include ("conn.php");
mysqli_query($conn, "set names utf8");
// $query = "select table_name from information_schema.tables where table_schema='$database'";
$query = 'show tables';
$res = mysqli_query( $conn, $query);
$row = mysqli_num_rows($res);

echo "<p style='text-align:center;font-size:25px'>retail system<br></p>";

echo "<table border='1' width='1090' align='center'>";
if($row)
{
    for($i=0;$i<$row;$i++)            //这里用一个FOR 语句查询显示多条结果
    {
        $dbrow=mysqli_fetch_array($res);
        $name = $dbrow[0];
        echo "<tr>";
        echo "<td align='center'>";
        echo "<a style='text-decoration:none' href='show_table.php?name=$name'><font size='5' color='blue'>$name</font>";
        echo "</td>";
        echo "</tr>";
    }
}
echo "</table>";
echo "<p>" . "total tables: " . $row . "<br>" . "</p>";
echo '<HR>';
?>

<!--这部分实现purchases操作-->
<table width="700" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">insert purchases</td>
  </tr>
</table>

<form action="add_purchase.php" method="post">
<table width="140" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>purchase number</td>
        <td><input type="text" name="pur_no"></td>
    </tr>
    <tr>
        <td>customer id</td>
        <td><input type="text" name="c_id"></td>
    </tr>
    <tr>
        <td>employee id</td>
        <td><input type="text" name="e_id"></td>
    </tr>
    <tr>
        <td>product id</td>
        <td><input type="text" name="p_id"></td>
    </tr>
    <tr>
        <td>quantity</td>
        <td><input type="text" name="pur_qty"></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="submit" name="submit3" value="enter"></td>
    </tr>
</table>
</form>

<HR>
<?php
include("conn.php");
// 构建一个表格实现月报表
echo "<form action='report_monthly_sales.php' method='post'>";
echo "<table align='center'>";

echo "<tr>";
echo "<th>";
echo "report monthly sales";
echo "</th>";
echo "</tr>";

echo "<tr>";
echo "<td align='center'>";
echo "product id";
echo "</td>";
echo "</tr>";

echo "<tr>";
echo "<td>";
echo "<input type='text' name='p_id'>";
echo "</td>";
echo "</tr>";

echo "<tr>";
echo "<td>";
echo "<input type='submit' value='enter'>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "</form>";

?>
<HR>

<?php
include("conn.php");
// 构建一个表格实现月报表
echo "<form action='report_customers.php' method='post'>";
echo "<table align='center'>";

echo "<tr>";
echo "<th>";
echo "report customers";
echo "</th>";
echo "</tr>";

echo "<tr>";
echo "<td align='center'>";
echo "product custormer name";
echo "</td>";
echo "</tr>";

echo "<tr>";
echo "<td>";
echo "<input type='text' name='c_name'>";
echo "</td>";
echo "</tr>";

echo "<tr>";
echo "<td>";
echo "<input type='submit' value='enter'>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "</form>";

?>

</body>
</html>
