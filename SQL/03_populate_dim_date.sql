-- =============================================
-- Script: Populate DIM_Date
-- Database: AdventureWorksDW2022
-- Author: Mohamed Ashraf
-- =============================================

USE AdventureWorksDW2022;

TRUNCATE TABLE DIM_Date;

DECLARE @StartDate DATE = '2010-01-01'
DECLARE @EndDate DATE = '2025-12-31'

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO DIM_Date
    VALUES (
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')),
        @StartDate,
        DAY(@StartDate),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        DATEPART(QUARTER, @StartDate),
        YEAR(@StartDate),
        DATENAME(WEEKDAY, @StartDate)
    )
    SET @StartDate = DATEADD(DAY, 1, @StartDate)
END

PRINT 'DIM_Date populated successfully with ' + CAST(@@ROWCOUNT AS VARCHAR) + ' rows.';
