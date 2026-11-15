USE KUTUPHANE
GO
SET NOCOUNT ON --INSERT,DELETE ya da UPDATE komutlarını kullanırsak hatalı RETURN üretmemesi için SET NOCOUNT ON demeliyiz
GO
CREATE PROCEDURE SpKitapAra
@Ara NVARCHAR(200)
AS BEGIN
SELECT * FROM TBL_Kitaplar
WHERE ISBN LIKE @Ara + '%' OR 
KitapAdi LIKE @Ara + '%'
END