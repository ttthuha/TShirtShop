create database OnlineShop
use OnlineShop
drop table CUSTOMER;

CREATE TABLE CUSTOMER (
  CustomerID uniqueidentifier NOT NULL,
  CustomerFullName varchar(100) NOT NULL,
  CustomerPhoneNumber varchar(10) UNIQUE NOT NULL,
  CustomerEmail varchar(50) NOT NULL,
  CustomerPassword varchar(45) NOT NULL
  PRIMARY KEY (CustomerID)
) 

select * from Customer;