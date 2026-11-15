--Soru 1:Kullanıcı tarafından verilen bir sayının tek yada çift olduğunu bildiren fonksiyonu kodlayınız.
use UYGULAMAx
go

create function dbo.tekcift(@Sayi int)
returns nvarchar(max)
as begin
	declare @sonuc nvarchar(max)

if (@Sayi%2=0)
set @sonuc='Cifttir'
else
set @sonuc='Tektir'

return @sonuc
end