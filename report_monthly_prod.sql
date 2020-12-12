SELECT MONTHNAME('1998-02-05');
SELECT YEAR('98-02-03');
SELECT UPPER('Allah-hus-samad');
SELECT LEFT('foobarbar', 5);

DELIMITER //
CREATE PROCEDURE report_monthly_sale(IN prodid varchar(4))
BEGIN
	SELECT pname, upper(LEFT(monthname(ptime), 3)) "month", year(ptime) "year",
    sum(purchases.qty) "total qty", sum(purchases.total_price) "total price", sum(purchases.total_price) / sum(purchases.qty) "avg"
        from products, purchases 
        WHERE prodid=purchases.pid and products.pid=purchases.pid 
        GROUP BY month(ptime), YEAR(ptime)
        ORDER by year(ptime), month(ptime);
END //
DELIMITER ;