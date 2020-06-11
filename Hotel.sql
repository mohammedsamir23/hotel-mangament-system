IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Hotel')
CREATE DATABASE Hotel;

IF  EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Hotel')
USE Hotel;


if NOT exists (select * from sysobjects where name='employees' and xtype='U')
CREATE TABLE employees
(
	ssn INT PRIMARY KEY IDENTITY(1,1),
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	phone INT NOT NULL,
	salary INT NOT NULL,


);


if NOT exists (select * from sysobjects where name='customers' and xtype='U')
CREATE TABLE customers
(
	cust_id INT PRIMARY KEY IDENTITY(1,1),
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	phone INT NOT NULL,

);


if NOT exists (select * from sysobjects where name='rooms' and xtype='U')
CREATE TABLE rooms
(
	room_id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	price int NOT NULL,
	floor_No int NOT NULL,

);


if NOT exists (select * from sysobjects where name='booking' and xtype='U')
CREATE TABLE booking
(
	booking_id INT PRIMARY KEY IDENTITY(1,1),
	cust_id INT NOT NULL,
	room_id INT NOT NULL,
	No_of_nights INT NOT NULL,
	date DATE NOT NULL , 
	check_in_date DATE NOT NULL , 
	check_out_date DATE NOT NULL , 
	state BIT NOT NULL ,
	price int NOT NULL,

	constraint fk_booking_customers FOREIGN KEY  (cust_id)
		REFERENCES customers (cust_id) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	
	constraint fk_booking_rooms FOREIGN KEY  (room_id)
		REFERENCES rooms (room_id) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	

	

);

