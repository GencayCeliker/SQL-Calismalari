USE RestorantYonetimDB;
GO

-- 1. KATEGORİLER (10 Adet)
INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Ana Yemekler'), ('Ara Sıcaklar'), ('Tatlılar'), ('İçecekler'), ('Deniz Ürünleri'), 
('Salatalar'), ('Fast Food'), ('Kahvaltılıklar'), ('Soslar'), ('Ekstralar');

-- 2. MASALAR (15 Adet)
INSERT INTO Masalar (MasaNo, Kapasite, Aciklama, Durum) VALUES 
(1,4,'Cam Kenarı',1), (2,2,'İç Mekan',1), (3,6,'Grup',1), (4,4,'Bahçe',1), (5,4,'VIP',1),
(6,2,'Bar',1), (7,4,'Bahçe',1), (8,2,'İç Mekan',1), (9,8,'Toplantı',1), (10,4,'Cam Kenarı',1),
(11,2,'Giriş',1), (12,4,'Bahçe Sol',1), (13,4,'Bahçe Sağ',1), (14,6,'Teras',1), (15,2,'Teras Köşe',1);

-- 3. MÜŞTERİLER (12 Adet)
INSERT INTO Musteriler (Adi, Soyadi, Telefon, Email) VALUES 
('Gencay', 'Çeliker', '05550000006', 'gencay@mail.com'), --
('Mustafa', 'Altınkayak', '05550000007', 'mustafa@mail.com'),
('Ahmet', 'Çolak', '05550000008', 'ahmet@mail.com'),
('Selin', 'Erdoğan', '05550000009', 'selin@mail.com'),
('Kerem', 'Çetin', '05550000010', 'kerem@mail.com'),
('Emre', 'Yıldız', '05550000011', 'emre@mail.com'),
('Zeynep', 'Aslan', '05550000012', 'zeynep@mail.com'),
('Can', 'Öztürk', '05550000013', 'can@mail.com'),
('Elif', 'Turan', '05550000014', 'elif@mail.com'),
('Burak', 'Demir', '05550000015', 'burak@mail.com'),
('Hülya', 'Avşar', '05550000016', 'hulya@mail.com'),
('Mert', 'Korkmaz', '05550000017', 'mert@mail.com');

-- 4. FİRMALAR (10 Adet)
INSERT INTO Firmalar (FirmaAdi, Unvan, Telefon, Email, Adres, Durumu) VALUES 
('Anadolu Et ve Süt Ürünleri A.Ş.', 'Et Tedarik', '05550000026', 'kurumsal@anadoluet.com', 'İstanbul', 1),
('Yeşilbahçe Sebze Meyve Hali', 'Manav', '05550000027', 'siparis@yesilbahce.com', 'Kocaeli', 1),
('Toptan İçecek Dağıtım Merkezi', 'İçecek', '05550000028', 'lojistik@toptanicecek.com', 'Ankara', 1),
('Mutfak Ekipmanları A.Ş.', 'Endüstriyel Mutfak', '05550000029', 'servis@mutfak.com', 'Bursa', 1),
('Temizlik ve Hijyen Çözümleri Ltd.', 'Kimyasal', '05550000030', 'hijyen@temizlik.com', 'İstanbul', 1),
('Denizden Taze Su Ürünleri', 'Balıkçı', '05550000031', 'taze@denizden.com', 'İzmir', 1),
('Has Un ve Nişasta Fabrikası', 'Unlu Mamul', '05550000032', 'un@has.com', 'Konya', 1),
('Sütçü Amca Çiftliği', 'Mandıra', '05550000033', 'sut@sutcuamca.com', 'Sakarya', 1),
('Baharat Dünyası Ltd.', 'Baharat', '05550000034', 'lezzet@baharat.com', 'Gaziantep', 1),
('Ambalaj Sepeti', 'Paketleme', '05550000035', 'kutu@ambalaj.com', 'İstanbul', 1);

-- 5. PERSONELLER (10 Adet)
INSERT INTO Personeller (Ad, Soyad, TCKimlikNo, Telefon, Adres, Email, Pozisyon, Tarih, Durum, Resim) VALUES 
('Gencay', 'Çeliker', '10000000036', '05550000006', 'İstanbul', 'gencay@mail.com', 'Müdür', '2020-02-14', 1, 'gencay.jpg'), --
('Hüseyin', 'Yüce', '10000000037', '05550000018', 'İstanbul', 'huseyin@mail.com', 'Müdür Yardımcısı', '2021-03-10', 1, 'huseyin.jpg'),
('Tolga', 'Aksoy', '10000000038', '05550000019', 'Ankara', 'tolga@mail.com', 'Aşçıbaşı', '2022-05-15', 1, 'tolga.jpg'),
('Mustafa', 'Altınkaynak', '10000000039', '05550000007', 'İstanbul', 'mustafa@mail.com', 'Garson', '2023-01-05', 1, 'mustafa.jpg'),
('Buğrahan', 'Yılmaz', '10000000040', '05550000020', 'İstanbul', 'bugra@mail.com', 'Aşçı Yard.', '2023-06-20', 1, 'bugra.jpg'),
('Elmas', 'Mutlu', '10000000041', '05550000021', 'İstanbul', 'elmas@mail.com', 'Temizlik', '2023-02-12', 1, 'elmas.jpg'),
('Kadir', 'Kara', '10000000042', '05550000022', 'İstanbul', 'kadir@mail.com', 'Tezgahtar', '2022-11-30', 1, 'kadir.jpg'),
('Kerem', 'Çetin', '10000000043', '05550000023', 'İstanbul', 'kerem@mail.com', 'Garson', '2023-08-14', 1, 'kerem_p.jpg'),
('Ahmet', 'Çakır', '10000000044', '05550000024', 'İstanbul', 'cakir@mail.com', 'Aşçı', '2022-04-18', 1, 'cakir.jpg'),
('Adahan', 'Akdeniz', '10000000045', '05550000025', 'İstanbul', 'adahan@mail.com', 'Garson', '2023-09-01', 1, 'adahan.jpg');

-- 6. ÜRÜNLER (15 Adet)
INSERT INTO Urunler (UrunAdi, BirimFiyati, StokAdedi, KategoriID, FirmaID, Aciklama, Durum) VALUES 
('Adana Kebap', 280.00, 45, 1, 1, 'Özel Zırh Kıyma', 1),
('Kaşarlı Köfte', 240.00, 30, 1, 1, 'Erimiş Kaşarlı', 1),
('Mercimek Çorbası', 85.00, 100, 2, 2, 'Süzme', 1),
('Paçanga Böreği', 120.00, 25, 2, 2, 'Pastırmalı', 1),
('Fırın Sütlaç', 95.00, 20, 3, 8, 'Hamsiköy Usulü', 1),
('Künefe', 150.00, 15, 3, 9, 'Hatay Usulü', 1),
('Kola 330ml', 45.00, 150, 4, 3, 'Kutu', 1),
('Ayran 300ml', 30.00, 200, 4, 8, 'Yayık', 1),
('Çupra Izgara', 380.00, 10, 5, 6, 'Ege Denizi', 1),
('Karides Tava', 320.00, 8, 5, 6, 'Tereyağlı', 1),
('Çoban Salata', 75.00, 50, 6, 2, 'Taze Sebze', 1),
('Hamburger Menü', 260.00, 40, 7, 1, '150gr Köfte', 1),
('Serpme Kahvaltı', 450.00, 20, 8, 8, '2 Kişilik', 1),
('Acı Sos', 25.00, 500, 9, 9, 'Meksika Biberli', 1),
('Patates Kızartması', 90.00, 60, 10, 2, 'Baharatlı', 1);

-- 7. GELİRLER (15 Adet)
INSERT INTO Gelirler (Tarih, Unvan, Adi, Aciklama, Tutar) VALUES 
('2025-12-24 10:18:59', 'Masa Hesabı', 'Masa 12', 'Nakit', 1250.00),
('2025-12-24 10:29:44', 'Masa Hesabı', 'Masa 5', 'Kredi Kartı', 840.00),
('2025-12-24 10:31:19', 'Masa Hesabı', 'Masa 2', 'Nakit', 450.00),
('2025-12-25 00:05:00', 'Masa Hesabı', 'Masa 8', 'Kredi Kartı', 2100.00),
('2026-01-07 13:28:10', 'Çek Tahsilatı', 'Tolga Aksoy', 'Tahsil Edildi', 5000.00),
('2026-01-07 13:34:07', 'Masa Hesabı', 'Masa 1', 'Nakit', 320.00),
('2026-01-07 13:37:05', 'Masa Hesabı', 'Masa 3', 'Kredi Kartı', 1580.00);

-- 8. GİDERLER (15 Adet)
INSERT INTO Giderler (Tarih, Unvan, Adi, Aciklama, Tutar) VALUES 
('2025-11-09 12:00:00', 'Stok Alım', 'Anadolu Et', 'Karkas Et', 7500.00),
('2025-12-10 15:00:00', 'Kira', 'Emlak Yönetim', 'Aralık Kirası', 15000.00),
('2025-12-15 09:00:00', 'Fatura', 'EnerjiSA', 'Elektrik', 4200.00),
('2025-12-28 11:00:00', 'Maaş Ödemesi', 'Tolga Aksoy', 'Aralık Maaşı', 45000.00),
('2026-01-02 10:00:00', 'Senet Ödemesi', 'Mutfak Ekipmanları A.Ş.', 'Bulaşık Mak. Taksit', 5000.00),
('2026-01-05 14:00:00', 'Günlük Harcama', 'Market', 'Temizlik Malz.', 1250.00);

-- 9. GÜNLÜK HARCAMALAR
INSERT INTO GunlukHarcamalar (HarcananYer, Tutar, Aciklama, Tarih, Saat) VALUES 
('Yerel Market', 450.00, 'Eksik Baharatlar', '2026-01-24', '10:30:00'),
('Kasap Amca', 1200.00, 'Ekstra Kıyma', '2026-01-24', '11:15:00'),
('Fırın', 180.00, 'Taze Ekmek', '2026-01-24', '08:00:00');

-- 10. REZERVASYONLAR
INSERT INTO MasaRezervasyonlari (MasaID, MusteriID, KisiSayisi, Tarihi, Saat, Aciklama, Durum) VALUES 
(5, 4, 4, '2025-11-02', '01:30', 'Doğum günü Sürprizi', 1),
(7, 2, 3, '2025-10-25', '18:00', 'Özel Akşam Yemeği', 1),
(6, 6, 6, '2025-10-24', '19:30', 'İş Toplantısı', 1);

-- 11. BORDROLAR
INSERT INTO Bordrolar (PersonelID, Donem, Ay, Yil, AnaMaas, Prim, Kesinti, Avans, GelirVergisi, SgkKesintisi) VALUES 
(1, 'Ocak 2026', 1, 2026, 100000.00, 10000.00, 0, 0, 15000, 14000);

-- 12. ÇEK SENET
INSERT INTO CekSenet (MusteriId, FirmaId, Tutar, OdemeTuru, YTarih, OTarih, Aciklama, Durum) VALUES 
(NULL, 2, 5000.00, 'Çek', '2025-12-24', '2026-01-07', 'Alınacak', 0),
(NULL, 4, 5000.00, 'Senet', '2025-12-24', '2026-01-07', 'Alınacak', 0);