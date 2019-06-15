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

/*
   Saturday, June 15, 20197:29:26 PM
   User: 
   Server: DESKTOP-96O2KIS\SQLEXPRESS
   Database: OnlineShop
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Product
	(
	ID uniqueidentifier NOT NULL,
	Name nvarchar(250) NULL,
	Code varchar(250) NULL,
	CategoryID uniqueidentifier NULL,
	Image nvarchar(250) NULL,
	Size nvarchar(10) NULL,
	Colors nvarchar(50) NULL,
	PromotionPrice decimal(18, 0) NULL,
	Price decimal(18, 0) NULL,
	Quantity int NULL,
	CreatedDate datetime NULL,
	CreatedBy varchar(50) NULL,
	Status nchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	DF_Product_Price DEFAULT 0 FOR Price
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	DF_Product_Quantity DEFAULT 0 FOR Quantity
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	DF_Product_CreatedDate DEFAULT getdate() FOR CreatedDate
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	DF_Product_Status DEFAULT 1 FOR Status
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	PK_Product PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Product SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Orders
	(
	ID uniqueidentifier NOT NULL,
	CustomerName nvarchar(250) NULL,
	CustomerAddres nvarchar(250) NULL,
	CustomerPhoneNumber nvarchar(10) NULL,
	CreatedDate datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Orders ADD CONSTRAINT
	DF_Orders_CreatedDate DEFAULT getdate() FOR CreatedDate
GO
ALTER TABLE dbo.Orders ADD CONSTRAINT
	PK_Orders PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Orders SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProductCategory
	(
	ID uniqueidentifier NOT NULL,
	Name nvarchar(250) NULL,
	Description nvarchar(250) NULL,
	CreatedDate nchar(10) NULL,
	Status nchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProductCategory ADD CONSTRAINT
	DF_ProductCategory_CreatedDate DEFAULT getdate() FOR CreatedDate
GO
ALTER TABLE dbo.ProductCategory ADD CONSTRAINT
	DF_ProductCategory_Status DEFAULT 1 FOR Status
GO
ALTER TABLE dbo.ProductCategory ADD CONSTRAINT
	PK_ProductCategory PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProductCategory SET (LOCK_ESCALATION = TABLE)
GO
COMMIT