create database jumlah_pengangguran_indonesia;

-- 1. check table tingkat_pengangguran_terbuka_indonesia
select * from tingkat_pengangguran_terbuka_indonesia;

-- 2. tunjukkan data tingkat pengangguran terbuka di provinsi jawa tengah!
select * from tingkat_pengangguran_terbuka_indonesia where nama_provinsi = "JAWA TENGAH";

-- 3. tunjukkan data tingkat pengangguran terbuka dari tahun 2022 dan disusun berdasarkan nama_bulan!
select * from tingkat_pengangguran_terbuka_indonesia where tahun >= 2022 order by nama_bulan, tahun;

-- 4. sesuai dengan step ke 3 namun dibatasi rownya s.d. 20
select * from tingkat_pengangguran_terbuka_indonesia where tahun >= 2022 order by nama_bulan, tahun limit 20;

-- 5. nama_bulan apa saja yang tersedia di dalam dataset!
select distinct nama_bulan from tingkat_pengangguran_terbuka_indonesia;

-- 6. tunjukkan seluruh data hanya nama_provinsi JAWA TIMUR DAN JAWA TENGAH
select * from tingkat_pengangguran_terbuka_indonesia where nama_provinsi in ("JAWA TIMUR", "JAWA TENGAH");
select * from tingkat_pengangguran_terbuka_indonesia where nama_provinsi = "JAWA TIMUR" or nama_provinsi = "JAWA TENGAH";

-- 7. tunjukkan seluruh data dengan nama_bulan FEBRUARI di JAWA TIMUR!
select * from tingkat_pengangguran_terbuka_indonesia where nama_bulan = "FEBRUARI" and nama_provinsi = "JAWA TIMUR";

-- 8. tunjukkan seluruh data selain nama_provinsi JAWA TIMUR, JAWA TENGAH, dan JAWA BARAT!
select * from tingkat_pengangguran_terbuka_indonesia where nama_provinsi not in("JAWA TIMUR", "JAWA TENGAH", "JAWA BARAT");

-- 9. dari tahun 2020 s.d. 2024, bagaimana tren tingkat_pengangguran_terbuka di provinsi JAWA BARAT dalam kategori bulan FEBRUARI?
select nama_provinsi, nama_bulan, tingkat_pengangguran_terbuka, satuan, tahun from tingkat_pengangguran_terbuka_indonesia 
where tahun >= 2020 and tahun <= 2024 and nama_provinsi = "JAWA BARAT" and nama_bulan = "FEBRUARI";

-- 10. di antara provinsi JAWA TIMUR, JAWA TENGAH, dan JAWA BARAT,
-- di manakah tingkat_pengangguran_terbuka terbanyak pada bulan februari tahun 2024
select * from tingkat_pengangguran_terbuka_indonesia where nama_provinsi like "JAWA%" and nama_bulan = "FEBRUARI" 
and tahun = "2024";

-- 11. provinsi mana saja yang mempunyai angka 3 pada digit pertama nilai tingkat penggangguran terbuka tersebut!
select distinct tingkat_pengangguran_terbuka, nama_provinsi from tingkat_pengangguran_terbuka_indonesia where tingkat_pengangguran_terbuka like "3";

select * from tingkat_pengangguran_terbuka_indonesia;

-- 12. berapa jumlah baris dari tabel tingkat_pengangguran_terbuka_indonesia?
select count(*) as jumlah_baris from tingkat_pengangguran_terbuka_indonesia;

-- 13. berapa jumlah tingkat_pengangguran_terbuka provinsi BALI tahun 2021?
select sum(tingkat_pengangguran_terbuka) as tingkat_pengangguran_terbuka_prov_bali_2021 from tingkat_pengangguran_terbuka_indonesia
where nama_provinsi = "BALI" and tahun = 2021;

-- 14. bagaimana tren jumlah tingkat_pengangguran_terbuka provinsi BALI dari tahun 2020 s.d. 2024?
select tahun, sum(tingkat_pengangguran_terbuka) as tingkat_pengangguran_terbuka_prov_bali from tingkat_pengangguran_terbuka_indonesia
where nama_provinsi = "BALI" and tahun >= 2020 and tahun <= 2024 group by tahun;

-- 15. berapa jumlah rata-rata pengangguran tiap kategori tingkat_pengangguran_terbuka per provinsi di Indonesia pada tahun 2021?
select tahun, nama_provinsi, avg(tingkat_pengangguran_terbuka) as rerata_tingkat_pengangguran from tingkat_pengangguran_terbuka_indonesia
where tahun = 2021 group by tahun, nama_provinsi order by nama_provinsi;

-- 16. nilai minimum dan maksimum dari kolom tingkat_pengangguran_terbuka?
select min(tingkat_pengangguran_terbuka) as min_tingkat_pengangguran_terbuka, max(tingkat_pengangguran_terbuka) as max_tingkat_pengangguran_terbuka
from tingkat_pengangguran_terbuka_indonesia;

-- 17. provinsi apa yang memiliki tingkat_pengangguran_terbuka lebih dari 2.5 pada tahun 2023?
select nama_provinsi, sum(tingkat_pengangguran_terbuka) as tingkat_pengangguran_terbuka_tahun_2023 from tingkat_pengangguran_terbuka_indonesia
where tahun = 2023 group by nama_provinsi having tingkat_pengangguran_terbuka_tahun_2023 > 2.5;