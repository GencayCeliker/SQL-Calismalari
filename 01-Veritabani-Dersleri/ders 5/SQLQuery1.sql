USE UYGULAMAx
GO

DROP PROCEDURE IF EXISTS dbo.dgvPersonel_Doldur --varsa sil diyor
GO

CREATE PROCEDURE dgvPersonel_Doldur --prosedür oluşturma, form bağlama
AS BEGIN
SELECT Ad,Soyad,TCKimlik,BolumAdi FROM PERSONEL JOIN BOLUM
	ON PERSONEL.Bolum=BOLUM.Sira
END