create database quanlytourdulich;
use quanlytourdulich;

drop table DiemDen; drop table KhanhHang;drop table ThanhPho; drop table Tour; drop table LoaiTour;

create table ThanhPho(
	ID varchar(5) primary key,
    TenThanhPho varchar(30) unique
);

create table DiemDen(
	ID varchar(20) primary key,
    TenDiemDen varchar(50),
    Mota varchar(100) default "",
    GiaTrungBinh int,
    ThanhPho_ID varchar(20),
    foreign key(ThanhPho_ID) references ThanhPho(ID)
);

create table LoaiTour(
    id int auto_increment primary key,
    MaLoaiTour varchar(10) unique,
    TenLoaiTour varchar(30)
);

create table KhachHang(
	ID int auto_increment primary key,
    TenKhachHang varchar(30),
    SoCanCuoc varchar(10) unique,
    NamSinh year,
    ThanhPho_ID varchar(20),
    foreign key(ThanhPho_ID) references ThanhPho(ID)
);

create table Tour(
	ID int auto_increment primary key,
    MaTour varchar(10) unique,
    MaLoaiTour varchar(10),
    foreign key(MaLoaiTour) references LoaiTour(MaLoaiTour),
    DiemDen_ID varchar(20),
    foreign key(DiemDen_ID) references DiemDen(ID),
    NgayBatDau date,
    NgayKetThuc date
);

create table HoaDonDatTour(
	ID int auto_increment primary key,
    MaTour varchar(10),
    foreign key(MaTour) references Tour(MaTour),
    KhachHang_ID int,
    foreign key(KhachHang_ID) references KhachHang(ID),
    TrangThai bit
);
    
