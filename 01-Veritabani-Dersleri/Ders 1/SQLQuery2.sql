use uygulama
go

insert into bolum(BolumAdi)--into:içine insert:ekle
Values('Bilgisayar Programcılığı'),	
('Tapu ve Kadastro'),
('Lojistik'),
('Bankacılık ve sigortacılık')
go

insert into personel(Ad,Soyad,TCKimlik,BolumAdi)
values('Bayram', 'SÜTÇÜ',  '10000000001',1),
	  ('Yusuf',  'ERDOĞAN','10000000002',2),
	  ('Melike', 'SÜER',   '10000000003',3),
	  ('Mustafa','ALTIN',  '10000000004',2),
	  ('Şeyda',  'KEYVAN', '10000000005',1),
	  ('Hüseyin','YÜCE',   '10000000006',4)
go