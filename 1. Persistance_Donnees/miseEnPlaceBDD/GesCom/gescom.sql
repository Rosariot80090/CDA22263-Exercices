drop DATABASE if exists GESCOM;
CREATE DATABASE GESCOM;
USE GESCOM;

CREATE TABLE suppliers(
sup_id INT NOT null,
sup_name VARCHAR(50) NOT null,
sup_city VARCHAR(50) NOT null,
sup_address VARCHAR(150) NOT null,
sup_mail VARCHAR(75),
sup_phone INT(10),
PRIMARY KEY(sup_id)
); 

CREATE TABLE customers(
cus_id INT NOT NULL,
cus_lastname VARCHAR(50) NOT NULL,
cus_firstname VARCHAR(50) NOT NULL,
cus_address VARCHAR(150) NOT NULL,
cus_zipcode VARCHAR(5),
cus_city VARCHAR(50) NOT NULL,
cus_mail VARCHAR(75),
cus_phone INT(10),
PRIMARY KEY(cus_id)
);

CREATE TABLE orders(
ord_id INT NOT NULL,
ord_order_date DATE,
ord_ship_date DATE,
ord_bill_date DATE,
ord_reception_date DATE,
ord_status varchar(25) NOT NULL,
cus_id INT,
PRIMARY KEY(ord_id),
FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE categories(
cat_id INT,
cat_name VARCHAR(200),
cat_parent_id INT,
PRIMARY KEY(cat_id)
);

CREATE TABLE products(
pro_id INT NOT NULL,
pro_ref VARCHAR(10) NOT NULL,
pro_name VARCHAR(200) NOT NULL,
pro_desc TEXT(1000) NOT NULL,
pro_price DECIMAL(6,2) NOT NULL,
pro_stock smallint(4) NOT NULL,
pro_color VARCHAR(30) NOT NULL,
pro_picture VARCHAR(40) NOT NULL,
pro_add_date DATE,
pro_update_date DATETIME,
pro_publish TINYINT(1) NOT NULL,
cat_id INT,
sup_id INT,
PRIMARY KEY(pro_id),
FOREIGN KEY(cat_id) REFERENCES categories(cat_id),
FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
); 

create index idx_ref on products(pro_ref);