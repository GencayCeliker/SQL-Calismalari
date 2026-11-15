--PRINT VE SELECT KOMUTU
PRINT --EKRANA MESAJ VERMEK İÇİN KULLANILIR
'Merhaba Dünya'
SELECT 'Merhaba Dünya' AS SELAMLAMA--Stun ismi verdik AS kullanmasakta stuna isim ver

--CREATE Nesne (Varsa Eğer Parametreleri) VE NESNE ADI

CREATE DATABASE UYGULAMA
USE UYGULAMA GO --GO kendinden önce verilen komutun işini bittiğini
CREATE TABLE tblOGRENCI
(
OgrKod INT IDENTITY PRIMARY KEY,
AdSoyad NVARCHAR(500) NOT NULL,--NOT NULL Boş geçilemez!,
OkulNo NCHAR(9) CHECK(OkulNo LIKE '[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),--CHECK KONTROL ET OkulNo LIKE rakam olarak kısıtladık
--OkulNo2 INT CHECK(OkulNo2>=2000000000 AND OkulNo2<=999999999) İnt Olarak tanımlarsa bu şekilde kısıtlarız
TCKimlikNo NCHAR(11) UNIQUE CHECK(TCKimlikNo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0,2,4,6,8]' ) NOT NULL,--Başka kimse almasın diye
BolumAdi NVARCHAR(250) NOT NULL
)
GO
CREATE TABLE tblBolum
(
OgrKod INT IDENTITY PRIMARY KEY,
BlmAdi NVARCHAR(250) NOT NULL
)
--ŞİMDİ ÖĞRENCİ TABLOSUNDAKİ SEHİR ALANINI FK OLARAK TANIMLAYALIM
ALTER TABLE tblOGRENCI ADD FOREIGN KEY(Sehir)
REFERENCES SEHIRLER(SehirKod);

ALTER TABLE tblOGRENCI
ADD CONSTRAINT FK_TblOgrenci_Sehir
FOREIGN KEY (Sehir) REFERENCES SEHIRLER(SehirKod)
GO
--Fereign Key in başvurduğu referans veri kaldırılırsa bu tablodaki veri satırıda silinsin yada güncellensin istiyorsak
--fk tanımına aşağıdaki kod eklenir
ALTER TABLE tblOGRENCI
ADD CONSTRAINT FK_TblOgrenci_Sehir
FOREIGN KEY (Sehir) REFERENCES SEHIRLER(SehirKod)
ON DELETE CASCADE ON UPDATE CASCADE 
GO
--TABLO OLUŞTURMA ESNASINDA İSE
CREATE TABLE TABLO_ADİ
(
ALAN1...
ALAN2...
)
--FK AYARLAMA
FK_ALAN INT FOREIGN KEY REFERENCES TBLX(PK_ALAN)
ON DELETE CASCADE ON UPDATE CASCADE --EŞİTLE
....
ALAN_N

