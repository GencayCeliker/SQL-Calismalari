use UYGULAMA
GO
INSERT INTO DEPARTMAN(Bolum)-- Departmanının içine 
VALUES ('İdare'),
	   ('Boyahane'),
       ('Kesimhane')
GO-- Bağımsız satırda olucak aksi taktirde çalışmaz
--ÇOKLU VERİ GİRİŞİ
SELECT * FROM DEPARTMAN --Departman tablosundaki tüm alanların kayıtlarını listeler
SELECT * FROM PERSONEL

SELECT PERSONEL.Ad,PERSONEL.Soyad,PERSONEL.TCKimlikNo,DEPARTMAN.Bolum
FROM DEPARTMAN JOIN PERSONEL --JOIN BİRLEŞMEK
ON DEPARTMAN.Sira=PERSONEL.Bolum-- on üstünde demek
-- Eğer tekrardan ekleme yapmayacaksak SELECT * FROM DEPARTMAN seçilip Execute yapılır ve sadece listelemeyi yapar
--SELECT 'Merhaba Dünya...'EMRAH,--ARALARINDA BOŞLUK VARSA [EMRAH ÇAPKAN] BU ŞEKİLDE YAZILIR
--	   'Merhaba Dünya...'EMRE,-- Select SEÇİM DEMEK
--	   'Merhaba Dünya...'MİKAİL,
--      'Merhaba Dünya...'KEREM
--PRİNT 'Merhaba Dünya...' TEK SEFERLİ MESAJ VERİR!!