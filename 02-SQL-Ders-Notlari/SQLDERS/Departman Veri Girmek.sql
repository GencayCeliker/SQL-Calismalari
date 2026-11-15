USE UYGULAMA;

--Departmana Veri Girişi Sağlar
INSERT INTO DEPARTMAN(Bolum)
VALUES ('İdare'),('Boyahane'),('Kesimhane');


--Departman tablosunda 3.sıradakini ve adı Yemekhane olanı getirir.
SELECT * FROM DEPARTMAN WHERE Sira=3 OR Bolum='Yemekhane';


--Personel Tablosunda Bölüme direkt bölüm adını yazmayı sağlar.
SELECT PERSONEL.Ad,PERSONEL.Soyad,PERSONEL.TCKimlikNo,DEPARTMAN.Bolum
FROM DEPARTMAN JOIN PERSONEL ON DEPARTMAN.Sira = PERSONEL.Bolum


--Sütun oluşturur ismine Emrah Çapkan,Kerem... Yazar içine ise HELLO WORD yazar.
SELECT 'HELLO WORLD' [EMRAH ÇAPKAN],--ÖNEMLİ!!! Column içine boşluklu yazabilmek için (köşeli parantez[]) kullanılır.--
'HELLO WORLD' KEREM,
'HELLO WORLD' GENCAY,
'HELLO WORLD' EMRE


--Personele Veri Girişi
INSERT INTO PERSONEL(Ad,Soyad,TCKimlikNo,Bolum)
VALUES('Kerem','Çetin','10000000015',3),
('Emrah','Çapkan','10000000016',5),
('Gencay','Çeliker','10000000017',1),
('İlayda','Bıyık','10000000018',2);


--Personeli Siler
DELETE FROM PERSONEL WHERE TCKimlikNo='10000000018'--DELETE Yazılışı


--Personel Tablosunun Çağırma
SELECT * FROM PERSONEL

--TC Kimlik Değiştirme ilk yeni TC sonra eski TC girilir.
UPDATE PERSONEL SET TCKimlikNo='10000000019' WHERE TCKimlikNo='10000000015'