CREATE PROCEDURE KitapGeriAll
@uyeid INT,
@okitapid INT
AS
BEGIN
    UPDATE TblUYEKITAP 
    SET GATarihi=GETDATE()
    WHERE UyeId=@uyeid AND KitapId=@okitapid
    UPDATE TblKITAPLAR 
    SET Adet=Adet+1
    WHERE KitapId=@okitapid
END
