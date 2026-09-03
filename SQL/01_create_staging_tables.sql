-- =============================================
-- Script: Create Staging Tables
-- Database: SalesStaging
-- Author: Mohamed Ashraf
-- =============================================

USE SalesStaging;

-- Sales Orders
IF OBJECT_ID('dbo.STG_SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.STG_SalesOrders;
CREATE TABLE STG_SalesOrders (
    SalesOrderID INT,
    OrderDate VARCHAR(50),
    CustomerID INT,
    TerritoryID INT,
    TotalDue VARCHAR(50),
    Status VARCHAR(20),
    OnlineOrderFlag VARCHAR(10)
);

-- Sales Order Details
IF OBJECT_ID('dbo.STG_SalesOrderDetails', 'U') IS NOT NULL DROP TABLE dbo.STG_SalesOrderDetails;
CREATE TABLE STG_SalesOrderDetails (
    SalesOrderID INT,
    SalesOrderDetailID INT,
    ProductID INT,
    OrderQty VARCHAR(20),
    UnitPrice VARCHAR(50),
    LineTotal VARCHAR(50)
);

-- Customers
IF OBJECT_ID('dbo.STG_Customers', 'U') IS NOT NULL DROP TABLE dbo.STG_Customers;
CREATE TABLE STG_Customers (
    CustomerID INT,
    PersonID VARCHAR(20),
    StoreID VARCHAR(20),
    TerritoryID INT
);

-- Products
IF OBJECT_ID('dbo.STG_Products', 'U') IS NOT NULL DROP TABLE dbo.STG_Products;
CREATE TABLE STG_Products (
    ProductID INT,
    Name VARCHAR(200),
    ProductNumber VARCHAR(50),
    ProductCategoryID VARCHAR(20),
    ListPrice VARCHAR(50),
    Color VARCHAR(50),
    Size VARCHAR(20)
);

-- Product Categories
IF OBJECT_ID('dbo.STG_ProductCategories', 'U') IS NOT NULL DROP TABLE dbo.STG_ProductCategories;
CREATE TABLE STG_ProductCategories (
    ProductCategoryID INT,
    Name VARCHAR(100)
);

-- Territories
IF OBJECT_ID('dbo.STG_Territories', 'U') IS NOT NULL DROP TABLE dbo.STG_Territories;
CREATE TABLE STG_Territories (
    TerritoryID INT,
    Name VARCHAR(100),
    CountryRegionCode VARCHAR(10),
    Group_ VARCHAR(50)
);

PRINT 'Staging tables created successfully.';
