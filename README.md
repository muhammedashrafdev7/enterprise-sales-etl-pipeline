🏭 Enterprise Sales ETL Pipeline — SSIS & SQL Server

An end-to-end ETL pipeline built with SQL Server Integration Services (SSIS) that extracts sales data from an OLTP source, transforms and loads it through a staging layer into a star schema data warehouse, and delivers business insights via a Power BI dashboard.

📌 Project Overview

This project simulates a real-world enterprise ETL workflow using the AdventureWorks2022 database as the OLTP source. Raw transactional data is extracted, staged, transformed, and loaded into a clean star schema data warehouse optimized for analytical reporting.

🏗️ Architecture
AdventureWorks2022 (OLTP Source)
        ↓
   SalesStaging (Raw Landing Zone)
        ↓
   AdventureWorksDW2022 (Star Schema Data Warehouse)
        ↓
   Power BI Dashboard
⚙️ Tech Stack
Tool	Purpose
SQL Server 2025 Developer	Database engine
SSIS (Visual Studio 2022)	ETL pipeline development
SSMS 22	Database management
T-SQL	Data transformation
Power BI Desktop	Business intelligence dashboard
📊 Star Schema Design
        DIM_Customer
             │
DIM_Date ──FACT_Sales── DIM_Product
             │
        DIM_Territory
Dimension Tables
Table	Description	Rows
DIM_Customer	Customer demographics and territory	19,119
DIM_Product	Product details and categories	504
DIM_Territory	Sales territory and region info	10
DIM_Date	Date dimension (2010–2025)	5,844
Fact Table
Table	Description	Rows
FACT_Sales	Sales transactions with surrogate keys	5,842,559
📦 SSIS Packages
01_Load_Staging.dtsx

Extracts data from AdventureWorks2022 OLTP source and loads into staging tables.

Data Flow Tasks:

Load SalesOrders → STG_SalesOrders (31,465 rows)
Load SalesOrderDetails → STG_SalesOrderDetails
Load Customers → STG_Customers
Load Products → STG_Products
Load ProductCategories → STG_ProductCategories
Load Territories → STG_Territories
02_Load_Dimensions.dtsx

Transforms and loads staging data into dimension tables with surrogate key generation.

Data Flow Tasks:

Load DIM_Territory (with standardized region data)
Load DIM_Product (with category joins)
Load DIM_Customer (with territory lookup)

Transforms Used: Derived Column, Lookup, OLE DB Destination

03_Load_Facts.dtsx

Joins staging tables, resolves surrogate keys via Lookup transforms, and loads FACT_Sales.

Pipeline:

STG Source (5.8M rows)
    ↓ Lookup → ProductKey
    ↓ Lookup → CustomerKey
    ↓ Lookup → TerritoryKey
    ↓ FACT_Sales (5,842,559 rows loaded)
04_Master.dtsx

Orchestrates all packages in sequence via Execute Package Tasks.

01_Load_Staging
      ↓
02_Load_Dimensions
      ↓
03_Load_Facts
🗄️ Database Structure
SalesStaging (Landing Zone)
sql
STG_SalesOrders
STG_SalesOrderDetails
STG_Customers
STG_Products
STG_ProductCategories
STG_Territories
AdventureWorksDW2022 (Data Warehouse)
sql
DIM_Customer
DIM_Product
DIM_Territory
DIM_Date
FACT_Sales



📁 Project Structure
enterprise-sales-etl-pipeline/
├── SSIS/
│   ├── AdventureWorks_ETL.sln
│   ├── 01_Load_Staging.dtsx
│   ├── 02_Load_Dimensions.dtsx
│   ├── 03_Load_Facts.dtsx
│   └── 04_Master.dtsx
├── SQL/
│   ├── 01_create_staging_tables.sql
│   ├── 02_create_dw_tables.sql
│   └── 03_populate_dim_date.sql
├── PowerBI/
│   └── SalesDashboard.pbix
├── screenshots/
│   ├── ssis_master_package.png
│   ├── ssis_fact_dataflow.png
│   └── powerbi_dashboard.png
└── README.md

🔑 Key Highlights
✅ 5.8 million records processed through 3 chained Lookup transforms
✅ Surrogate key resolution for all 3 dimension tables
✅ Staging layer separating raw and clean data
✅ Master package for full pipeline orchestration
✅ Star schema optimized for analytical queries
