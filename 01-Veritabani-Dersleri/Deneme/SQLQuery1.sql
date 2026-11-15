create database adahannakliyat
go

use adahannakliyat
go

create table TIRLAR
(
TNO int identity primary key,
arac nvarchar(250)
)
go

create table soforler
(
Sira int identity primary key,
ad nvarchar(250),
soyad nvarchar(250),
telno char(11) unique check (telno like '[0][5][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
aracı int foreign key references TIRLAR(TNO)
)
go
