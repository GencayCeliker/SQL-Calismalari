CREATE PROCEDURE KitapListe
AS BEGIN
SELECT TBL_Kitaplar.KitapId, 
	   TBL_Kitaplar.ISBN, 
	   TBL_Kitaplar.KitapAdi, 
	   TBL_Kitaplar.Sayfa, 
	   TBL_Kitaplar.Adet, 
	   TBL_YAZARLAR.YazarAdSoyad
FROM     
TBL_Kitaplar INNER JOIN TBL_YAZARLAR ON TBL_Kitaplar.YazarId = TBL_YAZARLAR.YazarId
END
