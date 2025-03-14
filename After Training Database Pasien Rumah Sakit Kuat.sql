CREATE database RumahSakit;
use rumahsakit; -- printah ini agar kita tau menggunakan database yang mana di skema, kalo dak pake dio akan mengeksekusi database terakhir 

-- tabel yang pertama kita buat adalah tabel yang memilki derajat relasi 1,
-- --  dia direferensi oleh tabel lain. primary keynya itu ada di tabel lain

create table rumahsakit.pasien (
    NoRM int not null primary key,
    KTP bigint,
    nama  varchar(15),
    TglLahir  date,
    TempatLahir varchar(15),
    alamat  text,
    tinggi smallint,
    berat smallint,
    NamaIbu varchar(15)
);

-- ini syntax untuk di MYSQL
alter table rumahsakit.pasien change TempatLahir tpt_lahir date;
-- --kalo di maria db kita pake perintah gini 
-- alter table rumahsakit.pasien rename TempatLahir to tpt_lahir date;

create table pegawai (
idPeg varchar(11) not null primary key,
nama varchar(15) not null,
status varchar(10) not null,
gaji bigint
);

create table poli (
idPoli smallint not null primary key,
id_Peg varchar(11),
namaPoli varchar(15),
constraint FK_id_pegawai foreign key (id_Peg) references pegawai(idPeg)
);

 

create table rumahsakit.dokter (
idDokter smallint not null primary key,
idPegawai varchar(11),
idPoli smallint,
Status varchar(10),
constraint FK_id_peg foreign key (idPegawai) references pegawai(idPeg),
constraint FK_id_poli foreign key (idPoli) references poli(idPoli)
);

 

create table rumahsakit.antri (
noAntri smallint not null primary key,
tanggal date not null,
hari varchar(7) not null,
jam time
);

 

create table rumahsakit.reservasi(
id_resrv smallint not null primary key,
noRM int,
noAntri smallint not null,
idPoli smallint not null,
idDokter smallint not null,
constraint fk_no_rm foreign key (noRM) references pasien(noRM),
constraint fk_antri foreign key (noantri) references antri(noAntri),
constraint fk_idPol foreign key (idPoli) references poli(idPoli),
constraint fk_idDokter foreign key (idDokter) references dokter(idDokter)
);

 

create table rumahsakit.pembayaran (
idPembayaran int not null primary key,
noAntrian smallint not null,
TipePembayaran smallint not null,
namaInstansi varchar(30),
constraint fk_no_antri foreign key (noantrian) references antri(noAntri)
);

-- lanjutan query quiz DDL-percobaan mandiri
alter table rumahsakit.pegawai change nama namaPegawai varchar(15) not null;


alter table rumahsakit.pasien add status varchar(12);
-- perintah menghapus kolom
-- alter table rumahsakit.pasien drop status;

create table rumahsakit.bangsal (
	idBangsal varchar(7) not null primary key,
    namaBangsal varchar(15),
    dokterJaga smallint not null,
    perawatUtama varchar(11),
    idPasien int,
    idPoli smallint,
    status varchar(12),
    constraint fk_id_pasien foreign key (idPasien) references pasien(noRM),
    constraint fk_id_poli_bangsal foreign key (idPoli) references poli(idPoli),
    constraint fk_perawat_utama foreign key (perawatUtama) references pegawai(idPeg),
    constraint fk_dokter_jaga foreign key (dokterJaga) references dokter(idDokter) 
);