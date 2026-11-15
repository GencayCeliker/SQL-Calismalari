USE UYGULAMA
GO
INSERT INTO PERSONEL  VALUES ('İlayda','Ayyıldız','10000000021',3)
--EĞER IDENTITY ALAN HARİÇ TÜM ALANLARA VERİ GİRİŞİ YAPILIYOR İSE ALAN BELİRTMEYE GEREK YOKTUR
--TÜM ALANA GİRMİCEKSEK ALAN BELİRTMEK ZORUNLU

GO

SELECT * FROM PERSONEL
--ORDER BY Ad,Soyad--listeleme yapar Normal sıralama BELİRTMEZSEK (ASC) OLARAK YAZAR
ORDER BY Ad DESC,Soyad DESC--TERSTEN SIRALAMA
--ORDER BY Ad ,Soyad DESC--Adın yanına DESC koymazsak , koyup devam edersek adı a,z'ye Soy adı tersten tanımlar belirttiğimiz için

--