USE KUTUPHANE
GO

CREATE PROCEDURE IslemKaydet
@UyeId INT,  --uyeid nin bilgisi VS'den buraya aktarıldı--
@KitapId INT --kitapid nin bilgisi VS'den buraya aktarıldı--
AS BEGIN
INSERT INTO TBL_UYEKITAP (UyeId,KitapId,OVTarihi) VALUES
(@UyeId,@KitapId,GETDATE())
UPDATE TBL_Kitaplar SET Adet = Adet - 1
WHERE KitapId = @KitapId
END