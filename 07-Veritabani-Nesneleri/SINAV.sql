/* SINAV veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'SINAV') IS NULL CREATE DATABASE [SINAV];
GO
USE [SINAV];
GO

CREATE TABLE [dbo].[FiyatLog] (
    [LogID] int IDENTITY(1,1) NOT NULL,
    [UrunID] int NULL,
    [EskiFiyat] decimal(10,2) NULL,
    [YeniFiyat] decimal(10,2) NULL,
    [DegisimTarihi] datetime NULL DEFAULT (getdate()),
    CONSTRAINT [PK__FiyatLog__5E5499A84E5F9BF9] PRIMARY KEY ([LogID])
);
GO

CREATE TABLE [dbo].[MAASLAR] (
    [MaasID] int IDENTITY(1,1) NOT NULL,
    [PID] int NULL,
    [Maas] int NULL,
    CONSTRAINT [PK__MAASLAR__22D00316E74FCE23] PRIMARY KEY ([MaasID])
);
GO

CREATE TABLE [dbo].[PERSONEL] (
    [PID] int IDENTITY(1,1) NOT NULL,
    [PAdi] nvarchar(100) NULL,
    [PSoyadi] nvarchar(100) NULL,
    [TCKimlik] nchar(11) NULL,
    [Unvan] int NULL,
    [CSayisi] int NULL,
    [Kira] bit NULL,
    CONSTRAINT [PK__PERSONEL__C5775520261D169D] PRIMARY KEY ([PID])
);
GO

CREATE TABLE [dbo].[UNVANLAR] (
    [UnvanID] int IDENTITY(1,1) NOT NULL,
    [UnvanAdi] nvarchar(100) NULL,
    [Tazminat] int NULL,
    CONSTRAINT [PK__UNVANLAR__2343138A1028C28A] PRIMARY KEY ([UnvanID])
);
GO

CREATE TABLE [dbo].[Urunler] (
    [UrunID] int IDENTITY(1,1) NOT NULL,
    [UrunAd] varchar(100) NULL,
    [Kategori] varchar(50) NULL,
    [Fiyat] decimal(10,2) NULL,
    [StokAdet] int NULL,
    CONSTRAINT [PK__Urunler__623D364B64E45A4F] PRIMARY KEY ([UrunID])
);
GO

SET IDENTITY_INSERT [dbo].[MAASLAR] ON;
INSERT INTO [dbo].[MAASLAR] ([MaasID], [PID], [Maas]) VALUES (1, 1, 234001);
INSERT INTO [dbo].[MAASLAR] ([MaasID], [PID], [Maas]) VALUES (2, 2, 399000);
INSERT INTO [dbo].[MAASLAR] ([MaasID], [PID], [Maas]) VALUES (3, 5, 221000);
INSERT INTO [dbo].[MAASLAR] ([MaasID], [PID], [Maas]) VALUES (4, 6, 231000);
SET IDENTITY_INSERT [dbo].[MAASLAR] OFF;
GO

SET IDENTITY_INSERT [dbo].[PERSONEL] ON;
INSERT INTO [dbo].[PERSONEL] ([PID], [PAdi], [PSoyadi], [TCKimlik], [Unvan], [CSayisi], [Kira]) VALUES (1, N'Buğrahan', N'Yılmaz', N'10000000001', 2, 3, 1);
INSERT INTO [dbo].[PERSONEL] ([PID], [PAdi], [PSoyadi], [TCKimlik], [Unvan], [CSayisi], [Kira]) VALUES (2, N'Aynur', N'Sude', N'10000000002', 1, 8, 0);
INSERT INTO [dbo].[PERSONEL] ([PID], [PAdi], [PSoyadi], [TCKimlik], [Unvan], [CSayisi], [Kira]) VALUES (5, N'Buğrahankjkj', N'Yılmaz', N'10000000001', 2, 3, 1);
INSERT INTO [dbo].[PERSONEL] ([PID], [PAdi], [PSoyadi], [TCKimlik], [Unvan], [CSayisi], [Kira]) VALUES (6, N'Kemal', N'Aslan', N'10000000003', 2, 8, 1);
SET IDENTITY_INSERT [dbo].[PERSONEL] OFF;
GO

SET IDENTITY_INSERT [dbo].[UNVANLAR] ON;
INSERT INTO [dbo].[UNVANLAR] ([UnvanID], [UnvanAdi], [Tazminat]) VALUES (1, N'Genel Müdür', 300000);
INSERT INTO [dbo].[UNVANLAR] ([UnvanID], [UnvanAdi], [Tazminat]) VALUES (2, N'Kısım Amiri', 150000);
INSERT INTO [dbo].[UNVANLAR] ([UnvanID], [UnvanAdi], [Tazminat]) VALUES (3, N'Memur', 100000);
INSERT INTO [dbo].[UNVANLAR] ([UnvanID], [UnvanAdi], [Tazminat]) VALUES (4, N'Usta Başı', 115000);
INSERT INTO [dbo].[UNVANLAR] ([UnvanID], [UnvanAdi], [Tazminat]) VALUES (5, N'İşçi', 15000);
SET IDENTITY_INSERT [dbo].[UNVANLAR] OFF;
GO

SET IDENTITY_INSERT [dbo].[Urunler] ON;
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (1, N'Laptop', N'Elektronik', 15000.00, 10);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (2, N'Telefon', N'Elektronik', 8000.00, 20);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (3, N'Klavye', N'Aksesuar', 500.00, 50);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (4, N'Mouse', N'Aksesuar', 300.00, 40);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (5, N'Monitör', N'Elektronik', 3000.00, 15);
SET IDENTITY_INSERT [dbo].[Urunler] OFF;
GO

ALTER TABLE [dbo].[MAASLAR] ADD CONSTRAINT [FK__MAASLAR__PID__4F7CD00D] FOREIGN KEY ([PID]) REFERENCES [dbo].[PERSONEL] ([PID]);
GO
ALTER TABLE [dbo].[PERSONEL] ADD CONSTRAINT [FK__PERSONEL__Unvan__4CA06362] FOREIGN KEY ([Unvan]) REFERENCES [dbo].[UNVANLAR] ([UnvanID]);
GO

CREATE PROCEDURE spMaasDuzenle
AS BEGIN
	DECLARE @PID INT,
	@UnvanID INT ,
	@CSayisi INT, 
	@Kira BIT,
	@Tazminat INT,
	@Maas INT

	DECLARE cMaasDuzenle CURSOR FOR SELECT PID FROM MAASLAR
	OPEN cMaasDuzenle
	FETCH NEXT FROM cMaasDuzenle INTO @PID
	WHILE @@FETCH_STATUS=0
		BEGIN 
			SET @UnvanID=(SELECT Unvan FROM PERSONEL WHERE PID=@PID)
			SET @Tazminat=(SELECT Tazminat FROM UNVANLAR WHERE UnvanID=@UnvanID)
		    SET @CSayisi=(SELECT CSayisi FROM PERSONEL WHERE PID=@PID)
			SET @Kira= 0
			IF(SELECT Kira FROM PERSONEL WHERE PID=@PID)=1 SET @Kira=20000
			SET @Maas=75000+@CSayisi*3000+@Kira+@Tazminat
			UPDATE MAASLAR SET Maas=@Maas WHERE PID=@PID 
			FETCH NEXT FROM cMaasDuzenle INTO @PID
		END
		CLOSE cMaasDuzenle
		DEALLOCATE cMaasDuzenle




END
GO

CREATE TRIGGER trgMaasYaz
ON PERSONEL
For INSERT
AS BEGIN
DECLARE @PID INT=(SELECT PID FROM inserted)
DECLARE @CYARDIM INT =(SELECT CSayisi FROM inserted)*2000
DECLARE @KYARDIM INT =0
IF (SELECT Kira FROM inserted)=1 SET @KYARDIM=15000
DECLARE @UYARDIM INT= (SELECT Tazminat FROM UNVANLAR WHERE UnvanID=(SELECT UNVAN FROM inserted))
DECLARE @MAAS INT=50000+@CYARDIM+@KYARDIM+@UYARDIM
INSERT INTO MAASLAR VALUES(@PID,@MAAS)
END
GO
