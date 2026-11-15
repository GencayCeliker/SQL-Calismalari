CREATE TABLE TblYazarlar 
(
YzrId INT IDENTITY PRIMARY KEY,
AdSoyad NVARCHAR(50) NOT NULL
)
GO
CREATE TABLE TblUyeler
(
UyeId INT IDENTITY PRIMARY KEY,
Ad NVARCHAR(50) NOT NULL,
Soyad NVARCHAR(50) NOT NULL,
TCKimlikNo NCHAR(11) UNIQUE CHECK(TCKimlikNo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0,2,4,6,8]') NOT NULL,
Tel NCHAR(11) NOT NULL,
Adres NVARCHAR(250) NOT NULL
)
GO
CREATE TABLE TblKitap
(
KitapId INT IDENTITY PRIMARY KEY,
ISBN NCHAR(13) UNIQUE CHECK (ISBN LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
KitapAdi NVARCHAR(250) NOT NULL,
Sayfa INT NOT NULL,
Adet INT NOT NULL,
YzrId INT FOREIGN KEY REFERENCES TblYazarlar(YzrId)
)
GO
Create Table TblUyeKitap
(
Id INT IDENTITY PRIMARY KEY,
KitapId INT FOREIGN KEY REFERENCES TblKitap(KitapId),
UyeId INT FOREIGN KEY REFERENCES TblUyeler(UyeId),
OVTarihi DATETIME NOT NULL,
GATarihi DATETIME NOT NULL
)
GO
INSERT INTO TblYazarlar
VALUES ('Ömer Seyfettin'),
('Yahya Kemal'),
('Namık Kemal '),
('Orhan Pamuk'),
('Halit Ziya Uşaklıgil')
GO
INSERT INTO TblUyeler 
VALUES('Yunus Emre','Gunay','10000000046','Tekirdağ','5554567892'),
('Emrah','Çapkan','10000000047','Niğde','5512561242'),
('Semih','Çalışkan','10000000048','Manisa','5457541525'),
('Menşure','Çapraz','10000000049','Çorum','5197851524'),
('Habibe','Kaya','10000000050','Kütahya','5435354820'),
('Hasan','Çifçier','10000000051','Yozgat','5217851512'),
('Aynur Sude','Kandemir','10000000052','Tokat','535467850'),
('Gülay','Demircan','10000000053','Ankara','5354855545'),
('Gencay','Çeliker','10000000054','Bartın','5358465575'),
('Kerem','Çetin','10000000055','İstanbul','5234567891'),
('Muhammet','Aydın','10000000056','İstanbul','5345678912')
GO
INSERT INTO TblKitap
VALUES
('9874563214568','Kaşağı',75,15,1),
('9874563214567','Topuz',80,23,1),
('9874563214566','Falaka',80,18,1),
('9874563214565','Kendi Gök Kubbemiz',120,8,2),
('9874563214564','Eski Şiirin Rüzgariyle',88,9,2),
('9874563214563','İntibah',191,21,'3'),
('9874563214562','Vatan Yahut Silistre',88,13,3),
('9874563214561','Masumiyet Müzesi',592,26,4),
('9874563214591','Kar',436,22,4),
('9874563214592','Aşkı Memnu',215,20,5),
('9874563214593','Mavi Ve Siyah',356,11,5),
('9874563214594','Ferdi Ve Şürekası',185,14,5)
GO
