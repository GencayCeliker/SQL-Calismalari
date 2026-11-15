use UYGULAMAx
go
drop function if exists dbo.Toplam
go
--Örnek: 1 den 100 e kadar olan sayıların toplamını ekrana yazdıran SQL scriptini kodlayalım
create function dbo.Toplam(@N int)
returns int
as begin
	declare @sayac int=1, @toplam int=0

	while @sayac<=@N
	begin
		set @toplam=@toplam+@sayac
		set @sayac=@sayac+1
	end
return @Toplam
end