
--############################## -Tabloya Vei Ekleme- #############################################--
USE RESTORANDB
GO
INSERT INTO TblFirma(FirmaAdi,Telefon,Email,Adres)
VALUES 
('Anadolu Et ve Süt Ürünleri A.Ş.','0212 555 1010','anadoluetsut@mail.com','İstanbul, Büyükçekmece'),
('Yeşilbahçe Sebze Meyve Hali','0532 123 4567','yesilbahcehal@mail.com','İstanbul, Büyükçekmece'),
('Toptan İçecek Dağıtım Merkezi	','0850 444 2000','tptnicecekdagitim@mail.com','Ankara, Sincan'),
('Temizlik ve Hijyen Çözümleri Ltd.','0216 777 3030','temizlikhijyencozum@mail.com','Kocaeli, Gebze')
GO
INSERT INTO TblPersoneller(Ad,Soyad,TCKimlikNo,Telefon,Adres,Email,Pozisyon,Tarih,Durum,Resim)
VALUES
('Mustafa','Altınkaynak','10000000057','05550000036','İstanbul','altinkaynak@mail.com','Garson','10.10.2023',1,'2.jpg'),
('Buğrahan','Yılmaz','10000000058','05550000037','İstanbul','yilmazbugrahan@mail.com','Aşçı','10.10.2022',1,'3.jpg'),
('Hüseyin','Yüce','10000000059','05550000038','İstanbul','yucehuseyin@mail.com','Muhasebe','10.8.2021',1,'4.jpg'),
('Adahan','Akdeniz','10000000060','05550000039','İstanbul','akdenizadahan@mail.com','Garson','10.6.2020',0,'5.jpg'),
('Elmas','Mutlu','10000000061','05550000040','İstanbul','elmasmutlu@mail.com','Temizlikçi','10.10.2024',1,'6.jpg'),
('Kadir','Kara','10000000062','05550000041','İstanbul','karakadir@mail.com','Temizlikçi','10.10.2024',0,'7.jpg')
GO
INSERT INTO TblMusteriler(Ad,Soyad,MasaId,Tarih,Saat,Aciklama,Durum)
VALUES 
('Merve', 'Kaya', 3, '2025-10-22', '18:00:00', 'İş toplantısı', 1),
('Burak', 'Demir', 7, '2025-10-23', '20:15:00', 'Yemek daveti', 1),
('Elif', 'Turan', 2, '2025-10-24', '17:45:00', 'Çocuklarla akşam yemeği', 0),
('Can', 'Öztürk', 6, '2025-10-25', '19:00:00', 'Yıldönümü kutlaması', 1),
('Zeynep', 'Aslan', 4, '2025-10-26', '21:00:00', 'Arkadaş buluşması', 1),
('Emre', 'Yıldız', 1, '2025-10-27', '18:30:00', 'İş yemeği', 0),
('Gamze', 'Çelik', 8, '2025-10-28', '20:00:00', 'Romantik akşam', 1),
('Tolga', 'Aksoy', 5, '2025-10-29', '19:30:00', 'Kutlama yemeği', 1),
('Selin', 'Erdoğan', 9, '2025-10-30', '17:00:00', 'Erken akşam yemeği', 0),
('Kerem', 'Güneş', 10, '2025-10-31', '22:00:00', 'Gece kahvesi', 1);
GO
INSERT INTO TBLKategori(KategoriAdi)
VALUES
('Çorbalar'),
('Ana Yemekler'),
('Izgaralar'),
('Makarnalar'),
('Salatalar'),
('Tatlılar'),
('İçecekler'),
('Kahvaltılıklar'),
('Fast Food'),
('Yan Ürünler'),
('Çocuk Menüleri'),
('Vejetaryen'),
('Çocuk Menüsü'),
('Deniz Ürünleri'),
('Soslar'),
('Ekstralar')
GO
INSERT INTO TblUrun(UrunAdi, Fiyat, KategoriId, Aciklama, StokMiktari, Birim, Durum)
VALUES
('Mercimek Çorbası', 35.00, 1, 'Kırmızı mercimekten hazırlanmış klasik çorba', 50, 'Adet', 1),
('Adana Kebap', 95.00, 2, 'Acılı kebap, közlenmiş biber ve pilav ile servis edilir', 30, 'Adet', 1),
('Tavuk Izgara', 85.00, 3, 'Izgara tavuk göğsü, salata ve pilav ile', 40, 'Adet', 1),
('Spagetti Napoliten', 70.00, 4, 'Domates soslu klasik İtalyan makarna', 25, 'Adet', 1),
('Çoban Salata', 40.00, 5, 'Domates, salatalık, biber, soğan, zeytinyağı', 60, 'Adet', 1),
('Sütlaç', 30.00, 6, 'Fırınlanmış sütlü tatlı', 20, 'Adet', 1),
('Kola 330ml', 25.00, 7, 'Soğuk servis edilen gazlı içecek', 100, 'Adet', 1),
('Serpme Kahvaltı', 120.00, 8, 'Peynir, zeytin, yumurta, reçel, çay dahil', 15, 'Adet', 1),
('Hamburger Menü', 90.00, 9, 'Hamburger, patates kızartması ve içecek', 35, 'Adet', 1),
('Patates Kızartması', 30.00, 10, 'Kızarmış patates, ketçap ve mayonez ile', 50, 'Adet', 1),
('Et Menü', 150.00, 11, 'Et yemeği, salata, pilav ve içecek', 20, 'Adet', 1),
('Sebzeli Güveç', 80.00, 12, 'Vejetaryen güveç, fırında pişmiş sebzeler', 20, 'Adet', 1),
('Mini Tavuk Menü', 65.00, 13, 'Çocuklar için tavuk, pilav ve meyve suyu', 15, 'Adet', 1),
('Karides Tava', 130.00, 14, 'Tereyağında sotelenmiş karides', 10, 'Adet', 1),
('Acı Sos', 10.00, 15, 'Ev yapımı acı sos', 100, 'Adet', 1),
('Kaşar Ekstra', 15.00, 16, 'Yemek üzerine ekstra kaşar peyniri', 80, 'Adet', 1);
GO
INSERT INTO TblMasa(MasaNo,Aciklama,Tutar,Durum)
VALUES
(1, 'Pencere Kenarı, 2 kişilik', 0.00, 0),
(2, 'Salon Ortası, 4 kişilik', 0.00, 0),
(3, 'Bahçe Tarafı, 6 kişilik', 0.00, 0),
(4, 'Teras, 8 kişilik', 0.00, 0),
(5, 'Teras, 2 kişilik', 0.00, 0),
(6, 'Salon Köşesi, 2 kişilik', 0.00, 0),
(7, 'Bahçe Kenarı, 4 kişilik', 0.00, 0),
(8, 'Salon Girişi, 2 kişilik', 0.00, 0),
(9, 'Cam kenarı, 6 kişilik', 0.00, 0),
(10, 'Teras, 4 kişilik', 0.00, 0);
GO
INSERT INTO TblMaas(PerId,Ay,Yil,ToplamCalismaSaati,SaatlikUcret,Prim,Kesinti,Avans)
VALUES
(2, 10, 2025, 170, 85.00, 300.00, 150.00, 800.00),  -- Garson
(3, 10, 2025, 180, 90.00, 500.00, 250.00, 1200.00), -- Mutfak Şefi
(4, 10, 2025, 150, 75.00, 200.00, 100.00, 500.00),  -- Muhasebe 
(5, 10, 2025, 165, 82.00, 350.00, 180.00, 950.00),  -- Kasiyer
(6, 10, 2025, 175, 88.00, 450.00, 220.00, 1100.00), -- Aşçı Maaşı
(7, 10, 2025, 160, 80.00, 300.00, 100.00, 700.00);  -- Temizlik Personeli Maaşı
GO
INSERT INTO TblGunlukHarcama(HarcananYer,Tarih,Saat,Aciklama,Tutar)
VALUES
('Migros', '2025-10-20', '09:30:00', 'Mutfak malzemeleri', 450.50),
('Aygaz', '2025-10-20', '10:15:00', 'Tüp değişimi', 280.00),
('İspark', '2025-10-20', '11:00:00', 'Otopark ücreti', 35.00),
('Bim', '2025-10-20', '12:45:00', 'İçecek ve temizlik', 190.25),
('Petrol Ofisi', '2025-10-20', '13:30:00', 'Araç yakıtı', 720.00),
('Kahve Dünyası', '2025-10-20', '14:15:00', 'Müşteri ikramı', 85.00),
('Teknosa', '2025-10-20', '15:00:00', 'Yazıcı kartuşu', 310.99),
('LC Waikiki', '2025-10-20', '16:20:00', 'Garson kıyafeti', 560.40),
('Garson Kerim', '2025-10-20', '17:10:00', 'Personel öğle yemeği', 125.50),
('Kütüphane', '2025-10-20', '18:00:00', 'Menü tasarımı için kitap', 60.00)
GO