create database universitas;

create table dosen (
id_dosen varchar(50),
nama_dosen varchar(100),
program_studi varchar(100),
primary key (id_dosen)
);

describe dosen;

drop table dosen;

describe mahasiswa;

insert into dosen (id_dosen,nama_dosen,program_studi)
values
	('A1001', 'Prof. Dian', 'Perikanan Tangkap'),
    ('A1003', 'Condro, Ph.D', 'Akuakultur'),
    ('A1004', 'Ima, Ph.D', 'Teknologi Hasil Perikanan'),
    ('A1005', 'Prof. Suradi', 'Manajemen Sumberdaya Perikanan');
    
select * from dosen;

-- alter table
-- 1. menambahkan kolom pada tabel
alter table dosen add golongan_darah varchar(3);

-- 2. menghapus kolom pada tabel
alter table dosen drop column golongan_darah

-- 3. mengubah nama kolom pada tabel
alter table dosen change column id_dosen no_induk_dosen varchar(50);

-- 4. mengubah tipe data kolom pada tabel
describe dosen;
alter table dosen modify column nama_dosen varchar(200);