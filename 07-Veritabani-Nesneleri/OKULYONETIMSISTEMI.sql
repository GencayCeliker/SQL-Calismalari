/* OKULYONETIMSISTEMI veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'OKULYONETIMSISTEMI') IS NULL CREATE DATABASE [OKULYONETIMSISTEMI];
GO
USE [OKULYONETIMSISTEMI];
GO

CREATE TABLE [dbo].[BOLUMLER] (
    [BolumKod] int IDENTITY(1,1) NOT NULL,
    [BolumAdi] nvarchar(100) NOT NULL,
    CONSTRAINT [PK__BOLUMLER__4BC8DE114883130B] PRIMARY KEY ([BolumKod])
);
GO

CREATE TABLE [dbo].[DERSKAYIT] (
    [DKKod] int IDENTITY(1,1) NOT NULL,
    [OgrKod] int NULL,
    [DersKod] int NULL,
    CONSTRAINT [PK__DERSKAYI__87E5BAE1A4665C6C] PRIMARY KEY ([DKKod])
);
GO

CREATE TABLE [dbo].[DERSLER] (
    [DersKod] int IDENTITY(1,1) NOT NULL,
    [DersAdi] nvarchar(100) NOT NULL,
    [Kredi] nchar(30) NOT NULL,
    [Donem] nchar(4) NOT NULL,
    [BolumKod] int NULL,
    CONSTRAINT [PK__DERSLER__3BC3D3AE3BBB0539] PRIMARY KEY ([DersKod])
);
GO

CREATE TABLE [dbo].[OGRENCI] (
    [OgrKod] int IDENTITY(1,1) NOT NULL,
    [AdSoyad] nvarchar(100) NOT NULL,
    [OkulNo] nchar(9) NOT NULL,
    [Tel] nchar(11) NOT NULL,
    [Adres] nvarchar(250) NOT NULL,
    [BolumKod] int NULL,
    CONSTRAINT [PK__OGRENCI__DB1557CE8669EADE] PRIMARY KEY ([OgrKod]),
    CONSTRAINT [UQ__OGRENCI__F359CB087789C7BA] UNIQUE ([OkulNo])
);
GO

SET IDENTITY_INSERT [dbo].[BOLUMLER] ON;
INSERT INTO [dbo].[BOLUMLER] ([BolumKod], [BolumAdi]) VALUES (1, N'Bilgisayar Programcılığı');
INSERT INTO [dbo].[BOLUMLER] ([BolumKod], [BolumAdi]) VALUES (2, N'Mahkeme Büro Hizmetleri');
INSERT INTO [dbo].[BOLUMLER] ([BolumKod], [BolumAdi]) VALUES (3, N'Tapu');
INSERT INTO [dbo].[BOLUMLER] ([BolumKod], [BolumAdi]) VALUES (4, N'Eczacılık');
SET IDENTITY_INSERT [dbo].[BOLUMLER] OFF;
GO

SET IDENTITY_INSERT [dbo].[DERSKAYIT] ON;
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (1, 1, 1);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (2, 2, 2);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (3, 3, 3);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (4, 5, 4);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (5, 2, 3);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (6, 2, 4);
INSERT INTO [dbo].[DERSKAYIT] ([DKKod], [OgrKod], [DersKod]) VALUES (7, 3, 1);
SET IDENTITY_INSERT [dbo].[DERSKAYIT] OFF;
GO

SET IDENTITY_INSERT [dbo].[DERSLER] ON;
INSERT INTO [dbo].[DERSLER] ([DersKod], [DersAdi], [Kredi], [Donem], [BolumKod]) VALUES (1, N'Veri Tabnı1', N'5                             ', N'1   ', 1);
INSERT INTO [dbo].[DERSLER] ([DersKod], [DersAdi], [Kredi], [Donem], [BolumKod]) VALUES (2, N'Ana Yasa Maddeleri', N'6                             ', N'2   ', 2);
INSERT INTO [dbo].[DERSLER] ([DersKod], [DersAdi], [Kredi], [Donem], [BolumKod]) VALUES (3, N'Arazi Ölçümü', N'4                             ', N'3   ', 3);
INSERT INTO [dbo].[DERSLER] ([DersKod], [DersAdi], [Kredi], [Donem], [BolumKod]) VALUES (4, N'İlaç Üretim', N'4                             ', N'3   ', 4);
SET IDENTITY_INSERT [dbo].[DERSLER] OFF;
GO

SET IDENTITY_INSERT [dbo].[OGRENCI] ON;
INSERT INTO [dbo].[OGRENCI] ([OgrKod], [AdSoyad], [OkulNo], [Tel], [Adres], [BolumKod]) VALUES (1, N'Gecay Çeliker', N'100000001', N'05550000007', N'İstanbul', 1);
INSERT INTO [dbo].[OGRENCI] ([OgrKod], [AdSoyad], [OkulNo], [Tel], [Adres], [BolumKod]) VALUES (2, N'Kerem Çetin', N'100000002', N'05550000008', N'Tokat', 2);
INSERT INTO [dbo].[OGRENCI] ([OgrKod], [AdSoyad], [OkulNo], [Tel], [Adres], [BolumKod]) VALUES (3, N'Yusuf Alp', N'100000003', N'05550000009', N'Çorum', 3);
INSERT INTO [dbo].[OGRENCI] ([OgrKod], [AdSoyad], [OkulNo], [Tel], [Adres], [BolumKod]) VALUES (5, N'Ahmet Çeliker', N'100000004', N'05550000007', N'Ankara', 4);
SET IDENTITY_INSERT [dbo].[OGRENCI] OFF;
GO

ALTER TABLE [dbo].[DERSKAYIT] ADD CONSTRAINT [FK__DERSKAYIT__DersK__5535A963] FOREIGN KEY ([DersKod]) REFERENCES [dbo].[DERSLER] ([DersKod]);
GO
ALTER TABLE [dbo].[DERSKAYIT] ADD CONSTRAINT [FK__DERSKAYIT__OgrKo__5441852A] FOREIGN KEY ([OgrKod]) REFERENCES [dbo].[OGRENCI] ([OgrKod]);
GO
ALTER TABLE [dbo].[DERSLER] ADD CONSTRAINT [FK__DERSLER__BolumKo__5165187F] FOREIGN KEY ([BolumKod]) REFERENCES [dbo].[BOLUMLER] ([BolumKod]);
GO
ALTER TABLE [dbo].[OGRENCI] ADD CONSTRAINT [FK__OGRENCI__BolumKo__4E88ABD4] FOREIGN KEY ([BolumKod]) REFERENCES [dbo].[BOLUMLER] ([BolumKod]);
GO

CREATE PROCEDURE spDersGetir
AS BEGIN
SELECT DERSLER.DersKod
      ,DERSLER.DersAdi
      ,DERSLER.Kredi
      ,DERSLER.Donem
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
  FROM DERSLER INNER JOIN BOLUMLER ON DERSLER.BolumKod=BOLUMLER.BolumKod
  END
GO

CREATE PROCEDURE spDersKayit
@DersKod INT,
@OgrKod INT
AS BEGIN
INSERT INTO DERSKAYIT(OgrKod,DersKod)
VALUES(@OgrKod,@DersKod)
END
GO

CREATE PROCEDURE spDersVer
@DersKod INT,
@OgrKod INT
AS BEGIN
INSERT INTO DERSKAYIT(OgrKod,DersKod)
VALUES(@OgrKod,@DersKod)
END
GO

CREATE PROCEDURE spDKayit
@OgrKod INT,
@DersKod INT
AS BEGIN
INSERT INTO DERSKAYIT(OgrKod,DersKod)
VALUES(@OgrKod,@DersKod)
END
GO

CREATE PROCEDURE spIslem
@OgrKod INT
AS BEGIN
SELECT DERSKAYIT.DersKod
      ,OGRENCI.OgrKod
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
      ,DERSLER.DersKod
      ,DERSLER.DersAdi
      ,DERSLER.Donem
      ,DERSLER.Kredi
     
  FROM DERSKAYIT INNER JOIN OGRENCI ON DERSKAYIT.OgrKod=OGRENCI.OgrKod 
                 INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
                 INNER JOIN DERSLER ON DERSLER.DersKod=DERSKAYIT.DersKod
END
GO

CREATE PROCEDURE spIslem1
AS BEGIN
SELECT DERSKAYIT.DersKod
      ,OGRENCI.OgrKod
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
      ,DERSLER.DersKod
      ,DERSLER.DersAdi
      ,DERSLER.Donem
      ,DERSLER.Kredi
     
  FROM DERSKAYIT INNER JOIN OGRENCI ON DERSKAYIT.OgrKod=OGRENCI.OgrKod 
                 INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
                 INNER JOIN DERSLER ON DERSLER.DersKod=DERSKAYIT.DersKod
END
GO

CREATE PROCEDURE spIslem2
AS BEGIN
SELECT DERSKAYIT.DersKod
      ,OGRENCI.OgrKod
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
      ,DERSLER.DersAdi
      ,DERSLER.Donem
      ,DERSLER.Kredi
     
  FROM DERSKAYIT INNER JOIN OGRENCI ON DERSKAYIT.OgrKod=OGRENCI.OgrKod 
                 INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
                 INNER JOIN DERSLER ON DERSLER.DersKod=DERSKAYIT.DersKod
END
GO

CREATE PROCEDURE spIslem3
AS BEGIN
SELECT DERSKAYIT.DKKod
      ,OGRENCI.OgrKod
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
      ,DERSLER.DersKod
      ,DERSLER.DersAdi
      ,DERSLER.Donem
      ,DERSLER.Kredi
     
  FROM DERSKAYIT INNER JOIN OGRENCI ON DERSKAYIT.OgrKod=OGRENCI.OgrKod 
                 INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
                 INNER JOIN DERSLER ON DERSLER.DersKod=DERSKAYIT.DersKod
END
GO

CREATE PROCEDURE spIslemListele
AS BEGIN
SELECT DERSKAYIT.DersKod
      ,OGRENCI.OgrKod
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,BOLUMLER.BolumAdi
      ,BOLUMLER.BolumKod
      ,DERSLER.DersKod
      ,DERSLER.DersAdi
      ,DERSLER.Donem
      ,DERSLER.Kredi
     
  FROM DERSKAYIT INNER JOIN OGRENCI ON DERSKAYIT.OgrKod=OGRENCI.OgrKod 
                 INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
                 INNER JOIN DERSLER ON DERSLER.DersKod=DERSKAYIT.DersKod
END
GO

CREATE PROCEDURE spOgrenciListele
AS BEGIN
SELECT OGRENCI.OgrKod 
      ,OGRENCI.AdSoyad
      ,OGRENCI.OkulNo
      ,OGRENCI.Tel
      ,OGRENCI.Adres
      ,BOLUMLER.BolumKod
      ,BOLUMLER.BolumAdi
  FROM OGRENCI INNER JOIN BOLUMLER ON OGRENCI.BolumKod=BOLUMLER.BolumKod
  END
GO
