DELIMITER //
CREATE PROCEDURE add_purchase(IN pur_no int, IN c_id varchar(4), IN e_id varchar(3), IN p_id varchar(4), IN pur_qty int)
BEGIN
DECLARE t_price decimal(7,2);
DECLARE org_price decimal(6,2);
DECLARE dist_rate decimal(3,2);

--查找商品的价格与折扣
SELECT products.original_price, products.discnt_rate 
INTO org_price, dist_rate from products
WHERE p_id=products.pid;

--插入purchases，首先计算总价格
SET t_price = org_price * dist_rate * pur_qty;
INSERT INTO purchases(pur, cid, eid, pid, qty, ptime, total_price)
VALUES(pur_no, c_id, e_id, p_id, pur_qty, now(), t_price);

--修改库存数量
-- UPDATE products P
-- SET qoh = qoh - pur_qty
-- WHERE P.pid=p_id;
-- 放到后面的check_qoh修改

END //
DELIMITER ;