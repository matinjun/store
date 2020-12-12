DELIMITER //
CREATE PROCEDURE show_prod()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE show_suppli()
BEGIN
SELECT * FROM suppliers;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE show_pur()
BEGIN
SELECT * from purchases;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE show_log()
BEGIN
SELECT * from logs;
END //
DELIMITER ;

# 错误代码
DELIMITER $$
CREATE PROCEDURE show_info()
BEGIN
call show_emp();
call show_cus();
call show_prod();
call show_suppli();
call show_pur();
call show_log();
END $$
DELIMITER ;

# 错误代码
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_info`()
BEGIN
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM suppliers;
SELECT * FROM purchases;
SELECT * FROM logs;
END