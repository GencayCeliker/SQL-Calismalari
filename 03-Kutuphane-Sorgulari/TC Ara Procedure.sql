USE KUTUPHANE
GO
CREATE PROCEDURE sp_TCAra
@Ara NVARCHAR(11)
AS BEGIN
SELECT * FROM TBL_UYELER
WHERE UyeTCKimlik LIKE @Ara + '%'
END
--C# TextBoxta girdiğimiz sayı ile başlayan TC kimlik nolu kişiyi-kişileri Getirir



EXEC dbo.sp_TCAra '3'
--Deneme Çalıştırma