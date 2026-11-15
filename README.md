# 🗄️ SQL Çalışmalarım

![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-T--SQL-CC2927?style=for-the-badge)
![SSMS](https://img.shields.io/badge/SSMS-22-CC2927?style=for-the-badge)

Bilgisayar Programcılığı eğitimim boyunca **Microsoft SQL Server** ve **T-SQL** üzerine yazdığım sorgular, ödevler ve veritabanı nesneleri. Temel `SELECT` sorgularından **stored procedure, trigger, cursor ve kullanıcı tanımlı fonksiyonlara** kadar uzanır.

> Projelerimde kullandığım veritabanları (Kütüphane, Araç Kiralama, Su Tahsilat, Personel Takip…) kendi depolarında `Veri Tabanı/` klasöründe yer alır. Bu depo ders çalışmalarını ve yalnızca SQL ile yaptığım uygulamaları toplar.

---

## 📂 İçerik

| Klasör | İçerik | Öğrendiklerim |
| --- | --- | --- |
| [`01-Veritabani-Dersleri`](01-Veritabani-Dersleri) | Veri Tabanı 1 dersi uygulamaları ve ödevleri | `CREATE TABLE`, `INSERT`, `SELECT`, `WHERE`; T-SQL'de değişken, `WHILE` döngüsü ve `IF` ile algoritmalar (asal sayı, tek/çift, karekök, yıldız deseni) |
| [`02-SQL-Ders-Notlari`](02-SQL-Ders-Notlari) | Ders notları ve alıştırmalar | `UPDATE`, `DELETE`, birleşik anahtar, tablo ilişkileri, değişkenler ve tablo tipli değişken, sütun/tablo yeniden adlandırma |
| [`03-Kutuphane-Sorgulari`](03-Kutuphane-Sorgulari) | [Kütüphane Otomasyonu](https://github.com/GencayCeliker/Kutuphane-Otomasyonu) için yazılan sorgular | Stored procedure'ler (kayıt, arama, ödünç verme/iade), `CASE WHEN` ile ceza hesabı, `ON DELETE/UPDATE CASCADE`, `SET NOCOUNT` |
| [`04-Cursor-ve-Trigger`](04-Cursor-ve-Trigger) | Sınav çalışmaları: maaş sistemi, öğrenci ve ürün tabloları | **Cursor** ile satır satır maaş hesaplama; `FOR INSERT`, `AFTER INSERT` ve `FOR DELETE` **trigger**'ları (maaş yazma, fiyat değişim kaydı vb.) |
| [`05-Restoran-Yonetim-DB`](05-Restoran-Yonetim-DB) | Ekip projesi [Restoran Otomasyonu](https://github.com/foxseSReal/Restoran-Otomasyonu) veritabanı | 20+ tablolu ilişkisel şema, örnek veri, günlük harcama prosedürleri, `DBCC CHECKIDENT` ile identity sıfırlama |
| [`06-Diger-Sorgular`](06-Diger-Sorgular) | Çeşitli uygulama ve denemeler | Öğrenci/ders kayıt sistemi, maaş prosedürü, yabancı anahtar işlemleri |
| [`07-Veritabani-Nesneleri`](07-Veritabani-Nesneleri) | SQL Server'dan dışa aktarılan, doğrudan kurulabilen veritabanları | Aşağıdaki tablo |

### 07 – Kurulabilir veritabanları

| Script | İçerik |
| --- | --- |
| `SINAV.sql` | Personel/ünvan/maaş tabloları, `spMaasDuzenle` (cursor ile maaş hesabı), `trgMaasYaz` (trigger) |
| `OKULYONETIMSISTEMI.sql` | Bölüm, öğrenci, ders ve ders kayıt tabloları; **10 stored procedure** (ders verme, kayıt, listeleme) |
| `DenemeTeknoMarket.sql` | Ürün tablosu; `spElektronikZamYap`, `spEindirim` (kategoriye göre zam/indirim), `zbindirim` (cursor ile indirim) |
| `ETRADE.sql` | Sipariş tablosu ve `hacim` kullanıcı tanımlı fonksiyonu |
| `Mulakat.sql` | Mülakat hazırlığı için örnek tablo ve veriler |

---

## ⚙️ Çalıştırma (SSMS 22)

1. **SQL Server Management Studio 22**'yi açıp sunucunuza bağlanın (ör. `.\SQLEXPRESS`).
2. **File → Open → File...** ile bir `.sql` dosyası açın.
3. **Execute (F5)** ile çalıştırın.

`07-Veritabani-Nesneleri` altındaki script'ler veritabanını kendisi oluşturur (`CREATE DATABASE`). Diğer klasörlerdeki dosyalar ders sırasında yazılmış sorgulardır; çoğu ilgili veritabanının önceden oluşturulmuş olmasını bekler (dosyanın başındaki `USE ...` satırına bakın).

> Örnek verilerdeki TC Kimlik, telefon ve okul numaraları gerçek değildir.
