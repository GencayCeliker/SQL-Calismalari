use UYGULAMAx
go

declare @sayac int=1

while @sayac<=5
begin

print dbo.KarakterYaz2('esküel ',@sayac)
set @sayac=@sayac+1

end
