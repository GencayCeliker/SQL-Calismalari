USE RestorantYonetimDB
GO
ALTER PROCEDURE dbo.sp_GunlukHarcamalar_Listele
AS BEGIN
SET NOCOUNT ON;
    SELECT 
        [HarcamaID],
        [HarcananYer],
        [Tutar],
        [Aciklama],
        CONVERT(DATE, [Tarih], 104) AS Tarih, --104 Türk tarih formatı
        LEFT(CAST([Saat] AS TIME), 5) AS Saat   -- Saat formatı için 16:30  soldan 5 sıfır at
    FROM [dbo].[GunlukHarcamalar]
    WHERE [Tarih] = CAST(GETDATE() AS DATE)
    ORDER BY [HarcamaID] DESC; 
END
GO

ALTER PROCEDURE dbo.sp_GunlukHarcamalar_HarcamaGetir
@BaslangicTarih DATE,
@BitisTarih DATE,
@ToplamHarcama DECIMAL(18,2) OUTPUT -- Dışarıya toplam tutarı gönderdik
AS BEGIN
SET NOCOUNT ON;
SELECT 
        [HarcamaID],
        [HarcananYer],
        [Tutar],
        [Aciklama],
        CONVERT(DATE, [Tarih], 104) AS Tarih, 
        LEFT(CAST([Saat] AS TIME), 5) AS Saat
    FROM  [dbo].[GunlukHarcamalar]
    WHERE [Tarih] BETWEEN @BaslangicTarih AND @BitisTarih
    ORDER BY [HarcamaID] DESC; -- En son eklenen en başa gelir
    SELECT @ToplamHarcama = ISNULL(SUM([Tutar]), 0)
    FROM [dbo].[GunlukHarcamalar]
    WHERE [Tarih] BETWEEN @BaslangicTarih AND @BitisTarih;
END
GO
CREATE PROCEDURE dbo.sp_GunlukHarcamalar_HarcamaOlustur
@HarcananYer NVARCHAR(100),
@Tutar DECIMAL(18,2),
@Aciklama NVARCHAR(255),
@Tarih DATE,
@Saat TIME
AS BEGIN
SET NOCOUNT ON;
BEGIN TRY
    BEGIN TRANSACTION;
INSERT INTO [dbo].[GunlukHarcamalar] 
    ([HarcananYer], [Tutar], [Aciklama], [Tarih], [Saat])
    VALUES 
    (@HarcananYer, @Tutar, @Aciklama, @Tarih, @Saat);

INSERT INTO dbo.Giderler
    (Tarih, Unvan, Adi, Aciklama, Tutar)
    VALUES
    (@Tarih, 'Günlük Harcama', @HarcananYer, @Aciklama, @Tutar);
    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END