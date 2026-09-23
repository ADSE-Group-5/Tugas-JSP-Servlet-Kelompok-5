# Soal John Travolta — JSP & Servlet (Kombinasi 50-50)

Tugas individu (submit mandiri) — Rekayasa Perangkat Lunak Lanjut
Menggunakan arsitektur MVC sederhana, sama seperti tugas Kelompok 5 sebelumnya:

| Bagian | File | Peran |
|---|---|---|
| View (input) | `gaji.jsp` | Form input jam kerja, rate, pengeluaran |
| Controller | `WEB-INF/classes/com/tugas/servlet/GajiTabunganServlet.java` | Logika perhitungan gaji + status tabungan |
| View (output) | `hasilgaji.jsp` | Menampilkan hasil |
| Konfigurasi | `WEB-INF/web.xml` | Mapping servlet ke `/HitungGaji` |

---

## Algoritma 1 — Hitung Gaji Mingguan (Soal 1)

```
MULAI
INPUT jamKerja, rateNormal

JIKA jamKerja <= 40 MAKA
    jamNormal   = jamKerja
    jamLembur   = 0
    gajiNormal  = jamNormal * rateNormal
    gajiLembur  = 0
SELAIN ITU
    jamNormal   = 40
    jamLembur   = jamKerja - 40
    rateLembur  = 1.5 * rateNormal
    gajiNormal  = jamNormal * rateNormal
    gajiLembur  = jamLembur * rateLembur
AKHIR JIKA

totalGaji = gajiNormal + gajiLembur
CETAK totalGaji
SELESAI
```

**Contoh kasus Mr. John Travolta (jam = 52, rate = Rp15.000):**

```
jamNormal  = 40      -> gajiNormal = 40 x 15.000    = Rp600.000
jamLembur  = 12      -> rateLembur = 1.5 x 15.000    = Rp22.500/jam
                         gajiLembur = 12 x 22.500     = Rp270.000
totalGaji  = 600.000 + 270.000                        = Rp870.000
```

---

## Algoritma 2 — Status Tabungan (Soal 2)

```
MULAI
INPUT pemasukan, pengeluaran

JIKA pemasukan > pengeluaran MAKA
    tabungan = pemasukan - pengeluaran
    CETAK "BISA MENABUNG", tabungan
SELAIN JIKA pemasukan == pengeluaran MAKA
    CETAK "TIDAK BISA MENABUNG"
SELAIN ITU
    kekurangan = pengeluaran - pemasukan
    CETAK "CARI TAMBAHAN", kekurangan
AKHIR JIKA
SELESAI
```

**Contoh kasus (pemasukan = Rp870.000, pengeluaran = Rp600.000):**

```
870.000 > 600.000  -> "BISA MENABUNG"
tabungan = 870.000 - 600.000 = Rp270.000
```

---

## Cara deploy (Apache Tomcat)

1. Salin seluruh isi folder ini ke `apache-tomcat/webapps/TugasJSPServlet-Soal4/`
2. Compile servlet:
   ```
   javac -cp "apache-tomcat/lib/servlet-api.jar" -d WEB-INF/classes WEB-INF/classes/com/tugas/servlet/GajiTabunganServlet.java
   ```
3. Jalankan Tomcat, lalu buka:
   `http://localhost:8080/TugasJSPServlet-Soal4/`
4. Isi form (nilai bisa diubah bebas, misalnya jam kerja atau rate lain), lalu klik **Hitung Sekarang**.

---

## Nilai variatif lain untuk uji coba

| Nama | Jam kerja | Rate/jam | Pengeluaran | Hasil |
|---|---|---|---|---|
| John Travolta | 52 | Rp15.000 | Rp600.000 | Gaji Rp870.000 → Bisa menabung Rp270.000 |
| Budi | 40 | Rp20.000 | Rp800.000 | Gaji Rp800.000 → Tidak bisa menabung |
| Sari | 35 | Rp18.000 | Rp700.000 | Gaji Rp630.000 → Cari tambahan Rp70.000 |
