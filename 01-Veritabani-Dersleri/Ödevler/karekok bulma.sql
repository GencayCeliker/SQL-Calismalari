--Soru 4:Kullanıcı tarafından girilen sayının karekökünü hesaplayan fonksiyonu kodlayınız.
use UYGULAMAx
go

drop function if exists dbo.karekok
go

create function dbo.karekok(@sayi float)
returns float
as begin

return sqrt(@sayi)

end