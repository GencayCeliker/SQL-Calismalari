USE UYGULAMA
GO
INSERT INTO tblOGRENCI ( AdSoyad, OkulNo, TCKimlikNo, BolumAdi)
VALUES('Yeter Bezar','100000001','10000000008','Bilgisayar Programcılığı'),
('Kerem Çetin','100000002','10000000009','Bilgisayar Programcılığı'),
('Mustafa Altınkaynak','100000003','10000000010','Lojistik'),
('Habibe Kaya','100000004','10000000011','Lojistik'),
('Emrah Çapkan','100000005','10000000012','Maliye'),
('Yusuf Erdoğan','100000006','10000000013','Maliye'),
('Gencay Çeliker','100000007','10000000014','Bilgisayar Programcılığı')

SELECT * FROM tblOGRENCI
USE UYGULAMA
GO
INSERT INTO tblBolumler (BlmAdi)
VALUES('Bilgisayar Programcılığı'),
('Gıda Teknolojisi'),
('Mimari Restarasyon'),
('Tapu ve Kadastro'),
('Bankacılık Ve Sigortacılık'),
('Maliye'),
('Lojistik')

SELECT * FROM tblBolumler
