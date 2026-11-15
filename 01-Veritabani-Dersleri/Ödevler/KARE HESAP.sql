--Soru 3:Kullanıcı tarafından girilen sayının karesini hesaplayan fonksiyonu kodlayınız.
use UYGULAMAx
go

drop function if exists dbo.kare
go

create function dbo.kare(@sayi int)
returns int
as begin

declare @sonuc int=@sayi*@sayi

return @sonuc
--return @sayi*@sayi			bu yontemde olur yukardaki de olur
end
