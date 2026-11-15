--Örnek: 1 den 100 e kadar olan sayıları ekrana yazdıran SQL scriptini kodlayalım
declare @sayac int=1, @toplam int=0
while @sayac<=100
	begin
		set @toplam=@toplam+@sayac
		set @sayac=@sayac+1
	end
	print @toplam