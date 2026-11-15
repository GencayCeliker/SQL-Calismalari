USE UYGULAMA
GO
ALTER TABLE tblOGRENCI
DROP COLUMN BolumAdi--BolumAdi sütünun sil
GO
USE UYGULAMA
GO
SELECT * FROM tblOGRENCI
SELECT OgrKod,AdSoyad,OkulNo,TCKimlikNo,BlmAdi FROM tblOGRENCI JOIN tblBolumler
ON tblOGRENCI.BlmKod=tblBolumler.BlmKod
			--FK				PK
--Soru: Bilgisayar programcılığına kayıtlı öğrencileri listeleyiniz
SELECT OgrKod,AdSoyad,OkulNo,TCKimlikNo,BlmAdi FROM tblOGRENCI JOIN tblBolumler
ON tblOGRENCI.BlmKod=tblBolumler.BlmKod
WHERE BlmAdi='Bilgisayar Programcılığı'

--Soru: Okul Numarasının son 3 rakamı 040 ila 049 arasında olan öğrencileri listeleyini 040 ve 049 da dahil
SELECT AdSoyad,OkulNo,TCKimlikNo,BlmAdi 
FROM tblOGRENCI JOIN tblBolumler--SONDAN 3 RAKAM LEFT BAŞTAN YAZIYIYI SAYIYA ÇEVİRDİK
ON tblOGRENCI.BlmKod=tblBolumler.BlmKod
WHERE CONVERT(INT,RIGHT(OkulNo,3))BETWEEN 040 AND 049
--WHERE CAST(RIGHT(OkulNo,3)AS INT)BETWEEN 040 AND 049--Bu şekilde de dönüştürebiliriz
--CONVERT (TİP,değişken) 
--CAST(Değişken AS tip)
USE UYGULAMA
ALTER TABLE tblOGRENCI ADD Sehir NVARCHAR(100)
GO
SELECT * FROM tblOGRENCI

USE UYGULAMA
GO
UPDATE tblOGRENCI -- eğer tabloda veri varsa güncelleden veri eklenir INSERT INTO kullanılmaz
SET Sehir='Kars'
WHERE AdSoyad='Yeter Bezar'
GO
ALTER TABLE tblOGRENCI ALTER COLUMN Sehir INT

USE UYGULAMA
GO
CREATE TABLE SEHIRLER
(
SehirKod INT PRIMARY KEY NOT NULL,
SehirAdi NVARCHAR(100) NOT NULL
)
INSERT INTO SEHIRLER VALUES(36,'Kars')
GO