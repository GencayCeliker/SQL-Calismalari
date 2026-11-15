use UYGULAMAx
go

SELECT Ad,
      Soyad,
      TCKimlik,
      BolumAdi
  FROM PERSONEL p join BOLUM b on p.Bolum=b.Sira