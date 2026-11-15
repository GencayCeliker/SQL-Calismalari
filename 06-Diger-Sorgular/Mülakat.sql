SELECT musteri_id
      ,ad
      ,soyad
      ,sehir_adi
  FROM Musteriler inner join Sehirler ON Musteriler.sehir_id =Sehirler.sehir_id
