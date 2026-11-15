CREATE DATABASE MolyLoyalty;
GO
USE MolyLoyalty;
GO
CREATE TABLE UyelikTipleri (
    TipID INT PRIMARY KEY IDENTITY(1,1),
    TipAd VARCHAR(20),      -- Altın, Gümüş, Normal
    IndirimOrani DECIMAL(5,2) -- 0.15, 0.10 gibi
);
CREATE TABLE Musteriler (
    MID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(100),
    TipID INT,              -- Foreign Key (UyelikTipleri'ne bağlı)
    MevcutPuan INT DEFAULT 0,
    CONSTRAINT FK_MusteriTip FOREIGN KEY (TipID) REFERENCES UyelikTipleri(TipID)
);
CREATE TABLE Siparisler (
    SID INT PRIMARY KEY IDENTITY(1,1),
    MID INT,                -- Foreign Key (Musteriler'e bağlı)
    HamTutar DECIMAL(10,2), -- İndirimsiz fiyat
    NetTutar DECIMAL(10,2), -- Cursor tarafından hesaplanacak
    CONSTRAINT FK_SiparisMusteri FOREIGN KEY (MID) REFERENCES Musteriler(MID)
);


-- Üyelik Tiplerini ekleyelim
INSERT INTO UyelikTipleri (TipAd, IndirimOrani) VALUES ('Altın', 0.15), ('Gümüş', 0.10), ('Normal', 0.00);

-- Müşterileri ekleyelim
INSERT INTO Musteriler (AdSoyad, TipID, MevcutPuan) VALUES 
('Gencay Çeliker', 1, 1200), -- Altın üye + 1000'den fazla puanı var
('Ali Veli', 2, 500),        -- Gümüş üye
('Ayşe Yılmaz', 3, 100);     -- Normal üye

-- Bekleyen Siparişleri ekleyelim (NetTutar şu an 0)
INSERT INTO Siparisler (MID, HamTutar, NetTutar) VALUES 
(1, 10000, 0), -- Gencay'ın 10.000 TL'lik siparişi
(2, 5000, 0),  -- Ali'nin 5.000 TL'lik siparişi
(3, 2000, 0);  -- Ayşe'nin 2.000 TL'lik siparişi