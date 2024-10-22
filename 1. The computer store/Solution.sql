/*
 @Author: MaurosMJ
 Environment: MySQL
*/

create table manufacturers (
code integer,
name varchar(200),
constraint manufacturers_code_pk primary key (code)
);

create table products (
code integer,
name varchar(200),
price real,
manufacturer integer,
constraint products_code_pk primary key (code),
constraint products_manufacturer_fk foreign key (manufacturer) references manufacturers (code)
);

INSERT INTO Manufacturers(Code,Name) VALUES (1,'Sony'),(2,'Creative Labs'),(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester');
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5),(2,'Memory',120,6),(3,'ZIP drive',150,4),(4,'Floppy disk',5,6),(5,'Monitor',240,1),
(6,'DVD drive',180,2),(7,'CD drive',90,2),(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2);
commit;

-- 1.Select the names of all the products in the store.
select name from products;

-- 2.Select the names and the prices of all the products in the store.
select name, price from products;

-- 3.Select the name of the products with a price less than or equal to $200.
select name, price from products where price <= 200;

-- 4.Select all the products with a price between $60 and $120.
select name, price from products where price between 60 and 120;

-- 5.Select the name and price in cents (i.e., the price must be multiplied by 100).

-- 6.Compute the average price of all the products.
select name, avg(price) as "AVG" from products where price group by name;

-- 7.Compute the average price of all products with manufacturer code equal to 2.
select name, manufacturer, avg(price) as "AVG" from products where manufacturer = 2 group by name, manufacturer;

-- 8.Compute the number of products with a price larger than or equal to $180.
select count(*) as "Count" from products where price >= 180;

-- 9.Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
select name, price from products where price >= 180 order by 2 desc, 1 asc;

-- 10.Select all the data from the products, including all the data for each product's manufacturer.
select p.code, p.name, p.price, p.manufacturer, m.code, m.name from products p join manufacturers m on (p.manufacturer = m.code);

-- 11.Select the product name, price, and manufacturer name of all the products.
select p.name, p.price, m.name from products p join manufacturers m on (p.manufacturer = m.code);

-- 12.Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(p.price) as "AVG", p.manufacturer from products p group by p.manufacturer;

-- 13.Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(p.price) as "AVG", m.name from products p join manufacturers m on (p.manufacturer = m.code) group by m.name;

-- 14.Select the names of manufacturer whose products have an average price larger than or equal to $150.
select m.name from products p join manufacturers m on (p.manufacturer = m.code) group by m.name having avg(p.price) >= 150;

-- 15.Select the name and price of the cheapest product.
select name, price from products where price = (select min(price) from products);

-- 16.Select the name of each manufacturer along with the name and price of its most expensive product.
-- 17.Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products.
-- 18.Add a new product: Loudspeakers, $70, manufacturer 2.
-- 19.Update the name of product 8 to "Laser Printer".
-- 20.Apply a 10% discount to all products.
-- 21.Apply a 10% discount to all products with a price larger than or equal to $120.