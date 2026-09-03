-- =============================================
-- Script: Create Data Warehouse Tables
-- Database: AdventureWorksDW2022
-- Author: Mohamed Ashraf
-- =============================================

USE AdventureWorksDW2022;

-- DIM_Customer
IF OBJECT_ID('dbo.DIM_Customer', 'U') IS NOT NULL DROP TABLE dbo.DIM_Customer;
CREATE TABLE DIM_Customer (
    CustomerKey INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    FullName VARCHAR(100),
    EmailAddress VARCHAR(100),
    Territory VARCHAR(50)
);

-- DIM_Product
IF OBJECT_ID('dbo.DIM_Product', 'U') IS NOT NULL DROP TABLE dbo.DIM_Product;
CREATE TABLE DIM_Product (
    ProductKey INT PRIMARY KEY IDENTITY,
    ProductID INT,
    ProductName VARCHAR(200),
    ProductNumber VARCHAR(50),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    ListPrice DECIMAL(10,2),
    Color VARCHAR(50)
);

-- DIM_Territory
IF OBJECT_ID('dbo.DIM_Territory', 'U') IS NOT NULL DROP TABLE dbo.DIM_Territory;
CREATE TABLE DIM_Territory (
    TerritoryKey INT PRIMARY KEY IDENTITY,
    TerritoryID INT,
    TerritoryName VARCHAR(100),
    CountryRegionCode VARCHAR(10),
    Region VARCHAR(50)
);

-- DIM_Date
IF OBJECT_ID('dbo.DIM_Date', 'U') IS NOT NULL DROP TABLE dbo.DIM_Date;
CREATE TABLE DIM_Date (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Day INT,
    Month INT,
    MonthName VARCHAR(20),
    Quarter INT,
    Year INT,
    DayOfWeek VARCHAR(15)
);

-- FACT_Sales
IF OBJECT_ID('dbo.FACT_Sales', 'U') IS NOT NULL DROP TABLE dbo.FACT_Sales;
CREATE TABLE FACT_Sales (
    SalesKey INT PRIMARY KEY IDENTITY,
    DateKey INT FOREIGN KEY REFERENCES DIM_Date(DateKey),
    CustomerKey INT FOREIGN KEY REFERENCES DIM_Customer(CustomerKey),
    ProductKey INT FOREIGN KEY REFERENCES DIM_Product(ProductKey),
    TerritoryKey INT FOREIGN KEY REFERENCES DIM_Territory(TerritoryKey),
    SalesOrderID INT,
    SalesOrderDetailID INT,
    OrderQty INT,
    UnitPrice DECIMAL(10,2),
    LineTotal DECIMAL(10,2),
    TotalDue DECIMAL(10,2)
);

PRINT 'Data Warehouse tables created successfully.';
