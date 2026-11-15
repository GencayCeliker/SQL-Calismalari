USE [KUTUPHANE]
GO

/****** Object:  StoredProcedure [dbo].[UyeIslem]    Script Date: 8.12.2025 10:39:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP PROCEDURE IF EXISTS dbo.UyeIslem
GO
CREATE PROCEDURE [dbo].[UyeIslem]
@UyeId INT --C# dan gelen uyeid bilgisini buraya aktardık
AS BEGIN
SELECT 
TBL_UYELER.UyeID,
TBL_UYELER.UyeAd,
TBL_UYELER.UyeSoyad, 
TBL_UYELER.UyeTCKimlik, 
TBL_Kitaplar.KitapId,
TBL_Kitaplar.KitapAdi, 
TBL_YAZARLAR.YazarAdSoyad, 
TBL_UYEKITAP.OVTarihi,
DATEDIFF(DAY,TBL_UYEKITAP.OVTarihi,GETDATE())AS Sure,
CASE WHEN DATEDIFF(DAY,TBL_UYEKITAP.OVTarihi,GETDATE()) > 15 -- Fark 15'den büyükse
 THEN (DATEDIFF(DAY,TBL_UYEKITAP.OVTarihi,GETDATE()) - 15)*5 -- 15 çıkar her gün 5 tl ekle
 ELSE 0 -- 15'den büyük değilse cezaya 0 yaz
 END 
 AS Ceza --Kolon Adına Ceza Yaz
FROM TBL_Kitaplar
INNER JOIN TBL_UYEKITAP ON TBL_Kitaplar.KitapId = TBL_UYEKITAP.KitapId 
INNER JOIN TBL_UYELER ON TBL_UYEKITAP.UyeId = TBL_UYELER.UyeId 
INNER JOIN TBL_YAZARLAR ON TBL_Kitaplar.YazarId = TBL_YAZARLAR.YazarId
WHERE TBL_UYELER.UyeId = @UyeId AND GATarihi IS NULL
END
GO