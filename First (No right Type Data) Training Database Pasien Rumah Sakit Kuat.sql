create database rumahsakit;
use rumahsakit;

-- menghapus tabel dengan perintah drop jika tabel ada yang salah-- 

create table antri(
	no_antrian varchar (20) not null,
    tanggal timestamp not null,
    hari datetime not null,
    jam datetime not null,
    primary key (no_antrian)
);

create table pembayaran(
	id_pembayaran varchar (20) not null,
    no_antrian timestamp not null,
    tipe_pembayaran datetime not null,
    nama_instansi varchar (20) not null,
    primary key (id_pembayaran)
);

create table reservasi(
	id_reservasi varchar (20) not null,
    no_rekam_medis varchar (20) not null,
    id_poli varchar (20) not null,
    id_dokter varchar (20) not null,
    no_antrian varchar (20) not null,
    primary key (id_reservasi)
);

create table pegawai(
	id_pegawai varchar (20) not null,
    nama_pegawai varchar (20) not null,
    status varchar (20) not null,
    gaji varchar (20) not null,
	primary key (id_pegawai)
);

create table pasien(
	no_rekam_medis varchar (20) not null,
    kartu_tanda_penduduk varchar (20) not null,
    nama varchar (20) not null,
    tanggal_lahir varchar (20) not null,
    alamat varchar (20) not null,
    tinggi varchar (20) not null,
    berat varchar (20) not null,
    ibu_kandung varchar (20) not null,
	primary key (no_rekam_medis)
);

create table poli(
	id_poli varchar (20) not null,
    id_pegawai varchar (20) not null,
	nama_poli varchar (20) not null,
	primary key (id_poli)
);

create table dokter(
	id_dokter varchar (20) not null,
    id_pegawai varchar (20) not null,
    id_poli varchar (20) not null,
    nama_dokter varchar (20) not null,
	status varchar (20) not null,
	primary key (id_dokter)
);