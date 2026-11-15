--Soru 2:Kullanıcı tarafından girilen sayının asal olup olmadığını bildiren fonksiyonu kodlayınız.

drop function if exists dbo.asal
go

create function dbo.asal(@sayi int)
returns nvarchar(max)
as begin
	declare @sonuc nvarchar(max)

if(@sayi%2=0)
set @sonuc='Sayı Asal Değil.'
else
set @sonuc='Sayı Asaldır.'

return @sonuc
end