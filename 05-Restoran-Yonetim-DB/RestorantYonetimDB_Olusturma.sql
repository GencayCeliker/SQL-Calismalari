USE master;
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'RestorantYonetimDB')
BEGIN
    ALTER DATABASE RestorantYonetimDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RestorantYonetimDB;
END
GO
CREATE DATABASE RestorantYonetimDB
GO
USE RestorantYonetimDB
GO
CREATE TABLE Kullanicilar (
    KullaniciID INT IDENTITY(1,1) PRIMARY KEY,
    KullaniciAdSoyad NVARCHAR(100),
	KullaniciEmail NVARCHAR(150),
	KullaniciAdi NVARCHAR(18),
	Sifre NVARCHAR(18),
	KullaniciResim NVARCHAR(max),
	Yetki NVARCHAR(1),
	GUNLUKHARCAMA BIT,
	MUHASEBE BIT,
	CEKSENET BIT,
	SATISDURUMU BIT,
	PERSONEL BIT,
	MUSTERIFIRMA BIT,
	STOK BIT,
	URUNLER BIT,
	REZERVASYON BIT,
	VERITABANI BIT,
	YETKILENDIRMEYAP BIT,
);
CREATE TABLE Kategoriler (
    KategoriID INT IDENTITY(1,1) PRIMARY KEY,
    KategoriAdi NVARCHAR(100) NOT NULL
);

CREATE TABLE Masalar (
    MasaID INT IDENTITY(1,1) PRIMARY KEY,
    MasaNo INT,
    Kapasite INT NOT NULL CHECK(Kapasite >= 1 AND Kapasite <= 20),
    Aciklama NVARCHAR(255),
    Durum BIT DEFAULT 1
);

CREATE TABLE Musteriler (
    MusteriID INT IDENTITY(1,1) PRIMARY KEY,
    Adi NVARCHAR(100) NOT NULL,
    Soyadi NVARCHAR(100) NOT NULL,
    Telefon NVARCHAR(20),
    Email NVARCHAR(100),
    Aciklama NVARCHAR(255)
);

CREATE TABLE Firmalar (
    FirmaId INT IDENTITY(1,1) PRIMARY KEY, -- PK eklendi
    FirmaAdi NVARCHAR(100) NOT NULL,
    Unvan NVARCHAR(50) NULL,
    Telefon NVARCHAR(30) NOT NULL,
    Telefonİki NVARCHAR(30) NULL,
    Email NVARCHAR(100) NOT NULL,
    Adres NVARCHAR(200) NOT NULL,
    WebSitesi NVARCHAR (250) NULL,
    VergiDairesi NVARCHAR(max) NULL,
    HesapNo NVARCHAR(max) NULL,
    Durumu BIT NULL
);

CREATE TABLE Personeller (
    PersonelID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(100) NOT NULL,
    Soyad NVARCHAR(100) NOT NULL,
    TCKimlikNo NCHAR(11) NOT NULL UNIQUE CHECK(TCKimlikNo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][02468]'),
    Telefon NCHAR(12) NOT NULL,
    Adres NVARCHAR(200) NOT NULL,
    Email NVARCHAR(250) NOT NULL,
    Pozisyon NVARCHAR(100) NOT NULL,
    Tarih DATE NOT NULL,
    Durum BIT NULL DEFAULT(1),
    Resim NVARCHAR(500)
);

CREATE TABLE Giderler (
    GiderID INT IDENTITY(1,1) PRIMARY KEY,
    Tarih DATETIME NOT NULL,
    Unvan NVARCHAR(150) NOT NULL,
    Adi NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(255),
    Tutar DECIMAL(18, 2) NOT NULL
);

CREATE TABLE Gelirler (
    GelirID INT IDENTITY(1,1) PRIMARY KEY,
    Tarih DATETIME NOT NULL,
    Unvan NVARCHAR(150) NOT NULL,
    Adi NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(255),
    Tutar DECIMAL(18, 2) NOT NULL
);

CREATE TABLE GunlukHarcamalar (
    HarcamaID INT IDENTITY(1,1) PRIMARY KEY,
    HarcananYer NVARCHAR(100) NOT NULL,
    Tutar DECIMAL(18, 2) NOT NULL,
    Aciklama NVARCHAR(255),
    Tarih DATE NOT NULL,
    Saat TIME NOT NULL
);


CREATE TABLE Urunler (
    UrunID INT IDENTITY(1,1) PRIMARY KEY,
    UrunAdi NVARCHAR(100) NOT NULL,
    BirimFiyati DECIMAL(18, 2) NOT NULL,
    StokAdedi INT NOT NULL,
    KategoriID INT FOREIGN KEY REFERENCES Kategoriler(KategoriID),
    FirmaID INT FOREIGN KEY REFERENCES Firmalar(FirmaID),
    Aciklama NVARCHAR(255),
    ResimYolu NVARCHAR(255),
    EklenmeTarihi DATETIME DEFAULT GETDATE(),
    Durum BIT DEFAULT 1
);

CREATE TABLE PersonelOdemeleri (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    PersonelID INT FOREIGN KEY REFERENCES Personeller(PersonelID),
    GiderId INT FOREIGN KEY REFERENCES Giderler(GiderID),    
    Tur NVARCHAR(50),
    Aciklama NVARCHAR(100),
    Tutar DECIMAL(18, 2),
    Tarih DATE
);

CREATE TABLE FirmaOdemeleri (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirmaId INT FOREIGN KEY REFERENCES Firmalar(FirmaId),
    Aciklama NVARCHAR(100),
    Tutar DECIMAL(18, 2),
    Tarih DATE
);

CREATE TABLE FirmaHareketleri (
    HareketID INT IDENTITY(1,1) PRIMARY KEY,
    FirmaID INT FOREIGN KEY REFERENCES Firmalar(FirmaId),
    UrunID INT FOREIGN KEY REFERENCES Urunler(UrunID),
    Adet INT NOT NULL,
    Aciklama NVARCHAR(255),
    Tutar DECIMAL(18, 2),
    Tarih DATETIME
);

CREATE TABLE MusteriOdemeleri (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    MasaID INT FOREIGN KEY REFERENCES Masalar(MasaID),
    BorcTutar DECIMAL(18, 2),
    OdemeTutar DECIMAL(18, 2),
    Aciklama NVARCHAR(100),
    Tarih DATE,
    GelirID INT FOREIGN KEY REFERENCES Gelirler(GelirID)
);

CREATE TABLE Siparisler (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    MasaID INT FOREIGN KEY REFERENCES Masalar(MasaID),
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    PersonelID INT FOREIGN KEY REFERENCES Personeller(PersonelID),
    ToplamTutar DECIMAL(18, 2) NOT NULL,
    Tarih DATETIME DEFAULT GETDATE(),
    Durum BIT DEFAULT 1
);

CREATE TABLE SiparisDetaylari (
    SiparisDetayID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT FOREIGN KEY REFERENCES Siparisler(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urunler(UrunID),
    Adet INT NOT NULL CHECK(Adet >= 1),
    BirimFiyat DECIMAL(18, 2) NOT NULL,
    ToplamFiyat AS (Adet * BirimFiyat),
    Aciklama NVARCHAR(255)
);

CREATE TABLE MasaRezervasyonlari (
    RezervasyonID INT IDENTITY(1,1) PRIMARY KEY,
    MasaID INT FOREIGN KEY REFERENCES Masalar(MasaID),
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    KisiSayisi INT CHECK(KisiSayisi >= 1 AND KisiSayisi <= 20),
    Tarihi DATE NOT NULL,
    Saat TIME NOT NULL,
    Aciklama NVARCHAR(255),
    Durum BIT DEFAULT 1
);

CREATE TABLE StokHareketleri (
    StokHareketID INT IDENTITY(1,1) PRIMARY KEY,
    UrunID INT FOREIGN KEY REFERENCES Urunler(UrunID),
    FirmaID INT FOREIGN KEY REFERENCES Firmalar(FirmaID),
    HareketTipi NVARCHAR(20),
    BirimFiyat DECIMAL(18, 2),
    IslemTuru NVARCHAR(50) NOT NULL,
    Adet INT NOT NULL,
    Tarih DATE DEFAULT GETDATE(),
    Saat TIME DEFAULT CONVERT(TIME, GETDATE()),
    Aciklama NVARCHAR(255)
);

CREATE TABLE Bordrolar (
    BordroID INT IDENTITY(1,1) PRIMARY KEY,
    PersonelID INT FOREIGN KEY REFERENCES Personeller(PersonelID),
    Donem NVARCHAR(20) NOT NULL,
    Ay SMALLINT NOT NULL,
    Yil SMALLINT NOT NULL,
    AnaMaas DECIMAL(10, 2) NOT NULL,
    Prim DECIMAL(8, 2) NULL,
    Kesinti DECIMAL(8, 2) NULL,
    Avans DECIMAL(8, 2) NULL,
    GelirVergisi DECIMAL(18, 2) DEFAULT 0,
    SgkKesintisi DECIMAL(18, 2) DEFAULT 0,
    NetMaaş AS (CONVERT(DECIMAL(10,2),((AnaMaas+Prim)-Kesinti)-Avans -GelirVergisi - SgkKesintisi)) PERSISTED,
    Tarih DATE DEFAULT GETDATE()
);

CREATE TABLE CekSenet (
    CekSenetID INT IDENTITY(1,1) PRIMARY KEY,
    SatisNo INT NULL,
    MusteriId INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    FirmaId INT FOREIGN KEY REFERENCES Firmalar(FirmaId),
    Tutar DECIMAL(18, 2) NOT NULL,
    OdemeTuru NVARCHAR(50) NULL,
    PersonelId INT NULL,
    YTarih DATE NOT NULL,
    OTarih DATE NULL,
    Aciklama NVARCHAR(200) NULL,
    Durum BIT NULL
);
CREATE TABLE Maas 
(
    MaasID INT IDENTITY(1,1) PRIMARY KEY,
    PersonelID INT FOREIGN KEY REFERENCES Personeller(PersonelID),
    NetTutar DECIMAL(18, 2) NOT NULL,
    BaslangicTarih DATE NOT NULL
)