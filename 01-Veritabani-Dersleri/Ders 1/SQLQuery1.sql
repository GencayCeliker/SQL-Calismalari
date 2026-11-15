create database uygulama
go
--önceki komut ile işim bitti.

--Artık uygulama veritabanını kullanıma açalım.
USE uygulama
go

create table bolum
(
Sira int identity Primary Key,
--identity default değeri (1,1) dir.
BolumAdi nvarchar(250)
)
go

create table personel
(
Sira int identity(1,1) primary key,
--Sira alanını tamsayı sayısal tipinde tanımladık.
--kimlik numarası verdik. 1den başlatıp 1'er 1'er artışla gitmesini söyledik.
--Birincil anahtar(PK) olarak atadık.
--NOT:identity tamamen veritabanı kontrolündedir. Bu alana kullanıcı veri girişi yapamaz.
Ad nvarchar(250),
Soyad nvarchar(250),
TCKimlik nchar(11) unique check (TCKimlik like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][02468]'),--her [] bir sayı temsil etmek like benzesin anlamında
--ÖNCELİKLE YABANCI ANAHTAR(FK) OLMAYAN TABLO HAZIRLANIR 
BolumAdi int foreign key references bolum(Sira)
)

go