-- If the purchase causes the qoh of the product to be below qoh_threshold,
-- your program should perform the following tasks:
-- (a) print a message indicating the current qoh of the product, 
-- (b) increase qoh by making it 2 * old_qoh, where old_qoh represents the value of qoh
-- before the corresponding purchase was made (other attribute values of the product will not be changed), and
-- (c) print another message indicating that the quantity on hand of the product has been increased by old_qoh + qty_sold,
-- where qty_sold is the number of the product sold in the involved purchase. // 这句话他妈的什么意思
-- In addition, the insertion of the new tuple in the purchases table will cause the visits_made of the customer to be increased by one. 
DELIMITER //
create trigger check_qoh
AFTER INSERT on purchases 
for each row
BEGIN

-- 获得该产品的库存
declare q_oh int;
select qoh into q_oh from products WHERE new.pid = products.pid;
-- 获得库存阈
declare q_oh_threshold int;
select qoh_threshold into q_oh_threshold from products WHERE new.pid = products.pid;

-- 这要求有点奇怪，题目要求库存量翻倍，却又说增加了"原来库存+卖出去的数量"，只好采用如下方式：
-- 只好把更新库存的功能添加到trigger里面了
if q_oh - new.qty < q_oh_threshold THEN
select qoh 'now qoh' FROM products WHERE new.pid = products.pid;
 UPDATE products SET qoh = 2 * qoh WHERE new.pid = products.pid;
select q_oh + new.qty "qoh has been increased by";
else
update products set qoh = qoh - new.qty where new.pid=products.pid;
end if

-- 更新购买次数与最近一次购买时间
UPDATE customers 
SET customers.visits_made=customers.visits_made + 1, customers.last_visit_time=now()
WHERE customers.cid=new.cid;

END //
DELIMITER ;

------------------------------------------------------------------------------------------------
DELIMITER //
create trigger check_qoh
AFTER INSERT on purchases 
for each row
BEGIN

-- 获得该产品的库存
declare q_oh int;
-- 获得库存阈
declare q_oh_threshold int;
select qoh into q_oh from products WHERE new.pid = products.pid;
select qoh_threshold into q_oh_threshold from products WHERE new.pid = products.pid;

-- 这要求有点奇怪，题目要求库存量翻倍，却又说增加了"原来库存+卖出去的数量"，只好采用如下方式：
-- 只好把更新库存的功能添加到trigger里面了
if q_oh - new.qty < q_oh_threshold THEN
select qoh 'now qoh' FROM products WHERE new.pid = products.pid;
 UPDATE products SET qoh = 2 * qoh WHERE new.pid = products.pid;
select q_oh + new.qty "qoh has been increased by";
else
update products set qoh = qoh - new.qty where new.pid=products.pid;
end if

-- 更新购买次数与最近一次购买时间
UPDATE customers
SET customers.visits_made=customers.visits_made + 1, customers.last_visit_time=now()
WHERE customers.cid=new.cid;

END //
DELIMITER ;

-----------------------------------------------------------------------------------
DELIMITER //
create trigger check_qoh
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN

DECLARE q_oh int;
declare q_oh_threshold int;
select qoh into q_oh from products WHERE new.pid = products.pid;
select qoh_threshold into q_oh_threshold from products WHERE new.pid = products.pid;

if q_oh - new.qty < q_oh_threshold THEN
select qoh 'now qoh' FROM products WHERE new.pid = products.pid;
 UPDATE products SET qoh = 2 * qoh WHERE new.pid = products.pid;
select (q_oh+new.qty) "qoh has been increased by";
else
update products set qoh = qoh - new.qty where new.pid=products.pid;
end if

UPDATE customers
SET visits_made=visits_made + 1, last_visit_time=now()
WHERE customers.cid=new.cid;

END //
DELIMITER ;

-------------------------------------------------------------------------------------

-- 正确版本
DELIMITER //
create trigger check_qoh
after insert on purchases
for each row
begin

declare q_oh int;
declare q_oh_threshold int;

select qoh into q_oh from products where new.pid=products.pid;
SELECT qoh_threshold INTO q_oh_threshold from products where new.pid=products.pid;

if q_oh - new.qty < q_oh_threshold THEN
-- select qoh 'now qoh' FROM  products where new.pid=products.pid;
update products set qoh=2*qoh where new.pid=products.pid;
-- select q_oh + new.qty 'qoh has been increased by';
else
update products set qoh=qoh-new.qty where new.pid=products.pid;
end if;

update customers
set visits_made=visits_made+1, last_visit_time=now()
where customers.cid=new.cid;

end //
delimiter ;