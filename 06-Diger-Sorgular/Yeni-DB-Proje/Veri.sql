USE RESTORANP
GO

-- =============================================
-- 1. SABİT TANIMLAR (Lookup Tables)
-- =============================================
INSERT INTO ODEME_ARACLARI (AracAdi) VALUES ('Nakit'), ('Kredi Kartı'), ('Sodexo'), ('Multinet');
INSERT INTO PERSONELISLEMTURU (TurAdi) VALUES ('Maaş Ödemesi'), ('Avans'), ('Prim'), ('Yol Ücreti');
INSERT INTO FBIRIMTUR (BirimAdi) VALUES ('Porsiyon'), ('Adet'), ('Kg'), ('Litre'), ('Şişe');
INSERT INTO KATEGORI (KategoriAdi) VALUES ('Ana Yemek'), ('Çorbalar'), ('Salatalar'), ('Tatlılar'), ('İçecekler'), ('Kahvaltı');
INSERT INTO SISLEMTURU (IslemTuru) VALUES ('Stok Giriş'), ('Satış Düşüş'), ('Zayi/İmha'), ('İade');
INSERT INTO CSTURU (Tur) VALUES ('Müşteri Çeki'), ('Şirket Çeki');

-- =============================================
-- 2. ANA VARLIKLAR (Personel, Firma, Müşteri, Masa)
-- =============================================

-- PERSONEL (5 Farklı Kişi)
INSERT INTO PERSONEL (Ad, Soyad, Pozisyon, Maas, TCKimlik, Telefon, Durum) VALUES 
('Hüseyin', 'Yüce', 1, 35000, '10000000063', '05550000044', 1), -- Yönetici
('Mustafa', 'Altınkaynak', 2, 28000, '10000000064', '05550000045', 1), -- Şef Garson
('Buğrahan', 'Yılmaz', 3, 22000, '10000000065', '05550000046', 1), -- Kasiyer
('Ayşe', 'Demir', 4, 25000, '10000000066', '05550000047', 1), -- Aşçı
('Merve', 'Kaya', 2, 18500, '10000000067', '05550000048', 1); -- Garson

-- FİRMA (Tedarikçiler)
INSERT INTO FIRMA (Ismi, YetkiliIsmi, Telefon, HesapNo, Adres) VALUES 
('Anadolu Et ve Süt Ürünleri', 'Cemal Bey', '05550000055', 'TR15000...', 'Bayrampaşa/İstanbul'),
('Toptan İçecek Dağıtım', 'Veli Bey', '05550000056', 'TR25000...', 'Ümraniye/İstanbul'),
('Yeşilbahçe Sebze Meyve Hali', 'Ali Dayı', '05550000057', 'TR35000...', 'Esenler/İstanbul'),
('Ege Baharatçısı', 'Fatma Hanım', '05550000058', 'TR45000...', 'İzmir');

-- MÜŞTERİLER (CRM İçin)
INSERT INTO MUSTERI (Ad, Soyad, Telefon, Aciklama) VALUES 
('Tolga', 'Aksoy', '05550000049', 'Sürekli müşteri, cam kenarı sever'),
('Zeynep', 'Aslan', '05550000050', 'Vejetaryen menü tercih eder'),
('Burak', 'Demir', '05550000051', 'Şirket yemeği için gelir'),
('Elif', 'Turan', '05550000052', NULL),
('Gamze', 'Çelik', '05550000053', 'Haftasonları kahvaltıya gelir'),
('Murat', 'Yıldız', '05550000054', NULL),
('Selin', 'Öztürk', '0541112233', 'Türk kahvesi sever');

-- MASALAR (15 Masa)
INSERT INTO MASA (MasaNo, Aciklama, Durum) VALUES 
(1, 'Bahçe - Deniz Tarafı', 0), (2, 'Bahçe', 0), (3, 'Bahçe', 0), (4, 'Bahçe', 0), (5, 'Bahçe', 0),
(10, 'Salon - Giriş', 0), (11, 'Salon - Orta', 0), (12, 'Salon - Cam Kenarı', 0), (13, 'Salon', 0), (14, 'Salon', 0),
(20, 'Teras', 0), (21, 'Teras', 0), (22, 'Teras - VIP', 0), (23, 'Teras', 0), (24, 'Teras', 0);

-- ÜRÜNLER (Menü - Kategori ve Firma ID'lerine dikkat edildi)
INSERT INTO URUN (UrunAdi, AlisFiyat, SatisFiyat, KategoriId, FirmaId, StokMiktari) VALUES 
-- Ana Yemekler
('Adana Kebap', 150, 350, 1, 1, 50),
('Karışık Izgara', 200, 550, 1, 1, 30),
('Tavuk Şiş', 100, 220, 1, 1, 40),
('Et Sote', 180, 400, 1, 1, 25),
-- Çorbalar
('Mercimek Çorbası', 20, 60, 2, 3, 100),
('Ezogelin', 20, 60, 2, 3, 100),
-- Salatalar
('Mevsim Salata', 15, 50, 3, 3, 200),
('Çoban Salata', 15, 50, 3, 3, 200),
('Sezar Salata', 30, 120, 3, 3, 50),
-- Tatlılar
('Künefe', 40, 150, 4, 1, 30),
('Fıstıklı Baklava', 50, 180, 4, 1, 30),
('Sütlaç', 25, 90, 4, 1, 50),
-- İçecekler
('Kola 330ml', 15, 45, 5, 2, 500),
('Ayran', 5, 25, 5, 1, 300),
('Su 500ml', 2, 10, 5, 2, 1000),
('Türk Kahvesi', 10, 50, 5, 4, 200);

-- =============================================
-- 3. GİDER HAREKETLERİ (Veri Doldurma)
-- =============================================

-- GÜNLÜK HARCAMALAR (DataGrid dolsun diye farklı tarihler)
INSERT INTO GUNLUKHARCAMA (HarcananYer, Aciklama, Tutar, PersonelId, Tarih, Saat) VALUES
('A101 Market', 'Temizlik malzemeleri (Deterjan, Sabun)', 450.50, 3, GETDATE(), '09:30'),
('Benzinlik', 'Paket servis motoruna benzin', 200.00, 2, GETDATE(), '10:00'),
('Manav', 'Maydanoz ve Dereotu eksikti', 150.00, 4, GETDATE()-1, '11:00'),
('Tüpçü', 'Sanayi tipi tüp değişimi', 850.00, 1, GETDATE()-1, '14:30'),
('Nalburiye', 'Musluk contası tamiri', 75.00, 1, GETDATE()-2, '16:00'),
('Kırtasiye', 'Adisyon kağıdı ve kalem', 320.00, 3, GETDATE()-3, '09:00'),
('Taksi', 'Gece personeli eve bırakma', 180.00, 1, GETDATE()-3, '02:00');

-- FİRMA ÖDEMELERİ (Toptancılara para çıkışı)
INSERT INTO FIRMAODEME (FirmaId, Odenen, Aciklama, Tarih) VALUES
(1, 15000, 'Geçen haftaki et faturası kapama', GETDATE()),
(2, 5000, 'İçecek ödemesi kısmi', GETDATE()-2),
(3, 2500, 'Sebze hal ödemesi nakit', GETDATE()-5);

-- PERSONEL ÖDEMELERİ (Maaş/Avans)
INSERT INTO PERODEME (PersonelId, IslemTuruId, OdemeAraciId, Tutar, Aciklama, Tarih) VALUES
(2, 2, 1, 2000, 'Ay ortası avans (Mustafa)', GETDATE()-10),
(4, 2, 1, 1500, 'Acil ihtiyaç avansı (Ayşe)', GETDATE()-5),
(5, 3, 1, 500, 'Haftasonu yoğunluk primi', GETDATE()-1);

-- =============================================
-- 4. GELİR HAREKETLERİ (Adisyon & Satışlar)
-- =============================================
-- Not: Adisyonları açıp, içine ürün ekliyoruz.

-- SENARYO 1: Dün kapanmış masa (Nakit)
INSERT INTO ADISYON (MasaId, PersonelId, Tarih, Durum, OdemeAraclariId, ToplamTutar) 
VALUES (1, 2, GETDATE()-1, 0, 1, 950); 
-- Bu adisyonun detayları (Yenenler):
INSERT INTO ADISYONHAREKET (AdisyonId, UrunId, Miktar, BirimFiyat, ToplamFiyat) VALUES
(1, 1, 2, 350, 700), -- 2 Adana
(1, 14, 2, 25, 50), -- 2 Ayran
(1, 11, 1, 150, 150), -- 1 Künefe
(1, 16, 1, 50, 50);  -- 1 Kahve

-- SENARYO 2: Bugün kapanmış masa (Kredi Kartı)
INSERT INTO ADISYON (MasaId, PersonelId, Tarih, Durum, OdemeAraclariId, ToplamTutar) 
VALUES (10, 5, GETDATE(), 0, 2, 1450);
-- Detaylar:
INSERT INTO ADISYONHAREKET (AdisyonId, UrunId, Miktar, BirimFiyat, ToplamFiyat) VALUES
(2, 2, 2, 550, 1100), -- 2 Karışık Izgara
(2, 13, 2, 45, 90),   -- 2 Kola
(2, 9, 2, 120, 240),  -- 2 Sezar Salata
(2, 15, 2, 10, 20);   -- 2 Su

-- SENARYO 3: Şuan AÇIK olan bir masa (Hala oturuyorlar)
INSERT INTO ADISYON (MasaId, PersonelId, Tarih, Durum, OdemeAraclariId, ToplamTutar) 
VALUES (22, 2, GETDATE(), 1, NULL, 0); -- Ödeme Aracı NULL çünkü ödemedi daha
-- Detaylar (Sipariş vermeye devam ediyorlar):
INSERT INTO ADISYONHAREKET (AdisyonId, UrunId, Miktar, BirimFiyat, ToplamFiyat) VALUES
(3, 16, 4, 50, 200), -- 4 Kahve
(3, 12, 2, 90, 180); -- 2 Sütlaç

-- SENARYO 4: Kalabalık grup (Geçen hafta)
INSERT INTO ADISYON (MasaId, PersonelId, Tarih, Durum, OdemeAraclariId, ToplamTutar) 
VALUES (5, 5, GETDATE()-3, 0, 2, 3200);
INSERT INTO ADISYONHAREKET (AdisyonId, UrunId, Miktar, BirimFiyat, ToplamFiyat) VALUES
(4, 4, 5, 400, 2000), -- 5 Et Sote
(4, 5, 5, 60, 300),   -- 5 Çorba
(4, 7, 3, 50, 150),   -- 3 Salata
(4, 13, 5, 45, 225),  -- 5 Kola
(4, 10, 3, 150, 450); -- 3 Künefe

GO