-- for the involved product, the quantity to be purchased is equal to or smaller than the quantity on hand (qoh).
-- Otherwise, an appropriate message should be displayed (e.g., “Insufficient quantity in stock.”) 
-- and the purchase request should be rejected.
DELIMITER //
CREATE trigger checkPurchase
before INSERT ON purchases
for each row
BEGIN
    declare q_oh int;
    declare c_id varchar;
    select qoh into q_oh from products 
        where products.pid = new.pid;

-- 使用来自
-- https://stackoverflow.com/questions/2981930/mysql-trigger-to-prevent-insert-under-certain-conditions
-- 的方法取消操作
    
    select cid into c_id from customers where customers.cid = c_id;
    -- 此处需要修改，不存在顾客
    if c_id is null then
        signal SQLSTATE '02000'
        SET MESSAGE_TEXT = 'customer not found';
    elseif new.qty > q_oh THEN
        SIGNAL SQLSTATE '02000' 
            SET MESSAGE_TEXT = "Insufficient quantity in stock";
    end if;
END //
delimiter ;
