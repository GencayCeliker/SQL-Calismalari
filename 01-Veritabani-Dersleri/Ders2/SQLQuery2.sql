SELECT Ad,
	   Soyad,
	   TCKimlik,
	   BolumAdi
FROM PERSONEL JOIN BOLUM --personel tablosuyla bolum tablosunu birleşti
	ON PERSONEL.Bolum=BOLUM.Sira -- PERSONEL tablosunun fk sı ile BOLUM tablosunun pk sı eşleşti

