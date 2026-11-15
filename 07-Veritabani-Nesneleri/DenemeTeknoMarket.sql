/* DenemeTeknoMarket veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'DenemeTeknoMarket') IS NULL CREATE DATABASE [DenemeTeknoMarket];
GO
USE [DenemeTeknoMarket];
GO

CREATE TABLE [dbo].[FiyatLog] (
    [LogID] int IDENTITY(1,1) NOT NULL,
    [UrunID] int NULL,
    [EskiFiyat] decimal(10,2) NULL,
    [YeniFiyat] decimal(10,2) NULL,
    [DegisimTarihi] datetime NULL DEFAULT (getdate()),
    CONSTRAINT [PK__FiyatLog__5E5499A813640627] PRIMARY KEY ([LogID])
);
GO

CREATE TABLE [dbo].[Urunler] (
    [UrunID] int IDENTITY(1,1) NOT NULL,
    [UrunAd] varchar(100) NULL,
    [Kategori] varchar(50) NULL,
    [Fiyat] decimal(10,2) NULL,
    [StokAdet] int NULL,
    CONSTRAINT [PK__Urunler__623D364B69B465C9] PRIMARY KEY ([UrunID])
);
GO

SET IDENTITY_INSERT [dbo].[Urunler] ON;
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (1, N'Laptop', N'Elektronik', 13200.00, 10);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (2, N'Telefon', N'Elektronik', 7040.00, 20);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (3, N'Klavye', N'Aksesuar', 500.00, 50);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (4, N'Mouse', N'Aksesuar', 300.00, 40);
INSERT INTO [dbo].[Urunler] ([UrunID], [UrunAd], [Kategori], [Fiyat], [StokAdet]) VALUES (5, N'Monitör', N'Elektronik', 2640.00, 15);
SET IDENTITY_INSERT [dbo].[Urunler] OFF;
GO


CREATE PROCEDURE spEindirim
AS BEGIN
	DECLARE @UrunID INT,@Fiyat INT, @YFiyat INT
	DECLARE zendirim CURSOR FOR SELECT UrunID FROM Urunler WHERE Kategori='Elektronik'
	OPEN zendirim
	FETCH NEXT FROM zendirim INTO @UrunID
	WHILE @@FETCH_STATUS=0
		BEGIN
		SET @Fiyat=(SELECT Fiyat FROM Urunler WHERE UrunID=@UrunID)
		SET @YFiyat=0
		SET @YFiyat=@Fiyat-(@Fiyat * 0.20)
		UPDATE Urunler SET Fiyat=@YFiyat WHERE UrunID=@UrunID
		FETCH NEXT FROM zendirim INTO @UrunID
		END
		CLOSE zendirim
		DEALLOCATE zendirim
END
GO

CREATE PROCEDURE spElektronikZamYap
AS 
BEGIN
    -- 1. Değişkenleri Tanımlıyoruz
    DECLARE @UrunId INT,
            @Fiyat DECIMAL(10,2),
            @YFiyat DECIMAL(10,2)

    -- 2. Cursor Tanımlama 
    -- Sadece 'Elektronik' olanları en başta süzüp ID'lerini alıyoruz
    DECLARE celktRonigc CURSOR FOR 
    SELECT UrunId FROM Urunler WHERE Kategori = 'Elektronik'

    -- 3. Cursor'ı Aç ve İlk ID'yi Al
    OPEN celktRonigc
    FETCH NEXT FROM celktRonigc INTO @UrunId

    -- 4. Döngü Başlıyor
    WHILE @@FETCH_STATUS = 0
    BEGIN 
        -- Senin tarzın: Bilgiyi döngü içinde SELECT ile çekiyoruz
        SET @Fiyat = (SELECT Fiyat FROM Urunler WHERE UrunID = @UrunId)
        
        -- Zam Hesaplama (Sıfırlama ve Hesaplama)
        SET @YFiyat = 0
        SET @YFiyat = @Fiyat * 1.10

        -- Tabloyu Güncelleme
        UPDATE Urunler SET Fiyat = @YFiyat WHERE UrunID = @UrunId

        -- Bir sonraki ID'ye geç (Kritik: Sadece @UrunId çekiyoruz)
        FETCH NEXT FROM celktRonigc INTO @UrunId
    END

    -- 5. Kapatma ve Hafızadan Silme
    CLOSE celktRonigc
    DEALLOCATE celktRonigc
END
GO

create procedure zbindirim
as begin
DECLARE @UrunID INT, @Fiyat INT,@YFiyat INT, @Kategori NVARCHAR(50)
DECLARE cindirim CURSOR FOR SELECT UrunID FROM Urunler WHERE Kategori='Aksesuar'
OPEN cindirim
FETCH NEXT FROM cindirim INTO @UrunID
WHILE @@FETCH_STATUS=0
BEGIN
SET @Fiyat=(SELECT Fiyat FROM Urunler WHERE UrunID=@UrunID)
SET @YFiyat=0
SET @YFiyat=@Fiyat *0.80
UPDATE Urunler SET Fiyat =@YFiyat WHERE UrunID=@UrunID
FETCH NEXT FROM cindirim INTO @UrunID
END
CLOSE cindirim
DEALLOCATE cindirim
END
GO
