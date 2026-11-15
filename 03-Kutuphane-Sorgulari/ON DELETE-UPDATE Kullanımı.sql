BolumId INT FOREIGN KEY REFERENCES tblBolumler(BolumID)
ON DELETE CASCADE ON UPDATE CASCADE
--Öğrencide kayıtlı bölümü sildiğinde hata almamak için yazılır
--Öğrenci Tablosundanda silmiş olur