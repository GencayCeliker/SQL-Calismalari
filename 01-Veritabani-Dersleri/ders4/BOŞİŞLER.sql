DECLARE @Sayilar TABLE (Sira INT IDENTITY, Sayi INT)
INSERT INTO @Sayilar VALUES(8),(6),(7),(26),(4),(3),
							(12),(38),(13),(44),(56),(78),
							(21),(67),(42),(1),(61),(18),
							(10),(14),(98),(55),(33),(77),
							(99),(9),(16),(20),(60),(34)
SELECT * FROM @Sayilar