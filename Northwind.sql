-- database creation
CREATE DATABASE Northwind;

-- selecting the database
USE Northwind;

-- creating table 1
create table products
(product_id INT PRIMARY KEY,
product_name TEXT,
supplier_id INT,
category_id INT,
quantity_per_unit TEXT,
unit_price DECIMAL,
units_in_stock INT,
units_in_order INT,
reorder_level INT,
discontinued INT);

-- ADDING FOREING KEYS
ALTER TABLE products
ADD CONSTRAINT fk_supplier_id_1 
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
ADD CONSTRAINT category_id_1 
FOREIGN KEY (category_id) REFERENCES categories(category_id);

-- deleting data without deleting column heads
truncate table products;

-- deleting table
drop table products;

-- LOADING DATA INTO TABLE 1
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products.csv"
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@product_id, @product_name, @supplier_id, @category_id, @quantity_per_unit, @unit_price, @units_in_stock, @units_in_order, @reorder_level, @discontinued)
SET
product_id = @product_id,
product_name = NULLIF(@product_name, ''),
supplier_id = NULLIF(@supplier_id, ''),
category_id = NULLIF(@category_id, ''),
quantity_per_unit = NULLIF(@quantity_per_unit, ''),
unit_price = NULLIF(@unit_price, ''),
units_in_stock = NULLIF(@units_in_stock, ''),
units_in_order = NULLIF(@units_in_order, ''),
reorder_level = NULLIF(@reorder_level, ''),
discontinued = NULLIF(@discontinued, '');

-- creating table 2
create table categories
(category_id INT PRIMARY KEY,
category_name TEXT,
descriptions TEXT);

-- LOADING DATA INTO TABLE 2
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\categories.csv"
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@category_id, @category_name, @descriptions)
SET
category_id = @category_id,
category_name = NULLIF(@category_name, ''),
descriptions = NULLIF(@descriptions, '');

-- creating table 3
create table suppliers
(supplier_id INT PRIMARY KEY,
category_name TEXT,
contact_name TEXT,
contact_title TEXT,
addres TEXT,
city TEXT,
region TEXT,
postal_code TEXT,
country TEXT,
phone TEXT,
fax TEXT,
home_page TEXT);

-- LOADING DATA INTO TABLE 3
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\suppliers.csv"
INTO TABLE suppliers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@supplier_id, @category_name, @contact_name, @contact_title, @addres, @city, @region, @postal_code, @country, @phone, @fax, @home_page)
SET
supplier_id = @supplier_id,
category_name = NULLIF(@category_name, ''),
contact_name = NULLIF(@contact_name, ''),
contact_title = NULLIF(@contact_title, ''),
addres = NULLIF(@addres, ''),
city = NULLIF(@city, ''),
region = NULLIF(@region, ''),
postal_code = NULLIF(@postal_code, ''),
country = NULLIF(@country, ''),
phone = NULLIF(@phone, ''),
fax = NULLIF(@fax, ''),
home_page = NULLIF(@home_page, '');

-- creating table 4
create table customers
(customer_id TEXT PRIMARY KEY,
company_name TEXT,
contact_name TEXT,
contact_title TEXT,
address TEXT,
city TEXT,
region TEXT,
postal_code TEXT,
country TEXT,
phone TEXT,
fax TEXT);

-- LOADING DATA INTO TABLE 4
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\customers.csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@customer_id, @company_name, @contact_name, @contact_title, @address, @city, @region, @postal_code, @country, @phone, @fax)
SET
customer_id = @customer_id,
company_name = NULLIF(@company_name, ''),
contact_name = NULLIF(@contact_name, ''),
contact_title = NULLIF(@contact_title, ''),
address = NULLIF(@address, ''),
city = NULLIF(@city, ''),
region = NULLIF(@region, ''),
postal_code = NULLIF(@postal_code, ''),
country = NULLIF(@country, ''),
phone = NULLIF(@phone, ''),
fax = NULLIF(@fax, '');

-- creating table 5
create table shippers
(shipper_id INT  PRIMARY KEY,
company_name TEXT,
phone TEXT);

-- LOADING DATA INTO TABLE 5
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\shippers.csv"
INTO TABLE shippers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@shipper_id, @company_name, @phone)
SET
shipper_id = @shipper_id,
company_name = NULLIF(@company_name, ''),
phone = NULLIF(@phone, '');

-- creating table 6
create table regions
(region_id INT  PRIMARY KEY,
region_description TEXT);

-- LOADING DATA INTO TABLE 6
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\regions.csv"
INTO TABLE regions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@region_id, @region_description)
SET
region_id = @region_id,
region_description = NULLIF(@region_description, '');

-- creating table 7
create table territories
(territory_id TEXT PRIMARY KEY,
territory_description TEXT,
region_id INT,
FOREIGN KEY (region_id) REFERENCES regions(region_id));

-- LOADING DATA INTO TABLE 7
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\territories.csv"
INTO TABLE territories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@territory_id, @territory_description, @region_id)
SET
territory_id = @territory_id,
territory_description = NULLIF(@territory_description, ''),
region_id = NULLIF(@region_id, '');

-- creating table 8
create table employees
(employee_id INT PRIMARY KEY,
last_name TEXT,
first_name TEXT,
title TEXT,
title_of_courtesy TEXT,
birth_date DATE,
hire_date DATE,
address TEXT,
city TEXT,
region TEXT,
postal_code TEXT,
country TEXT,
home_phone TEXT,
extension TEXT,
reports_to INT,
FOREIGN KEY (employee_id) REFERENCES employees(reports_to));

-- LOADING DATA INTO TABLE 8
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employees.csv"
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@employee_id, @last_name, @first_name, @title, @title_of_courtesy, @birth_date, @hire_date, @address, @city, @region, @postal_code, @country, @home_phone, @extension,
@reports_to)
SET
employee_id = @employee_id,
last_name = NULLIF(@last_name, ''),
first_name = NULLIF(@first_name, ''),
title = NULLIF(@title, ''),
title_of_courtesy = NULLIF(@title_of_courtesy, ''),
birth_date = NULLIF(@birth_date, ''),
hire_date = NULLIF(@hire_date, ''),
address = NULLIF(@address, ''),
city = NULLIF(@city, ''),
region = NULLIF(@region, ''),
postal_code = NULLIF(@postal_code, ''),
country = NULLIF(@country, ''),
home_phone = NULLIF(@home_phone, ''),
extension = NULLIF(@extension, ''),
reports_to = NULLIF(@reports_to, '');

-- creating table 9
create table employee_territories
(employee_id INT,
territory_id TEXT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
FOREIGN KEY (territory_id) REFERENCES territories(territory_id));

-- LOADING DATA INTO TABLE 9
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employee_territories.csv"
INTO TABLE employee_territories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(employee_id, @territory_id)
SET
employee_id = NULLIF(@employee_id, ''),
territory_id = NULLIF(@territory_id, '');

-- creating table 10
create table orders
(order_id INT PRIMARY KEY,
customer_id TEXT,
employee_id INT,
order_date DATE,
required_date DATE,
shipped_date DATE,
ship_via INT,
freight DECIMAL,
ship_name TEXT,
ship_address TEXT,
ship_city TEXT,
ship_region TEXT,
ship_postal_code TEXT,
ship_country TEXT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
FOREIGN KEY (ship_via) REFERENCES shippers(shipper_id));

-- LOADING DATA INTO TABLE 10
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\orders.csv"
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@order_id, @customer_id, @employee_id, @order_date, @required_date, @shipped_date, @ship_via, @freight, @ship_name, @ship_address, @ship_city, @ship_region,
@ship_postal_code, @ship_country)
SET
order_id = @order_id,
customer_id = NULLIF(@customer_id, ''),
employee_id = NULLIF(@employee_id, ''),
order_date = NULLIF(@order_date, ''),
required_date = NULLIF(@required_date, ''),
shipped_date = NULLIF(@shipped_date, ''),
ship_via = NULLIF(@ship_via, ''),
freight = NULLIF(@freight, ''),
ship_name = NULLIF(@ship_name, ''),
ship_address = NULLIF(@ship_address, ''),
ship_city = NULLIF(@ship_city, ''),
ship_region = NULLIF(@ship_region, ''),
ship_postal_code = NULLIF(@ship_postal_code, ''),
ship_country = NULLIF(@ship_country, '');

-- creating table 11
create table order_details
(order_id INT,
product_id INT,
quantity INT,
discount DECIMAL,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id));

-- LOADING DATA INTO TABLE 11
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\order_details.csv"
INTO TABLE order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@order_id, @product_id, @quantity, @discount)
SET
order_id = @order_id,
product_id = NULLIF(@product_id, ''),
quantity = NULLIF(@quantity, ''),
discount = NULLIF(@discount, '');

-- Category_name and descriptions sorted by category_name.
SELECT category_name, descriptions
FROM categories
ORDER BY category_name;

-- Contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'
SELECT contact_name, address, city
FROM customers
WHERE Country NOT IN ('Germany','Mexico', 'Spain');

-- order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26
SELECT order_date, shipped_date, customer_id, freight
FROM orders
WHERE order_date = '2018-02-26';

-- employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date
SELECT employee_id, order_id, customer_id, required_date, shipped_date
FROM orders
WHERE shipped_date > required_date;

-- all the even numbered Order_id from the orders table
SELECT order_id
FROM orders
WHERE mod(order_id,2)=0;

-- city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name;

-- company_name, contact_name, fax number of all customers that has a fax number.
SELECT company_name, contact_name, fax
FROM customers
WHERE Fax IS NOT NULL;

-- first_name, last_name. hire_date of the most recently hired employee.
select first_name, last_name, max(hire_date) as hire_date
from employees;

-- average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.
SELECT round(avg(Unit_Price), 2) AS average_price, SUM(units_in_stock) AS total_stock,
SUM(discontinued) as total_discontinued
FROM products;

-- ProductName, CompanyName, CategoryName from the products, suppliers, and categories table
SELECT p.product_name, s.company_name, c.category_name
FROM products p
JOIN suppliers s ON s.supplier_id = p.Supplier_id
JOIN categories c On c.category_id = p.Category_id;

-- category_name and the average product unit price for each category rounded to 2 decimal places.
SELECT c.category_name, round(avg(p.unit_price),2) as average_unit_price
FROM products p
JOIN categories c On c.category_id = p.Category_id
GROUP BY c.category_name;

-- city, company_name, contact_name from the customers and suppliers table merged together.
select City, company_name, contact_name, 'customers' as relationship 
from customers
union
select city, company_name, contact_name, 'suppliers'
from suppliers;

/*employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, "Late" if the order shipped late.
Ordererd by employee last_name, then by first_name, and then descending by number of orders.*/
SELECT e.first_name, e.last_name, COUNT(o.order_id) As num_orders,
  (
    CASE
      WHEN o.shipped_date <= o.required_date THEN 'On Time'
      ELSE 'Late' 
      END
  ) AS shipped
FROM orders o
  JOIN employees e ON e.employee_id = o.employee_id
GROUP BY e.first_name, e.last_name, shipped
ORDER BY  e.last_name, e.first_name, num_orders DESC;

-- how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places
Select 
YEAR(o.order_date) AS 'order_year' , ROUND(SUM(p.unit_price * od.quantity * od.discount),2) AS 'discount_amount' 
from orders o 
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
group by YEAR(o.order_date)
order by order_year desc;

-- deleting database
DROP database Northwind;