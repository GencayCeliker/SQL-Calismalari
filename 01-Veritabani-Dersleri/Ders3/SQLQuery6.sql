-- Kullanıcının girdiği sayıyı r kabul edip bu r sayısına göre
--Küre hacmi hesaplayan fonksiyonu kodlayınız
drop function if exists dbo.hacim
go
create function dbo.hacim(@r float)
returns float --sayıları geri

as begin 
return (4.0/3.0)*PI()*@r*@r*@r --geri döndürme
end