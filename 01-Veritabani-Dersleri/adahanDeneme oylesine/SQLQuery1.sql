use adahannakliyat
go

drop procedure if exists dbo.Calısanlar
go

create procedure Calısanlar
as begin

select ad,soyad,telno,arac from soforler join TIRLAR
	on soforler.aracı=TIRLAR.TNO

end