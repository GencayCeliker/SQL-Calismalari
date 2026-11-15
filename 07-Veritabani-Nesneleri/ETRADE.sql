/* ETRADE veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'ETRADE') IS NULL CREATE DATABASE [ETRADE];
GO
USE [ETRADE];
GO

CREATE TABLE [dbo].[CUSTOMERS] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CUSTOMERNAME] nvarchar(100) NULL,
    [CITY] varchar(50) NULL,
    [BIRTHDATE] date NULL,
    [DISTRICT] varchar(50) NULL,
    [GENDER] varchar(1) NULL,
    [AGE] int NULL,
    [NATION] varchar(2) NULL,
    CONSTRAINT [PK_CUSTOMERS_1] PRIMARY KEY ([ID])
);
GO


create function dbo.hacim(@r float)
returns float --sayıları geri

as begin 
return (4.0/3.0)*PI()*@r*@r*@r --geri döndürme
end
GO
