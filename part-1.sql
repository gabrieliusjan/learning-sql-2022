DROP DATABASE IF EXISTS dbshop;
CREATE DATABASE dbshop;
USE dbshop;

CREATE TABLE customer(
	customer_id INT UNSIGNED,
    cust_first_name VARCHAR(20),
    cust_sur_name VARCHAR(20),
    street VARCHAR(40),
    town VARCHAR(20),
    county VARCHAR(20),
    country VARCHAR(20),
    email_address VARCHAR(50),
    user_name VARCHAR(20),
    password VARCHAR(20),
    timestamp_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(customer_id)
);

CREATE TABLE orderStatus(
	status_code ENUM('Confirmed', 'Dispatched', 'Delivered', 'PRO'),
	status_description VARCHAR(100),
	PRIMARY KEY(status_code)
);

CREATE TABLE `order`(
	order_id INT UNSIGNED,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT UNSIGNED,
    status_code ENUM('Confirmed', 'Dispatched', 'Delivered', 'PRO'),
    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(status_code) REFERENCES orderStatus(status_code)
    );
    
CREATE TABLE category(
	category_id INT UNSIGNED,
    category_name VARCHAR(20),
    category_description VARCHAR(100),
    PRIMARY KEY(category_id)
);    
    
CREATE TABLE item(
	item_id INT UNSIGNED,
    title VARCHAR(40) NOT NULL,
    image VARCHAR(100),
    price DECIMAL(6,2),
    number_in_stock INT UNSIGNED,
    category_id INT UNSIGNED,
    PRIMARY KEY(item_id),
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

CREATE TABLE orderLine(
	order_id INT UNSIGNED,
    item_id INT UNSIGNED,
    quantity INT UNSIGNED,
    PRIMARY KEY(order_id, item_id),
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(item_id) REFERENCES item(item_id)
);

INSERT INTO orderStatus(status_code, status_description)
VALUES('PRO', 'Order has been processed');

INSERT INTO category(category_id, category_name, category_description)
VALUES(1, 'Book', 'Books category description');
INSERT INTO category(category_id, category_name, category_description)
VALUES(2, 'Lego', 'Legos category description');
INSERT INTO category(category_id, category_name, category_description)
VALUES(3, 'Creative', 'Creative category description');

INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(1, "First book item title", "/item/book1.jpg", 000006.00, 2, 1);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(2, "First lego item title", "/item/lego1.jpg", 000006.00, 2, 2);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(3, "First creative item title", "/item/creative1.jpg", 000006.00, 2, 3);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(4, "Second creative item title", "/item/creative2.jpg", 000006.00, 2, 3);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(5, "Third creative item title", "/item/creative3.jpg", 000006.00, 2, 3);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(6, "Fourth creative item title", "/item/creative4.jpg", 000006.00, 2, 3);
INSERT INTO item(item_id, title, image, price, number_in_stock, category_id)
VALUES(7, "Fifth creative item title", "/item/creative5.jpg", 000006.00, 2, 3);

INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(1, 'Mary', 'Moregan', 'Mary Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'Moregan@yahoo.com', 'Mary', 'marymoregan');
INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(2, 'Bob', 'Jones', 'Bob Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'bob@google.com', 'Bob', 'bobjones');
INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(3, 'John', 'Ryan', 'John Ryan Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'johnryan@google.com', 'JohnRyan', 'johnryan');
INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(4, 'Tom', 'Smith', 'Tom Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'tom@google.com', 'Tom', 'tomsmith');
INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(5, 'Tom', 'Ryan', 'Tom Ryan Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'tomryan@google.com', 'TomRyan', 'tomryan');
INSERT INTO customer(customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(6, 'Mary', 'Odonnel', 'Mary Odonnel Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'maryodonnel@google.com', 'MaryO', 'maryo');
INSERT INTO customer (customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(7, 'Conor', 'Mcgregor', 'Conor Mcgregor Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'conormc@google.com', 'ConorMc', 'conormc');
INSERT INTO customer (customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(8, 'Jackie', 'Chan', 'Jackie Chan Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'jackiech@google.com', 'jackiech', 'jackiech');
INSERT INTO customer (customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(12, 'Tim', 'Smith', 'Tim Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'tim@google.com', 'Tim', 'timsmith');
INSERT INTO customer (customer_id, cust_first_name, cust_sur_name, street, town, county, country, email_address, user_name, password)
VALUES(15, 'Jack', 'Smith', 'Jack Street', 'Clonmel', 'Co. Tipperary', 'Ireland', 'jack@google.com', 'Jack', 'jacksmith');

INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(1, 6, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(2, 7, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(3, 8, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(4, 2, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(5, 10, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(6, 15, 'PRO');
INSERT INTO `order`(order_id, customer_id, status_code)
VALUES(7, 3, 'Confirmed');

INSERT INTO orderLine(order_id, item_id, quantity)
VALUES (1, 1, 1);
INSERT INTO orderLine(order_id, item_id, quantity)
VALUES (7, 1, 1);

-- 1.
SELECT * 
FROM customer
WHERE user_name= 'Mary' AND email_address = 'Moregan@yahoo.com';

-- 2.
SELECT *, user_name AS 'Display Name'
FROM customer
WHERE customer_id BETWEEN 4 AND 12 AND town = 'Clonmel'
ORDER BY user_name DESC;

-- 3.
SELECT *, user_name AS 'Display Name'
FROM customer
WHERE cust_first_name LIKE ('To%') OR cust_first_name LIKE ('Ti%') AND cust_sur_name LIKE ('S%th')
ORDER BY user_name;

-- 4.
SELECT customer_id, email_address, user_name AS 'Display Name'
FROM customer
WHERE timestamp_created > '2010-11-27 10:10:10' AND user_name IN ('TomRyan', 'MaryO', 'ConorMc');

-- 5.
SELECT *
FROM `order`
WHERE customer_id IN (6,7,8,2,10,15) AND status_code = 'PRO';

-- 6.
SELECT * 
FROM item 
WHERE number_in_stock < 3 AND price > 5;

-- 7.
SELECT c.cust_first_name 
FROM customer c JOIN `order` o ON c.customer_id = o.customer_id
WHERE o.order_date > 2010-10-12;

-- 8.
SELECT i.*, c.category_name, c.category_description 
FROM item i JOIN category c ON c.category_id = i.category_id
WHERE category_name IN('Book', 'Lego', 'Creative');
-- 9.
SELECT ol.*, c.cust_first_name, c.cust_sur_name
FROM orderLine ol JOIN `order` o ON ol.order_id = o.order_id JOIN customer c ON c.customer_id = o.customer_id
WHERE c.cust_first_name = 'John' AND c.cust_sur_name = 'Ryan';

-- 10.
SELECT status_code, COUNT(*) AS 'Orders'
FROM `order`
WHERE status_code IN('Confirmed', 'Dispatched', 'Delivered', 'PRO')
GROUP BY status_code
ORDER BY status_code;

-- 11.
SELECT c.category_name, COUNT(*) AS 'Number of Items'
FROM category c JOIN item i ON c.category_id = i.category_id
GROUP BY c.category_name
HAVING COUNT(*) > 4;