# SQL Exercises/The computer store

<div style="text-align:center;">
    <img src="https://imgur.com/nMtobpb.png" alt="Img">
</div>

1. Select the names of all the products in the store.
2. Select the names and the prices of all the products in the store.
3. Select the name of the products with a price less than or equal to $200.
4. Select all the products with a price between $60 and $120.
5. Select the name and price in cents (i.e., the price must be multiplied by 100).
6. Compute the average price of all the products.
7. Compute the average price of all products with manufacturer code equal to 2.
8. Compute the number of products with a price larger than or equal to $180.
9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
10. Select all the data from the products, including all the data for each product's manufacturer.
11. Select the product name, price, and manufacturer name of all the products.
12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
13. Select the average price of each manufacturer's products, showing the manufacturer's name.
14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
15. Select the name and price of the cheapest product.
16. Select the name of each manufacturer along with the name and price of its most expensive product.
17. Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products.
18. Add a new product: Loudspeakers, $70, manufacturer 2.
19. Update the name of product 8 to "Laser Printer".
20. Apply a 10% discount to all products.
21. Apply a 10% discount to all products with a price larger than or equal to $120.

```sql
CREATE TABLE Manufacturers (
	Code INTEGER PRIMARY KEY NOT NULL,
	Name CHAR(50) NOT NULL 
);

CREATE TABLE Products (
	Code INTEGER PRIMARY KEY NOT NULL,
	Name CHAR(50) NOT NULL ,
	Price REAL NOT NULL ,
	Manufacturer INTEGER NOT NULL 
		CONSTRAINT fk_Manufacturers_Code REFERENCES Manufacturers(Code)
);
INSERT INTO Manufacturers(Code,Name) VALUES (1,'Sony'),(2,'Creative Labs'),(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester');
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5),(2,'Memory',120,6),(3,'ZIP drive',150,4),(4,'Floppy disk',5,6),(5,'Monitor',240,1),
(6,'DVD drive',180,2),(7,'CD drive',90,2),(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2);
