-- 记录总是应该在操作完成后，因此统一after
-- (1) insert a tuple into the purchases table; 
DELIMITER //
-- the table_name should be “purchases”,
-- the operation should be “insert” and 
-- the key_value should be the pur of the newly inserted purchase. 
create trigger insert_purchases
after INSERT on purchases
for each row
BEGIN
declare c_name valchar(15);
select cname into c_name from customers where new.cid=cid;
insert into logs(who, time, 
    operation, key_value, table_name)
VALUES(c_name, new.ptime, 'insert', 
    concat(new.pur,''), 'purchases');
END //

-- the table_name should be “products”, 
-- the operation should be “update” and 
-- the key_value should be the pid of the affected product
-- (2) update the qoh attribute of the products table; 
create trigger update_products
after UPDATE on products
for each row
begin
insert into logs(who, time, 
    operation, key_value, table_name)
VALUES(new.pname, now(), 'update', 
    new.pid, 'products');
END //

-- the table_name should be “customers”, 
-- the operation should be “update” and 
-- the key_value should be the cid of the affected customer.
-- (3) update the visits_made attribute of the customers table
create trigger update_vis
after update on customers
for each row
BEGIN
insert into logs(who, time, 
    operation, key_value, table_name)
VALUES(new.cname, now(), 'update', 
    new.cid, 'customers');
END //
DELIMITER ;
