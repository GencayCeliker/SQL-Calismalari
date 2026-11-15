--1DEN 100 KADAR OLAN TAM SAYILARI EKRANA YAZDIRN SQL SCRİPTİ KODLAYINIZ
--Sınavda sorabilir
DECLARE @Sayac INT=1
WHILE @Sayac<=100
BEGIN
PRINT @Sayac
Set @Sayac=@Sayac+1
END
GO
 
DECLARE @Sayac INT=0,@Toplam INT=0 --beyan etmek Sayacı 1 ve 0 olarak
WHILE @Sayac<=100
BEGIN
Set @Toplam=@Toplam+@Sayac
SET @Sayac=@Sayac+2
END
PRINT @Toplam


--Kullanıcadan parametre isteğini ancak FUNCTION yada PROCEDURE ile karşılaya biliriz
--Öncelikle FUNCTION OLARAK TANIMINI YAPARIZ

--FUNCTION:ALDIĞI PARAMETLERİ İŞLEYEREK 1(BİR) ADET DEĞER GÖNDEREREK DEĞER GÖNDEREN YAPIYA FUNCTION DENİR
--FUNCTION OLUŞTURMA

CREATE FUNCTION dbo.fonksiyonismi(parametre1 tip,parametre2 tip...,parametreN tip)
RETURNS tip
AS BEGIN
--YAPILACAKLAR
RETURN değişkenadı ya da değer
END
--Fonksiyon Çalıştırması 
SELECT fonksiyonadı(parametreler)
yada 
PRINT fonksiyonadı(parametreler)
-- bir fonksiyonun içerisinde MESAJ VERMEK İÇİN SELECT YADA PRINT KULLANILAMAZ

--1DEN N KADAR OLAN TAM SAYILARIN Toplamını EKRANA YAZDIRN SQL SCRİPTİ KODLAYINIZ
USE UYGULAMA
GO
CREATE FUNCTION dbo.Toplam(@N INT)
RETURNS INT
AS BEGIN
DECLARE @Sayac INT=1,@Toplam INT=0;
WHILE @Sayac<=@N 
    BEGIN
    SET @Toplam= @Toplam + @Sayac;
	SET @Sayac= @Sayac+1;
    END
    RETURN @Toplam;
END;

--Soru1 kullanıcı taradından verilen bir sayının tek yada cift olduğunu bildiren fonksiyonu kodlayınız
--soru2:kullanıcı taradından verilen bir sayının asal sayı olup olmadığını bildiren programı yazınız
--soru3:kullanıcı taradından verilen bir sayının karesini hesaplayan sayıyı kodlayınız
--soru4:kullanıcı taradından verilen bir sayının karekökünü hesaplayan fonksiyonu kodlayınız







