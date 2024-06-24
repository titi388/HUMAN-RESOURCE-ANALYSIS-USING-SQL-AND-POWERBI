create table customer(
customer_id int key auto_increment,
fullname varchar(12),
contact text
);


INSERT INTO customer(fullname, contact)
VALUE ("Onana", "878-922-287"),
      ("James", "878-922-287"),
      ("Smith", "878-922-287"),
      ("Kola", "878-922-287"),
      ("Kemi", "878-922-287"),
      ("Jadesola", "878-922-287"),
      ("Rashford", "878-922-287"),
	  ("Evans", "878-922-287");
      
create table order_info(
cust_id int,
product ENUM("Laptop", "Phone", "Television"),
qunatity int,
price decimal(10, 2),
FOREIGN KEY(cust_id) REFERENCES customer(customer_id)  ON DELETE CASCADE ON UPDATE CASCADE
);

select * from order_info;

select * from customer;

INSERT INTO order_info()
VALUES (1, "Laptop", 2, 500),
       (8, "Phone", 12, 300),
       (3, "Phone", 6, 500),
       (2, "Television", 3, 700),
       (8, "Television", 33, 700),
       (2, "Laptop", 13, 500),
       (8, "Television", 20, 700),
       (4, "Phone", 12, 300),
       (3, "Television", 19, 700),
        (8, "Television", 20, 700),
		(3, "Laptop", 17, 500);
        
select * from order_info;
select * from customer;

-- return the name and contact of all customers yet to place order
select c.customer_id, c.fullname, c.contact
from customer c
Left Join order_info o 
ON c.customer_id = o.cust_id
where qunatity is null;

-- return the name and contact of customer with highest total price
select c.fullname, sum(o.qunatity * o.price) as `total price`
from customer c 
Inner Join order_info o
On c.customer_id = o.cust_id
Group by c.fullname
Order by `Total Price` Desc
Limit 1;

-- return all customer that placed order
select c.customer_id, c.fullname, c.contact
from customer c
Left Join order_info o 
ON c.customer_id = o.cust_id;

-- list out the information of customer that bought just television
select c.customer_id, c.fullname, c.contact, o.product
from customer c
Left Join order_info o 
ON c.customer_id = o.cust_id
Where product = "Television";

-- TO EXECUTE COMMAND IN SQL:
-- FROM, WHERE, SELECT, ORDERBY. GROUPBY HAVING, LIMIT
-- 
