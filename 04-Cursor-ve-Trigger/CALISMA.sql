 --Urunler tablosunda fiyat güncellendiğinde, FiyatLog tablosuna UrunID, EskiFiyat, YeniFiyat
 --ve o anki tarihi (GETDATE()) otomatik yazan Trigger'ı senin tarzınla yazabilir misin?
 
 --CREATE TRIGGER trgFiyatdegisim
 -- ON FiyatLog
 -- FOR INSERT
 -- AS BEGIN
 -- DECLARE @EskiFiyat decimal(18,2),@YeniFiyat decimal(18,2),@UrunID INT,@DegisimTarihi DATE,@Ufiyat Decimal(18,2)
 -- SET @UrunID=(SELECT UrunId FROM inserted )
 -- SET @EskiFiyat=(SELECT EskiFiyat FROM inserted)
 -- SET @YeniFiyat=(SELECT @YeniFiyat FROM inserted)
 -- SET @DegisimTarihi=GETDATE()
 -- Set @Ufiyat=(SELECT Fiyat FROM Urunler WHERE UrunID=@UrunID)
 -- INSERT INTO FiyatLog VALUES(@UrunID,@EskiFiyat,@YeniFiyat,@DegisimTarihi)
 -- END







  --Urunler tablosuna yeni bir ürün eklendiğinde, hangi ürünün kaç stokla sisteme girdiğini
  --PRINT ile ekrana yazdıran bir Trigger yazalım.
  
--  CREATE TRIGGER sOgren
--ON URUNLER
--AFTER INSERT -- Ekleme yapıldıktan sonra çalış (FOR INSERT ile aynıdır)
--AS 
--BEGIN
--    DECLARE @UrunID INT = (SELECT UrunID FROM inserted)
--    DECLARE @UrunAd NVARCHAR(100) = (SELECT UrunAd FROM inserted)
--    DECLARE @StokAdet INT = (SELECT StokAdet FROM inserted)

--    PRINT @UrunAd + ' ürününden ' + CAST(@StokAdet AS VARCHAR) + ' adet sisteme alındı.'
--END


--Urunler tablosundan bir ürün silindiğinde (DELETE), o ürünün ismini ve silinmeden önceki
--son stok adedini ekrana PRINT ile yazdıran bir Trigger yazalım.
--CREATE TRIGGER sogren2
--ON Urunler
--FOR DELETE
--AS BEGIN
--DECLARE @UrunID INT =(SELECT UrunID FROM deleted)
--DECLARE @Oad NVARCHAR(150)=(SELECT UrunAd FROM deleted)
--DECLARE @Ostok INT =(SELECT StokAdet FROM deleted)
--PRINT @Oad+'ürünü'+CAST (@Ostok AS NVARCHAR)+' Kaldırıldı'
--END



--CREATE PROCEDURE szam
--AS BEGIN
--DECLARE @UrunID INT,@Fiyat Decimal(18,2),@Sfiyat DECIMAL(18,2)
--DECLARE cszam CURSOR FOR SELECT UrunID,Fiyat FROM Urunler
--OPEN cszam
--FETCH NEXT FROM cszam INTO @UrunID, @Fiyat
--WHILE @@FETCH_STATUS=0
--BEGIN
--SET @UrunID=(SELECT UrunID FROM Urunler WHERE UrunID=@UrunID)
--SET @Fiyat=(SElECT Fiyat FROM Urunler WHERE UrunID=@UrunID)
--SET @Sfiyat=@Fiyat+50
--UPDATE Urunler SET Fiyat=@Sfiyat WHERE UrunID=@UrunID
--FETCH NEXT FROM cszam INTO @UrunID, @Fiyat
--END
--CLOSE cszam
--DEALLOCATE cszam
--END

--go
----Urunler tablosunda bir ürünün adı (UrunAd) değiştiğinde ekrana
----şunu yazdır: "Bir ürünün ismi güncellendi."





--mağzadaki tüm ürünlerin fiyatlarına istisnasız 50 tl ekle

CREATE PROCEDURE SP50
AS BEGIN
DECLARE @UrunID INT,@Fiyat INT,@YFiyat INT
DECLARE cur50 CURSOR FOR SELECT UrunID FROM Urunler
OPEN cur50
FETCH NEXT FROM cur50 INTO @UrunID
WHILE @@FETCH_STATUS=0
BEGIN
SET @Fiyat=(SELECT Fiyat FROM Urunler)
SET @YFiyat=@Fiyat+50
UPDATE Urunler SET Fiyat=@YFiyat
FETCH NEXT FROM cur50 INTO @UrunID
END
CLOSE cur50
DEALLOCATE cur50
END


--Senaryo: Ürünlerin stok miktarına göre "Durum" sütununu güncelle (Bu sütunun tabloda olduğunu varsay).

--Eğer stok 10'dan az ise Durum = 'KRİTİK'

--Eğer stok 10 ve üzeri ise Durum = 'NORMAL' olsun.

CREATE PROCEDURE spCduzenle
AS BEGIN
DECLARE  @UrunID INT,@StokMiktarı INT,@Durum NVARCHAR(100)
DECLARE cduzenle CURSOR FOR SELECT UrunID FROM Urunler
OPEN cduzenle
FETCH NEXT FROM cduzenle INTO @UrunID
WHILE @@FETCH_STATUS=0
BEGIN 
SET @StokMiktarı =(SELECT StokAdet FROM Urunler WHERE UrunID=@UrunID)
SET @Durum=(SELECT Durum FROM Urunler WHERE UrunID=@UrunID)
IF @StokMiktarı<=10  
 SET @Durum='Kritik'
ELSE
 SET @Durum='Normal'
 UPDATE Urunler SET Durum=@Durum WHERE UrunID=@UrunID
FETCH NEXT FROM cduzenle INTO @UrunID
END
CLOSE cduzenle
DEALLOCATE cduzenle
END


CREATE TRIGGER tbin
ON Urunler 
FOR INSERT
AS BEGIN
DECLARE @UrunID INT =(SELECT UrunID from inserted)
DECLARE @Fiyat Decimal(18,2)=(SELECT Fiyat FROM inserted)
IF @Fiyat>=1000 PRINT 'Lüks Ürün Eklendi'
ELSE PRINT 'Standart ürün eklendi'
END