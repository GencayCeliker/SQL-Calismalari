--Soru1 kullanıcı taradından verilen bir sayının tek yada cift olduğunu bildiren fonksiyonu kodlayınız
--soru2:kullanıcı taradından verilen bir sayının asal sayı olup olmadığını bildiren programı yazınız
--soru3:kullanıcı taradından verilen bir sayının karesini hesaplayan sayıyı kodlayınız
--soru4:kullanıcı taradından verilen bir sayının karekökünü hesaplayan fonksiyonu kodlayınız
--Soru1
USE UYGULAMA
GO
--DROP FUNCTION IF EXISTS tekcift güncellemek için kullanılır
CREATE FUNCTION dbo.tekcift(@N INT)
RETURNS NVARCHAR(4)--Fonksiyonun sonucu bir yazı (NVARCHAR=ULUSAL DİL) olacak. Çünkü VARCHAR TÜRKÇE KARAKTER İÇERMEZ
AS BEGIN
    DECLARE @Sonuc NVARCHAR(4)
    IF (@N % 2 = 0)
        SET @Sonuc = 'Çift'
    ELSE
        SET @Sonuc = 'Tek'
    RETURN @Sonuc
END



--Soru2:Kullanıcı tarafından girilen sayının asal olup olmadığını bildiren fonksiyonu kodlayınız.
USE UYGULAMA
GO
dROP FUNCTION IF EXISTS dbo.asalsay
GO
CREATE FUNCTION dbo.asalsay(@N INT)
RETURNS NVARCHAR(10)
AS BEGIN
    IF @N < 2 RETURN 'ASAL DEĞİL'
    DECLARE @i INT = 2
    WHILE @i <= SQRT(@N)
    BEGIN
        IF @N % @i = 0 RETURN 'ASAL DEĞİL'
        SET @i = @i + 1
    END
    RETURN 'ASAL'
END

PRINT dbo.asalsay(10)

--soru3:kullanıcı taradından verilen bir sayının karesini hesaplayan sayıyı kodlayınız
USE UYGULAMA
GO
CREATE FUNCTION dbo.karehesap(@N INT)
RETURNS INT
AS BEGIN
DECLARE @Hesapk INT=0
SET @Hesapk=@N*@N
    RETURN @Hesapk
END
PRINT dbo.karehesap(6)

--soru4:kullanıcı taradından verilen bir sayının karekökünü hesaplayan fonksiyonu kodlayınız
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.karekok
GO
CREATE FUNCTION dbo.karekok(@N Float)
RETURNS FLOAT
AS BEGIN
    RETURN SQRT(@N)
END
PRINT dbo.karekok(5)
GO
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.asalsay1
GO
CREATE FUNCTION dbo.asalsay1(@N INT)
RETURNS NVARCHAR(250)
AS BEGIN
DECLARE @Sonuc NVARCHAR(250)
DECLARE @Sayac INT=2
WHILE @Sayac<=@N-1
BEGIN
IF (@N%@Sayac=0)SET @Sonuc='asal değildir'
SET (@Sayac=@Sayac+1)
END
RETURN (@N)
--Soru5
--*
--**
--***
--****
--*****
GO
USE UYGULAMA
DECLARE @icsayac INT=1 ,@sayac Int=1,@star NVARCHAR(5)=''
WHILE @sayac<=5
BEGIN
	WHILE @icsayac<=@sayac
	BEGIN 
	SET @star =@star+'*'
		SET @icsayac=@icsayac+1
	END
	PRINT @star
	SET @sayac=@sayac+1
END
GO
USE UYGULAMA
GO
DECLARE @icsayac INT=1 ,@sayac Int=5,@star NVARCHAR(5)=''
WHILE @sayac>=1
BEGIN
	WHILE @icsayac<=@sayac
	BEGIN 
	SET @star =@star+'*'
		SET @icsayac=@icsayac+1
	END
	PRINT @star
	SET @icsayac=1
	SET @star=''-- YILDIZI SIFIRLAMAMIZ LAZIM 
	SET @sayac=@sayac-1
END


--TABLO TİPLİ DEĞİŞKENLER
--DECLARE @Sayilar (SiraNo INT,Sayi INT, Okunus NVARCHAR(250)) BU BİR DİZİ
USE UYGULAMA
GO
DROP TABLE IF EXISTS dbo.SAYILAR
GO
CREATE TABLE dbo.SAYILAR
(
SiraNo INT IDENTITY PRIMARY KEY,
Sayi NVARCHAR(MAX)--Alfabetik sıralar
)
GO
INSERT INTO dbo.SAYILAR--İÇİNE EKLE
VALUES('20'),('5'),('30'),('400'),('1000'),('700'),('40'),
	  ('2'),('200'),('3'), ('32'),('500'),('800'),('60'),
	  ('10'),('4'),('100'),('7'),('404'),('540'),('80'),
	  ('1'),('8'),('6'), ('101'),('33'),('54'),('70')