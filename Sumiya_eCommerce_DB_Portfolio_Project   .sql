


CREATE DATABASE eCommerce_DB;

USE eCommerce_DB;


-- eCommerce_DB DATABASE -- Countries Table/Schema
CREATE TABLE Countries(
   Country_Code INT UNIQUE NOT NULL, -- static type primary defining with constraints
   Country_Name VARCHAR(30) NOT NULL,
   Continent_Name VARCHAR(30) NOT NULL,
   PRIMARY KEY (Country_Code)
);



-- eCommerce_DB DATABASE -- Users Table/Schema
CREATE TABLE Users(
  User_ID INT AUTO_INCREMENT NOT NULL,
  Full_Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Gender VARCHAR(20) NOT NULL,
  Date_of_Birth VARCHAR(50) NOT NULL,
  Country_Code INT,
  Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (User_ID),
  -- FOREIGN KEY PART ---
  CONSTRAINT FK_Countries
  FOREIGN KEY (Country_Code)
  REFERENCES Countries(Country_Code)
);


-- eCommerce_DB DATABASE -- Orders Table/Schema
CREATE TABLE Orders(
   Order_ID INT AUTO_INCREMENT NOT NULL,
   User_ID INT NOT NULL,
   Status VARCHAR (50) NOT NULL,
   Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (Order_ID),
   -- FOREIGN KEY PART ---
   CONSTRAINT FK_Users
   FOREIGN KEY (User_ID)
   REFERENCES Users(User_ID)
);


-- eCommerce_DB DATABASE -- Merchants Table/Schema
 CREATE TABLE Merchants(
   Merchant_ID INT AUTO_INCREMENT NOT NULL,
   Merchant_Name VARCHAR(100) NOT NULL,
   User_ID INT,
   Country_Code INT,
   Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (Merchant_ID),
   -- FOREIGN KEY PART ---
   CONSTRAINT FK_Users_Countries
   FOREIGN KEY (User_ID)
   REFERENCES Users(User_ID),
   FOREIGN KEY (Country_Code)
   REFERENCES Countries(Country_Code)

 );
 
 
-- eCommerce_DB DATABASE -- Products Table/ Schema
CREATE TABLE Products(
  Product_ID INT UNIQUE NOT NULL, -- static type primary defining with constraints
  Merchant_ID INT,
  Product_Name VARCHAR(100) NOT NULL,
  Product_Price INT NOT NULL,
  Status VARCHAR (50) NOT NULL,
  Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Product_ID),
  -- FOREIGN KEY PART ---
  CONSTRAINT FK_Merchants
  FOREIGN KEY (Merchant_ID)
  REFERENCES Merchants(Merchant_ID)

);

-- eCommerce_DB DATABASE -- Order Items Table/ Schema
CREATE TABLE Order_Items(
   Order_ID INT,
   Product_ID INT,
   Order_Quantity INT NOT NULL,
   CONSTRAINT FK_Orders_Products
   FOREIGN KEY (Order_ID)
   REFERENCES Orders(Order_ID),
   FOREIGN KEY (Product_ID)
   REFERENCES Products(Product_ID)

);

-- Insert records into the Countries table
INSERT INTO Countries (Country_Code, Country_Name, Continent_Name) VALUES
(101, 'United States', 'North America'),
(102, 'Canada', 'North America'),
(103, 'Mexico', 'North America'),
(104, 'Brazil', 'South America'),
(105, 'Argentina', 'South America'),
(106, 'Germany', 'Europe'),
(107, 'France', 'Europe'),
(108, 'United Kingdom', 'Europe'),
(109, 'China', 'Asia'),
(110, 'Japan', 'Asia'),
(111, 'India', 'Asia'),
(112, 'Australia', 'Oceania'),
(113, 'New Zealand', 'Oceania'),
(114, 'South Africa', 'Africa'),
(115, 'Nigeria', 'Africa');

-- Users table

INSERT INTO Users (Full_Name, Email, Gender, Date_of_Birth, Country_Code) VALUES
('John Doe', 'john.doe@example.com', 'Male', '1985-03-15', (SELECT Country_Code FROM Countries WHERE Country_Name = 'United States')),
('Jane Smith', 'jane.smith@example.com', 'Female', '1990-07-22', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Canada')),
('Robert Brown', 'robert.brown@example.com', 'Male', '1982-12-05', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Mexico')),
('Emily Davis', 'emily.davis@example.com', 'Female', '1995-11-18', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Brazil')),
('Michael Wilson', 'michael.wilson@example.com', 'Male', '1978-01-10', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Argentina')),
('Sarah Johnson', 'sarah.johnson@example.com', 'Female', '1988-09-25', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Germany')),
('David Lee', 'david.lee@example.com', 'Male', '1992-04-13', (SELECT Country_Code FROM Countries WHERE Country_Name = 'France')),
('Sophia Martinez', 'sophia.martinez@example.com', 'Female', '1994-06-30', (SELECT Country_Code FROM Countries WHERE Country_Name = 'United Kingdom')),
('James Taylor', 'james.taylor@example.com', 'Male', '1987-02-20', (SELECT Country_Code FROM Countries WHERE Country_Name = 'China')),
('Olivia Anderson', 'olivia.anderson@example.com', 'Female', '1991-10-05', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Japan'));

INSERT INTO Users (Full_Name, Email, Gender, Date_of_Birth, Country_Code) VALUES
('William Clark', 'william.clark@example.com', 'Male', '1983-08-17', (SELECT Country_Code FROM Countries WHERE Country_Name = 'India')),
('Isabella Rodriguez', 'isabella.rodriguez@example.com', 'Female', '1996-12-12', (SELECT Country_Code FROM Countries WHERE Country_Name = 'India')),
('Liam Harris', 'liam.harris@example.com', 'Male', '1989-03-07', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Nigeria')),
('Ava Lewis', 'ava.lewis@example.com', 'Female', '1993-11-28', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Nigeria')),
('Benjamin Walker', 'benjamin.walker@example.com', 'Male', '1980-04-16', (SELECT Country_Code FROM Countries WHERE Country_Name = 'Nigeria'));
select * from Users;


---------  


select * from Orders;


INSERT INTO Orders (User_ID, Status) VALUES
-- Orders for User_ID 1
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 'Returned');

INSERT INTO Orders (User_ID, Status) VALUES
-- Orders for User_ID 2
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 'Shipped');

INSERT INTO Orders (User_ID, Status) VALUES
-- Orders for User_ID 3
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 'Shipped');

INSERT INTO Orders (User_ID, Status) VALUES
-- Orders for User_ID 4
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 'Returned'),

-- Orders for User_ID 5
((SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 'Returned'),

-- Orders for User_ID 6
((SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 'Returned'),

-- Orders for User_ID 7
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 'Returned'),

-- Orders for User_ID 8
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 'Completed'),

-- Orders for User_ID 9
((SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 'Returned'),

-- Orders for User_ID 10
((SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 'Returned'),

-- Orders for User_ID 11
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'William Clark'), 'Returned'),

-- Orders for User_ID 12
((SELECT User_ID FROM Users WHERE Full_Name = 'Isabella Rodriguez'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Isabella Rodriguez'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Isabella Rodriguez'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Isabella Rodriguez'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Isabella Rodriguez'), 'Returned'),

-- Orders for User_ID 13
((SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 'Returned'),

-- Orders for User_ID 14
((SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 'Returned'),

-- Orders for User_ID 15
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Pending'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Completed'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Shipped'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Cancelled'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Returned'),
((SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 'Completed');

---- Merchants
select * from Merchants;
-- Insert Merchants with  User_IDs and valid Country_Code from Countries table

INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES 
('Tech World', (SELECT User_ID FROM Users WHERE Full_Name = 'John Doe'), 101),
('Fashion Hub', (SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 101),
('Home Essentials', (SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'),101);

INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES
('Gadget Galaxy', (SELECT User_ID FROM Users WHERE Full_Name = 'Liam Harris'), 115),
('Furniture Haven', (SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 115);
INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES
('Furniture World', (SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 115);

INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES 
 ('Home Essentials', (SELECT User_ID FROM Users WHERE Full_Name = 'Sarah Johnson'), 106),
 ('Gadget Galaxy', (SELECT User_ID FROM Users WHERE Full_Name = 'David Lee'), 107),
('Furniture Haven', (SELECT User_ID FROM Users WHERE Full_Name = 'Sophia Martinez'), 108);


INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES 
('Sports Gear', (SELECT User_ID FROM Users WHERE Full_Name = 'James Taylor'), 109),
('Sports World', (SELECT User_ID FROM Users WHERE Full_Name = 'Olivia Anderson'), 110),
('Outdoor Adventures', (SELECT User_ID FROM Users WHERE Full_Name = 'Robert Brown'), 103),
('Kitchen Supplies', (SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 104);

INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES
('Pet Lovers', (SELECT User_ID FROM Users WHERE Full_Name = 'Michael Wilson'), 105);

INSERT INTO Merchants (Merchant_Name, User_ID, Country_Code) 
VALUES 
('Bookstore Paradise', (SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'),102 ),
('Healthy Living', (SELECT User_ID FROM Users WHERE Full_Name = 'Jane Smith'), 112),
('Fashion Forward', (SELECT User_ID FROM Users WHERE Full_Name = 'Emily Davis'), 113),

('Toys Unlimited', (SELECT User_ID FROM Users WHERE Full_Name = 'Ava Lewis'), 114),
('Auto Parts Express', (SELECT User_ID FROM Users WHERE Full_Name = 'Benjamin Walker'), 115);

select * from Merchants;
select * from Products;

---- INSERT INTO Products ----
--- merchant 1
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES 
(1001, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Laptop', 1000, 'Available'),
(1002, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Smartphone', 800, 'Available'),
(1003, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Tablet', 600, 'Out of Stock'),
(1004, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Smartwatch', 200, 'Available'),
(1005, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Desktop', 1200, 'Out of Stock'),
(1006, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Monitor', 300, 'Available'),
(1007, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Gaming Console', 500, 'Out of Stock'),
(1008, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Keyboard', 100, 'Available'),
(1009, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Mouse', 50, 'Available'),
(1010, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Tech World'), 'Router', 150, 'Out of Stock');

INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES 
(1011, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'T-shirt', 20, 'Available'),
(1012, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Jeans', 50, 'Available'),
(1013, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Sneakers', 80, 'Out of Stock'),
(1014, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Jacket', 100, 'Available'),
(1015, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Sunglasses', 30, 'Out of Stock'),
(1016, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Hat', 25, 'Out of Stock'),
(1017, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Wristwatch', 200, 'Available'),
(1018, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Handbag', 150, 'Available'),
(1019, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Scarf', 40, 'Out of Stock'),
(1020, (SELECT Merchant_ID FROM Merchants WHERE Merchant_Name = 'Fashion Hub'), 'Belt', 35, 'Available');


 ---- Home Essentials
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES 
(1021, 3, 'Sofa', 600, 'Out of Stock'),
(1022, 3, 'Dining Table', 800, 'Available'),
(1023, 3, 'Bed Frame', 700, 'Out of Stock'),
(1024, 3, 'Refrigerator', 1000, 'Available'),
(1025, 3, 'Microwave', 150, 'Out of Stock'),
(1026, 3, 'Washing Machine', 900, 'Available'),
(1027, 3, 'Vacuum Cleaner', 300, 'Out of Stock'),
(1028, 3, 'Blender', 80, 'Available'),
(1029, 3, 'Air Conditioner', 1200, 'Available'),
(1030, 3, 'Medium Toaster', 60, 'Out of Stock'),
(1031, 3, 'Small Toaster', 40, 'Out of Stock'),
(1032, 3, 'Large Toaster', 70, 'Out of Stock');

-- Inserting products for Gadget Galaxy 
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(4001, 4, 'Smartphone X', 500, 'Available'),
(4002, 4, 'Laptop Pro 15', 1200, 'Available'),
(4003, 4, 'Wireless Earbuds', 150, 'Available'),
(4004, 4, 'Smartwatch S2', 300, 'Available'),
(4005, 4, 'Gaming Console Z', 400, 'Available'),
(4006, 4, 'Bluetooth Speaker', 80, 'Available'),
(4007, 4, 'Portable Charger', 50, 'Available'),
(4008, 4, 'Tablet 10.1', 600, 'Available'),
(4009, 4, 'Action Camera HD', 250, 'Available'),
(4010, 4, 'Drone 4K', 900, 'Available'),
(4011, 4, 'Wireless Charger', 50, 'Available'),
(4012, 4, 'Portable Charger', 50, 'Available');

-- Inserting products for Furniture Haven 
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(5001, 5, 'Modern Sofa', 1000, 'Out of Stock'),
(5002, 5, 'Dining Table Set', 800, 'Out of Stock'),
(5003, 5, 'Queen Bed Frame', 600, 'Available'),
(5004, 5, 'Office Chair', 200, 'Out of Stock'),
(5005, 5, 'Bookshelf Unit', 150, 'Available'),
(5006, 5, 'Recliner Chair', 400, 'Available'),
(5007, 5, 'Coffee Table', 120, 'Out of Stock'),
(5008, 5, 'Wardrobe 3-Door', 700, 'Available'),
(5009, 5, 'TV Stand', 250, 'Out of Stock'),
(5010, 5, 'Nightstand', 90, 'Out of Stock');

-- Inserting products for Furniture World
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(6001, 6, 'Leather Sofa', 1200, 'Available'),
(6002, 6, 'Wooden Dining Table', 800, 'Available'),
(6003, 6, 'King Size Bed', 1500, 'Available'),
(6004, 6, 'Recliner Sofa', 700, 'Out of Stock'),
(6005, 6, 'Coffee Table', 300, 'Available'),
(6006, 6, 'Wardrobe', 950, 'Out of Stock'),
(6007, 6, 'Office Desk', 450, 'Available'),
(6008, 6, 'Bookshelf', 200, 'Available'),
(6009, 6, 'TV Stand', 350, 'Available'),
(6010, 6, 'Nightstand', 150, 'Available');

-- Inserting products for Home Essentials 7
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(7001, 7, 'Kitchen Utensil Set', 75, 'Out of Stock'),
(7002, 7, 'Dining Chair Set', 250, 'Available'),
(7003, 7, 'Modern Lamp', 90, 'Out of Stock'),
(7004, 7, 'Wall Art', 120, 'Available'),
(7005, 7, 'Throw Blanket', 45, 'Out of Stock'),
(7006, 7, 'Rug', 150, 'Available'),
(7007, 7, 'Tableware Set', 60, 'Available'),
(7008, 7, 'Cabinet', 300, 'Available'),
(7009, 7, 'Sofa Bed', 500, 'Available'),
(7010, 7, 'Floor Lamp', 110, 'Available'),
(7011, 7, 'Medium Toaster', 50, 'Available'),
(7012, 7, 'Small Toaster', 30, 'Available'),
(7013, 7, 'Large Toaster', 80, 'Available');

-- Inserting products for Gadget Galaxy (Merchant_ID = 8)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(8001, 8, 'Smartphone Pro', 600, 'Out of Stock'),
(8002, 8, '4K Television', 1000, 'Available'),
(8003, 8, 'Bluetooth Headphones', 120, 'Available'),
(8004, 8, 'Smart Home Hub', 250, 'Available'),
(8005, 8, 'Tablet Pro', 700, 'Available'),
(8006, 8, 'Digital Camera', 800, 'Out of Stock'),
(8007, 8, 'Smartwatch Series 20', 350, 'Available'),
(8008, 8, 'Wireless Charger', 40, 'Available'),
(8009, 8, 'Gaming Monitor', 300, 'Available'),
(8010, 8, 'External Hard Drive', 150, 'Out of Stock');

-- Inserting products for Furniture Haven (Merchant_ID = 9)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(9001, 9, 'Leather Sofa', 1200, 'Available'),
(9002, 9, 'Wooden Dining Table', 800, 'Available'),
(9003, 9, 'King Size Bed', 1500, 'Available'),
(9004, 9, 'Recliner Sofa', 700, 'Out of Stock'),
(9005, 9, 'Coffee Table', 300, 'Available'),
(9006, 9, 'Wardrobe', 950, 'Out of Stock'),
(9007, 9, 'Office Desk', 450, 'Available'),
(9008, 9, 'Bookshelf', 200, 'Available'),
(9009, 9, 'TV Stand', 350, 'Available'),
(9010, 9, 'Nightstand', 150, 'Available');

-- Inserting products for Sports Gear (Merchant_ID = 10)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(1111, 10, 'Running Shoes', 120, 'Available'),
(1112, 10, 'Basketball', 35, 'Available'),
(1113, 10, 'Soccer Ball', 30, 'Available'),
(1114, 10, 'Tennis Racket', 85, 'Available'),
(1115, 10, 'Yoga Mat', 20, 'Available'),
(1116, 10, 'Dumbbells Set', 100, 'Available'),
(1117, 10, 'Swimming Goggles', 15, 'Available'),
(1118, 10, 'Sports Watch', 150, 'Available'),
(1119, 10, 'Baseball Glove', 40, 'Available'),
(1110, 10, 'Hiking Backpack', 90, 'Available');


--- Sports World (Merchant_ID = 11)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(1033, 11, 'Running Shoes', 120, 'Available'),
(1034, 11, 'Basketball', 35, 'Available'),
(1035, 11, 'Soccer Ball', 30, 'Available'),
(1036, 11, 'Tennis Racket', 85, 'Available'),
(1037, 11, 'Yoga Mat', 20, 'Available'),
(1038, 11, 'Dumbbells Set', 100, 'Available'),
(1039, 11, 'Swimming Goggles', 15, 'Available'),
(1040, 11, 'Sports Watch', 150, 'Available'),
(1041, 11, 'Baseball Glove', 40, 'Available'),
(1042, 11, 'Hiking Backpack', 90, 'Available'),
(1043, 11, 'Fitness Tracker', 180, 'Out of Stock'),
(1044, 11, 'Boxing Gloves', 60, 'Available');

-- Inserting products for Outdoor Adventures (Merchant_ID = 12)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(1201, 12, 'Camping Tent', 200, 'Out of Stock'),
(1202, 12, 'Hiking Boots', 150, 'Out of Stock'),
(1203, 12, 'Sleeping Bag', 80, 'Available'),
(1204, 12, 'Portable Stove', 70, 'Available'),
(1205, 12, 'Backpacking Backpack', 180, 'Available'),
(1206, 12, 'Flashlight', 20, 'Available'),
(1207, 12, 'Binoculars', 100, 'Available'),
(1208, 12, 'Water Bottle', 25, 'Available'),
(1209, 12, 'Trekking Poles', 50, 'Available'),
(1210, 12, 'Kayak', 500, 'Out of Stock'),
(1211, 12, 'Mountain Bike', 800, 'Available'),
(1212, 12, 'Climbing Rope', 120, 'Available');



-- Inserting products for Kitchen Supplies (Merchant_ID = 13) 
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(1313, 13, 'Mixing Bowl Set', 100, 'Available'),
(1314, 13, 'Chef\'s Apron', 25, 'Available'),
(1315, 13, 'Toaster', 40, 'Available'),
(1316, 13, 'Blender', 70, 'Out of Stock'),
(1317, 13, 'Knife Set', 300, 'Available'),
(1318, 13, 'Measuring Cups', 15, 'Available'),
(1319, 13, 'Cutting Board', 20, 'Available'),
(1320, 13, 'Spice Rack', 45, 'Available'),
(1321, 13, 'Frying Pan', 35, 'Available'),
(1322, 13, 'Microwave Oven', 120, 'Available'),
(1323, 13, 'Pressure Cooker', 90, 'Available'),
(1324, 13, 'Food Processor', 150, 'Out of Stock');

select * from Merchants;
select * from Products;

-- Inserting products for Pet Lovers (Merchant_ID = 14)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(2001, 14, 'Dog Leash', 15, 'Out of Stock'),
(2002, 14, 'Cat Food', 20, 'Out of Stock'),
(2003, 14, 'Bird Cage', 50, 'Available'),
(2004, 14, 'Fish Tank', 100, 'Available'),
(2005, 14, 'Hamster Wheel', 25, 'Out of Stock'),
(2006, 14, 'Dog Bed', 40, 'Available'),
(2007, 14, 'Cat Toy', 10, 'Out of Stock'),
(2008, 14, 'Dog Shampoo', 12, 'Available'),
(2009, 14, 'Cat Scratching Post', 35, 'Out of Stock'),
(2010, 14, 'Pet Carrier', 55, 'Available');

-- Inserting products for Bookstore Paradise (Merchant_ID = 15)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(3001, 15, 'Classic Novels Collection', 100, 'Available'),
(3002, 15, 'Childrens Picture Books', 20, 'Available'),
(3003, 15, 'Science Fiction Anthology', 45, 'Available'),
(3004, 15, 'History of Art', 60, 'Available'),
(3005, 15, 'Cookbook for Beginners', 30, 'Out of Stock'),
(3006, 15, 'Fantasy Novels Series', 80, 'Available'),
(3007, 15, 'Self-Help Books', 25, 'Available'),
(3008, 15, 'Travel Guides', 35, 'Available'),
(3009, 15, 'Mystery Thriller', 40, 'Available'),
(3010, 15, 'Biography of Historical Figures', 55, 'Available');

-- Inserting products for Healthy Living (Merchant_ID = 16)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES

(4013, 16, 'Protein Powder', 50, 'Out of Stock'),
(4014, 16, 'Essential Oils', 15, 'Available'),
(4015, 16, 'Herbal Tea Collection', 30, 'Available'),
(4016, 16, 'Fitness Tracker', 120, 'Available'),
(4017, 16, 'Detox Smoothie Mix', 40, 'Available'),
(4018, 16, 'Meditation Guide Book', 25, 'Available'),
(4019, 16, 'Organic Skin Care Set', 60, 'Available'),
(4020, 16, 'Vegan Cookbook', 35, 'Available'),
(4021, 16, 'Organic Vitamin Supplements', 25, 'Available'),
(4022, 16, 'Yoga Mat', 20, 'Available');

-- Inserting products for Fashion Forward (Merchant_ID = 17)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(5011, 17, 'Leather Jacket', 200, 'Available'),
(5012, 17, 'Designer Handbag', 300, 'Available'),
(5013, 17, 'Sunglasses', 150, 'Available'),
(5014, 17, 'High Heels', 120, 'Available'),
(5015, 17, 'Evening Gown', 400, 'Out of Stock'),
(5016, 17, 'Wristwatch', 250, 'Available'),
(5017, 17, 'Fashionable Sneakers', 80, 'Available'),
(5018, 17, 'T-shirt', 30, 'Available'),
(5019, 17, 'Jeans', 60, 'Available'),
(5020, 17, 'Scarf', 50, 'Available');

--- Inserting products for Toys Unlimited (Merchant_ID = 18)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(6011, 18, 'Action Figure Set', 50, 'Available'),
(6012, 18, 'Lego Building Blocks', 70, 'Available'),
(6013, 18, 'Remote Control Car', 45, 'Available'),
(6014, 18, 'Stuffed Animal', 25, 'Available'),
(6015, 18, 'Board Games', 35, 'Out of Stock'),
(6016, 18, 'Puzzle', 20, 'Available'),
(6017, 18, 'Toy Train Set', 55, 'Available'),
(6018, 18, 'Dollhouse', 100, 'Available'),
(6019, 18, 'Toy Kitchen Set', 80, 'Available'),
(6020, 18, 'Play-Doh Set', 15, 'Available');

--- Inserting products for Auto Parts Express (Merchant_ID = 19)
INSERT INTO Products (Product_ID, Merchant_ID, Product_Name, Product_Price, Status)
VALUES
(7014, 19, 'Car Battery', 150, 'Available'),
(7015, 19, 'Brake Pads', 50, 'Available'),
(7016, 19, 'Windshield Wipers', 30, 'Available'),
(7017, 19, 'Oil Filter', 20, 'Out of Stock'),
(7018, 19, 'Headlight Bulbs', 40, 'Available'),
(7019, 19, 'Car Floor Mats', 60, 'Available'),
(7020, 19, 'Tire Pressure Gauge', 15, 'Available'),
(7021, 19, 'Jump Starter Kit', 80, 'Available'),
(7022, 19, 'Car Wax Kit', 25, 'Available'),
(7023, 19, 'Spark Plugs', 10, 'Available');

select * from Countries;
select * from Users;
select * from Orders;

select * from Order_Items;
select * from Products;
select * from Merchants;

-- Inserting at least 5 unique order items per order
INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES
(1, 1013, 6),
(2, 1012, 10),
(3, 1014, 25),
(4, 1019, 15),
(5, 1020, 17),
(6, 1023, 16),
(7, 1025, 26),
(8, 7001, 36),
(9, 4005, 5),
(10, 4012, 10);
INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES
  (11, 1011, 30);
 INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES 
  (12, 1015, 12),
  (13, 1015, 20),
  (14, 1011, 25),
  (15, 1011, 16),
  (16, 1015, 25),
  (17, 1027, 5),
  (18, 8009, 16);
  INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES 
  (19, 1027, 5),
 (20, 1027, 6),
 (21, 1028, 15),
 (22, 8009, 10),
 (23, 1029, 10);
INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES 
(24, 8002, 15);
 INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES 
 (25, 7023, 30),
 (26, 1026, 6),
(27, 8002, 15),
(28, 1026, 16),
(29, 1017, 16),
(30, 1017, 20);
INSERT INTO Order_Items (Order_ID, Product_ID, Order_Quantity) VALUES 
(31, 8009, 25),
(32, 1029, 10),
(33, 1030, 6),
(34, 1015, 10),
(35, 1030, 15),
(36, 1031, 20),
(37, 1031, 7),
(38, 1032, 10),
(39, 8009, 5),
(40, 1032, 16),
(41, 4001, 15),
(42, 4010, 16),
(43, 8009, 6),
(44, 4011, 5),
(45, 4002, 15),
(46, 4011, 20),
(47, 4002, 8),
(48, 4011, 16),
(49, 2002, 20),
(50, 4010, 16),
(51, 4002, 30),
(52, 4008, 9),
(53, 4003, 6),
(54, 2007, 10),
(55, 2002, 5),
(56, 4009, 30),
(57, 4008, 16),
(58, 4010, 5),
(59, 4003, 10),
(60, 4009, 10),
(61, 4010, 15),
(62, 7001, 16),
(63, 3003, 16),
(64, 3003, 8),
(65, 1116, 10),
(66, 7002, 6),
(67, 1116, 7),
(68, 4021, 40),
(69, 7002, 8),
(70, 4021, 25),
(71, 7002, 10),
(72, 7013, 6),
(73, 7012, 18),
(74, 7013, 7),
(75, 4015, 35),
(76, 7012, 10),
(77, 7003, 10),
(78, 7004, 10),
(79, 7004, 16),
(80, 7003, 9),
(81, 7009, 6),
(82, 7005, 16),
(83, 7008, 1),
(84, 4019, 6),
(85, 7004, 10),
(86, 7009, 5),
(87, 7005, 10),
(88, 9003, 5),
(89, 7008, 7),
(90, 9003, 6);


 
 

                                               -- 3.  BASIC QUERIES --
                                               -------------------------

---- 3. 1--- Write a query to display the total number of orders made by each user.

SELECT u.User_ID, u.Full_Name, COUNT(o.Order_ID) AS Total_Orders 
FROM  Users u
JOIN Orders o ON u.User_ID   =  o.User_ID
GROUP BY u.User_ID, u.Full_Name;


 ---- 3. 2 ---Write a query to display the names of products that have been ordered at least once


SELECT DISTINCT p.Product_ID, p.Product_Name 
FROM Products p 
JOIN Order_Items oi ON p.Product_ID = oi.Product_ID;






---- 3. 3 --- Retrieve the details of all users who are from the same country as the merchant.

SELECT DISTINCT m.Merchant_ID, m.Merchant_Name, u.User_ID, 
u.Full_Name,  u.Country_Code,  c.Country_Name
FROM Merchants m
JOIN Users u ON  m.Country_Code  =  u.Country_Code
JOIN Countries c ON m.Country_Code = c.Country_Code
ORDER BY c.Country_Name DESC;



--- 4. Aggregate Function
 
--- 4. 1--- Calculate the total quantity of products ordered by each user.

SELECT u.User_ID, u.Full_Name, SUM(oi.Order_Quantity) 
AS Total_Quantity_Ordered FROM Users u
JOIN Orders o ON u.User_ID = o.User_ID
JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
GROUP BY u.User_ID, u.Full_Name
ORDER BY Total_Quantity_Ordered DESC;


--- 4. 2---Find the average order quantity for each product.

SELECT p.Product_ID, p.Product_Name, AVG(oi.Order_Quantity) 
AS Average_Order_Quantity 
FROM Products p
JOIN Order_Items oi ON p.Product_ID = oi.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Average_Order_Quantity DESC;

--- 4. 3--- Determine the minimum and maximum prices of the products


SELECT Product_ID, Product_Name, Product_Price AS Minimum_Price
FROM Products
ORDER BY Product_Price ASC
LIMIT 5;

SELECT Product_ID, Product_Name, Product_Price AS Maximum_Price
FROM Products
ORDER BY Product_Price DESC
LIMIT 5;


--- 4. 4---  Count the total number of merchants operating in each country.
SELECT c.Country_Name, 
       GROUP_CONCAT(m.Merchant_Name) AS merchant_names, 
       COUNT(m.Merchant_ID) AS Number_of_Merchants 
FROM Merchants m
JOIN Countries c ON m.Country_Code = c.Country_Code
GROUP BY c.Country_Name
ORDER BY Number_of_Merchants DESC;


 -- ============


--- 5 ---  Group By & Having Clauses

--- 5. 1 --- Group the orders by their status and count the number of orders in each status

SELECT Status, COUNT(Order_ID) AS Number_of_Orders
FROM Orders 
GROUP BY Status
ORDER BY Number_of_Orders DESC;

--- 5. 2 ---Group the products by merchant and display the total number of products offered by each merchant.

SELECT m.Merchant_Name, COUNT(p.Product_ID) 
AS Total_Number_Products 
FROM Products p
JOIN Merchants m ON p.Merchant_ID = m.Merchant_ID
GROUP BY m.Merchant_Name
Order by Total_Number_Products DESC ;


--- 5. 3 --- Show the users who have placed more than 3 orders.

SELECT u.User_ID, u.Full_Name, u.Email FROM Users u
JOIN Orders o ON u.User_ID = o.User_ID
GROUP BY  u.User_ID, u.Full_Name, u.Email 
HAVING COUNT(o.Order_ID) > 3;

SELECT u.User_ID, u.Full_Name, 
GROUP_CONCAT(o.Order_ID) AS Order_Numbers
FROM Users u
JOIN Orders o ON u.User_ID = o.User_ID
GROUP BY u.User_ID, u.Full_Name
HAVING COUNT(o.Order_ID) > 3
Limit 10;



--- 6 ---SQL Joins
                                                              
------ 6. 1 Perform an inner join between orders and users to retrieve all the orders along with the user full name

SELECT o.Order_ID, o.Status, o.Created_at 
AS Order_Date, u.Full_Name 
FROM Orders o
INNER JOIN Users u ON o.User_ID = u.User_ID;

    
------ 6. 2 Use a left join to retrieve all products and their respective orders. Include products that have not been ordered.

SELECT 
    p.Product_ID, 
    p.Product_Name, 
    p.Product_Price, 
    p.Status, 
    oi.Order_ID, 
    oi.Order_Quantity 
FROM 
    Products p
LEFT JOIN 
    Order_Items oi 
    ON p.Product_ID = oi.Product_ID
ORDER BY 
    oi.Order_ID IS NULL DESC;


------ 6. 3 Use a self-join to find users who share the same country code.

SELECT u1.User_ID AS User1_ID, u1.Full_Name AS User1_Full_Name, 
u2.User_ID AS User2_ID, u2.Full_Name AS User2_Full_Name, u1.Country_Code
FROM Users u1
JOIN Users u2 ON u1.Country_Code = u2.Country_Code
WHERE u1.User_ID < u2.User_ID
ORDER BY u1.Country_Code, u1.User_ID, u2.User_ID;
 
 ---------- ======================================== or 

SELECT u1.User_ID AS User1_ID, 
       u1.Full_Name AS User1_Full_Name, 
       u2.User_ID AS User2_ID, 
       u2.Full_Name AS User2_Full_Name, 
       u1.Country_Code
FROM Users u1
JOIN Users u2 
ON u1.Country_Code = u2.Country_Code 
AND u1.User_ID < u2.User_ID                                 -- This ensures unique combinations and avoids self-pairing
ORDER BY u1.Country_Code, u1.User_ID, u2.User_ID;




----- 7 --- Window Functions (Aggregate Functions)

------ 7. 1 Calculate the total number of orders for each user using a window function.

--  All users rows ------------------
SELECT u.Full_Name,  COUNT(Order_ID) OVER (PARTITION BY u.Full_Name) 
AS Total_Orders_per_User
FROM Users u 
JOIN Orders o ON u.User_ID = o.User_ID
ORDER BY Total_Orders_per_User ;

--  Bottom user for lowest orders 
SELECT u.Full_Name, o.User_ID, 
COUNT(o.Order_ID) OVER (PARTITION BY o.User_ID) 
AS Total_Orders_per_User
FROM Orders o
JOIN Users u ON o.User_ID = u.User_ID
ORDER BY Total_Orders_per_User  ASC;

--  Top user for more orders ------------------
SELECT u.Full_Name, 
o.User_ID, 
COUNT(o.Order_ID) OVER (PARTITION BY o.User_ID) 
AS Total_Orders_per_User
FROM Orders o
JOIN Users u ON o.User_ID = u.User_ID
ORDER BY Total_Orders_per_User DESC;



------ 7. 2 Calculate the average price of products over all orders using a window function
 
SELECT 
       p.Product_ID,
       p.Product_Name,
       p.Product_Price,
       AVG(p.Product_Price) OVER () AS Average_Product_Price

FROM Products p
JOIN Order_Items oi ON p.Product_ID = oi.Product_ID;

-------------------- for further enquiry --------------
-------------------
SELECT 
    p.product_id,
    p.product_name,
    p.product_price,
    AVG(p.product_price) OVER () AS Average_Product_Price
FROM 
    (SELECT DISTINCT p.product_id, p.product_name, p.product_price
     FROM Products p
     JOIN Order_Items oi ON p.product_id = oi.product_id) AS p
     ORDER BY Average_Product_Price ASC ,product_price ASC;
     ----------- for further enquiry -------------
     -------------- for further enquiry -------------

------ 7. Window Functions (Ranking) ------ 

------ 7. 1 Rank the users based on the total quantity of products ordered using ROW_NUMBER().
WITH Use_Orde_Quantities AS (
    SELECT o.User_ID, SUM(oi.Order_Quantity) AS Total_Quantity
    FROM Orders o
    JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
    GROUP BY o.User_ID
),
Ranked_Users AS (
    SELECT u.User_ID, u.Full_Name, uq.Total_Quantity,
        ROW_NUMBER() OVER (ORDER BY uq.Total_Quantity DESC) AS `Rank`
    FROM Users u
    JOIN Use_Orde_Quantities uq ON u.User_ID = uq.User_ID
)
    SELECT User_ID, Full_Name, Total_Quantity,`Rank`
    FROM Ranked_Users;

------- 7. 2 Use RANK() to rank products based on their price within each merchant.

WITH RankedProducts AS (
    SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Merchant_ID,
	RANK() OVER (PARTITION BY p.Merchant_ID ORDER BY p.Product_Price DESC) AS `Rank`
    FROM Products p
)
    SELECT
    Product_ID, Product_Name, Product_Price, Merchant_ID,`Rank`
    FROM RankedProducts
    ORDER BY Merchant_ID,`Rank`;
 
------- 7. 3 Determine the DENSE_RANK() of orders by their created date.

WITH RankedOrders AS (
    SELECT o.Order_ID, o.User_ID, o.Status, o.Created_at,
	DENSE_RANK() OVER (ORDER BY o.Created_at) AS `Rank`
    FROM Orders o
)
    SELECT Order_ID, User_ID, Status, Created_at, `Rank`
    FROM RankedOrders
    ORDER BY `Rank`;

------- 7. 4 Use PERCENT_RANK() to find the rank of orders by their quantity compared to the overall total.

WITH Order_Totals AS (
    SELECT o.Order_ID, SUM(oi.Order_Quantity) AS Total_Quantity
    FROM Orders o
    JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
    GROUP BY o.Order_ID
)
    SELECT Order_ID, Total_Quantity,
    PERCENT_RANK() OVER (ORDER BY Total_Quantity ASC) AS Quantity_Rank
    FROM Order_Totals
    ORDER BY Quantity_Rank DESC;




------- 7. Window Functions (Value/Analytic)

------- 7.1 
SELECT 
    o.User_ID, 
    o.Order_ID, 
    o.Created_at AS Current_Order_Date,
    LEAD(o.Created_at) OVER (PARTITION BY o.User_ID ORDER BY o.Created_at) 
    AS Next_Order_Date
FROM Orders o;



------- 7.2 Use LAG() to determine the previous order for each product.
WITH OrderDetails AS (
    SELECT oi.Order_ID, oi.Product_ID, oi.Order_Quantity, o.Created_at AS Order_Date,
	LAG(o.Created_at) OVER (PARTITION BY oi.Product_ID ORDER BY o.Created_at) 
    AS Previous_Order_Date
    FROM Order_Items oi
    JOIN Orders o ON oi.Order_ID = o.Order_ID
)
    SELECT Order_ID, Product_ID, Order_Quantity, Order_Date, Previous_Order_Date
    FROM OrderDetails
    ORDER BY Product_ID, Order_Date;


------- 7.3 Retrieve the FIRST_VALUE() and LAST_VALUE() of order statuses for each user.

SELECT 
    o.User_ID, 
    FIRST_VALUE(o.Status) OVER (PARTITION BY o.User_ID ORDER BY o.Created_at) 
    AS First_Order_Status,
    LAST_VALUE(o.Status) OVER (PARTITION BY o.User_ID ORDER BY o.Created_at 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
        AS Last_Order_Status
FROM Orders o;


------------------ Not operated 
--------------- Not operated 

SELECT 
    o.user_id,
    FIRST_VALUE(o.status_update) OVER (PARTITION BY o.user_id ORDER BY o.Created_at) AS First_Order_Status,
    (SELECT o2.status_update 
     FROM Orders o2 
     WHERE o2.user_id = o.user_id 
     ORDER BY o2.Created_at DESC 
     LIMIT 1) AS Last_Order_Status
FROM Orders o;
---------------------- Not operated 
---------------------- Not operated 

------- 7.4 Find the FIRST_VALUE() and LAST_VALUE() of prices in each product category.


WITH Ranked_Products AS (
    SELECT 
        Product_ID, 
        Product_Name, 
        Merchant_ID, 
        Product_Price,
        FIRST_VALUE(Product_Price) OVER (PARTITION BY Merchant_ID ORDER BY Product_Price) 
        AS First_Price,
        LAST_VALUE(Product_Price) OVER (PARTITION BY Merchant_ID ORDER BY Product_Price 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_Price,
        ROW_NUMBER() OVER (PARTITION BY Merchant_ID ORDER BY Product_Price ASC) AS Row_Lowest,
        ROW_NUMBER() OVER (PARTITION BY Merchant_ID ORDER BY Product_Price DESC) AS Row_Highest
    FROM Products
)
SELECT *
FROM Ranked_Products
WHERE Row_Lowest = 1 OR Row_Highest = 1;



------- 8. Subqueries------- 

------- 8. 1 Write a subquery to find the users who have placed orders but have not ordered a particular product.

SELECT u.User_ID, u.Full_Name
FROM Users u
WHERE u.User_ID IN (
    SELECT o.User_ID
    FROM Orders o
    JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
)
AND u.User_ID NOT IN (
    SELECT o.User_ID
    FROM Orders o
    JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
    WHERE oi.Product_ID = '7005' 
    );      
-- Replace 'oi.Product_ID = '7005' ' with the particular Product_ID


------- 8. 2   Use a correlated subquery to find users who have placed more orders than the average number of orders --- 

SELECT u.User_ID, u.Full_Name
FROM Users u
WHERE (
    SELECT COUNT(o.Order_ID)
    FROM Orders o
    WHERE o.User_ID = u.User_ID
) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(o2.Order_ID) AS order_count
        FROM Orders o2
        GROUP BY o2.User_ID
    ) AS avg_orders
);




----- 9 Case_Statements
--- 9 . 1 Write a query to categorize products into 'Low Price', 'Medium Price', and 'High Price' based on their price.

SELECT 
    Product_ID, Product_Name, Product_Price,
    CASE
        WHEN Product_Price < 500 THEN 'Low Price'
        WHEN Product_Price BETWEEN 500 AND 900 THEN 'Medium Price'
        ELSE 'High Price'
    END AS Price_Category
    FROM Products ORDER BY Product_ID; 
    
  --- 9 . 2 Create a case statement that categorizes users as 'New', 'Regular', or 'VIP' based on the number of orders they have placed.

SELECT User_ID, COUNT(Order_ID) AS Number_of_Orders,
    CASE
        WHEN COUNT(Order_ID) = 5 THEN 'New'
        WHEN COUNT(Order_ID) BETWEEN 5 AND 7 THEN 'Regular'
        ELSE 'VIP'
    END AS User_Category
FROM Orders
GROUP BY User_ID 
ORDER BY Number_of_Orders DESC;
  
  
  
  
--- 10 Date and Time Operations

--- 10 . 1 Extract the year and month from the created_at date of orders.

SELECT 
    EXTRACT(YEAR FROM created_at) AS Year,
    EXTRACT(MONTH FROM created_at) AS Month
FROM Orders;


--- 10 . 2  Calculate the difference in days between the first and last order of each user

SELECT User_ID,
    DATEDIFF(MAX(created_at), MIN(created_at)) AS Days_Difference
FROM Orders
GROUP BY User_ID;
-----------------
-----
SELECT u.User_ID, u.Full_Name,
    DATEDIFF(
        (SELECT MAX(created_at) FROM Orders o WHERE o.User_ID = u.User_ID),
        (SELECT MIN(created_at) FROM Orders o WHERE o.User_ID = u.User_ID)
    ) AS days_between_first_last_order
FROM Users u;
-----------
---------------

--- 10 . 3   Use DATE_PART() to extract the day of the week from the created_at column for all orders 

SELECT Order_ID, created_at,
    CASE DAYOFWEEK(created_at)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END AS Day_Name
FROM Orders;
-------
----


SELECT Order_ID, DATE_FORMAT(created_at, '%W') 
AS Day_of_week
FROM Orders
LIMIT 1000;

 -- =======




--- 11  Common Table Expressions (CTE)

--- 11 . 1  Write a CTE to calculate the cumulative total of products ordered by each user.

WITH Cumulative_Product_Order  AS (
    SELECT o.User_ID, SUM(oi.Order_Quantity) AS Total_Quantity
    FROM Orders o
    JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
    GROUP BY o.User_ID
)
SELECT User_ID, Total_Quantity AS Cumulative_Total_Products
FROM Cumulative_Product_Order 
ORDER BY Cumulative_Total_Products DESC;


--- 11 . 2    Use a CTE to find the top 5 users with the highest number of orders.
WITH User_Order_Count AS (
    SELECT o.User_ID, COUNT(o.Order_ID) AS Total_Orders
    FROM Orders o
    GROUP BY o.User_ID
)
SELECT User_ID, Total_Orders
FROM User_Order_Count
ORDER BY Total_Orders DESC
LIMIT 5;

