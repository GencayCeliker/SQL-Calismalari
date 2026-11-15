------------------------------ÖDEV----------------------------------
--GENCAY ÇELİKER --100000007
--Soru1 kullanıcı taradından verilen bir sayının
--tek yada cift olduğunu bildiren fonksiyonu kodlayınız
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.tekcift
GO
CREATE FUNCTION dbo.tekcift(@N INT)
RETURNS NVARCHAR(4)
AS BEGIN
    DECLARE @Sonuc NVARCHAR(4)
    IF (@N % 2 = 0)
        SET @Sonuc = 'Çift'
    ELSE
        SET @Sonuc = 'Tek'
    RETURN @Sonuc
END

--soru2:kullanıcı taradından verilen bir sayının
--asal sayı olup olmadığını bildiren programı yazınız
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.asalsay
GO
CREATE FUNCTION dbo.asalsay(@SAYI INT)
RETURNS NVARCHAR(MAX)
AS BEGIN
	DECLARE @SONUC NVARCHAR(MAX) = 'ASAL SAYI' 
	DECLARE @SAYAC INT = 2
	IF @SAYI <= 1 
		RETURN 'ASAL DEĞİL'
	WHILE @SAYAC <= @SAYI - 1
	BEGIN
		IF @SAYI % @SAYAC = 0
		BEGIN
			SET @SONUC = 'ASAL DEĞİL'
			BREAK
		END
		SET @SAYAC = @SAYAC + 1
	END

	RETURN @SONUC
END

--soru3:kullanıcı taradından verilen bir sayının
--karesini hesaplayan programı kodlayınız
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.karehesap
GO
CREATE FUNCTION dbo.karehesap(@N INT)
RETURNS INT
AS BEGIN
DECLARE @Hesapk INT=0
SET @Hesapk=@N*@N
    RETURN @Hesapk
END

--soru4:kullanıcı taradından verilen bir sayının
--karekökünü hesaplayan fonksiyonu kodlayınız
USE UYGULAMA
GO
DROP FUNCTION IF EXISTS dbo.karekok
GO
CREATE FUNCTION dbo.karekok(@N Float)
RETURNS FLOAT
AS BEGIN
    RETURN SQRT(@N)
END
--Soru5
--*
--**
--***
--****
--*****
USE UYGULAMA
GO
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
SELECT dbo.asalsay(5)
SELECT dbo.tekcift(3)
SELECT dbo.karekok(16)
SELECT dbo.karehesap(3)