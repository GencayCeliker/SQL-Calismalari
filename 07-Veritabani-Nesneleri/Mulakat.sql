/* Mulakat veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'Mulakat') IS NULL CREATE DATABASE [Mulakat];
GO
USE [Mulakat];
GO

CREATE TABLE [dbo].[Musteriler] (
    [musteri_id] int NOT NULL,
    [ad] varchar(50) NOT NULL,
    [soyad] varchar(50) NOT NULL,
    [telefon] varchar(15) NULL,
    [sehir_id] int NULL,
    CONSTRAINT [PK__Musteril__966D46E291F419C4] PRIMARY KEY ([musteri_id])
);
GO

CREATE TABLE [dbo].[Sehirler] (
    [sehir_id] int NOT NULL,
    [sehir_adi] varchar(50) NOT NULL,
    CONSTRAINT [PK__Sehirler__4E033128B3C38852] PRIMARY KEY ([sehir_id])
);
GO

INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (101, N'Ahmet', N'Yılmaz', N'05550000001', 34);
INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (102, N'Ayşe', N'Kaya', N'05550000002', 6);
INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (103, N'Mehmet', N'Demir', N'05550000003', 35);
INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (104, N'Fatma', N'Çelik', N'05550000004', 34);
INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (105, N'Ali', N'Can', N'05550000005', 7);
INSERT INTO [dbo].[Musteriler] ([musteri_id], [ad], [soyad], [telefon], [sehir_id]) VALUES (106, N'Zeynep', N'Şahin', N'05550000006', 1);
GO

INSERT INTO [dbo].[Sehirler] ([sehir_id], [sehir_adi]) VALUES (1, N'Adana');
INSERT INTO [dbo].[Sehirler] ([sehir_id], [sehir_adi]) VALUES (6, N'Ankara');
INSERT INTO [dbo].[Sehirler] ([sehir_id], [sehir_adi]) VALUES (7, N'Antalya');
INSERT INTO [dbo].[Sehirler] ([sehir_id], [sehir_adi]) VALUES (34, N'İstanbul');
INSERT INTO [dbo].[Sehirler] ([sehir_id], [sehir_adi]) VALUES (35, N'İzmir');
GO

ALTER TABLE [dbo].[Musteriler] ADD CONSTRAINT [FK__Musterile__sehir__4CA06362] FOREIGN KEY ([sehir_id]) REFERENCES [dbo].[Sehirler] ([sehir_id]);
GO
