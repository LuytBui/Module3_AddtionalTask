create database bai4_quanlybanhang;
use bai4_quanlybanhang;
create table LoaiHang (
                          MaLoaiHang varchar(20) primary key,
                          TenLoaiHang varchar(40)
);

create table MatHang (
                         MaHang varchar(20) primary key ,
                         TenHang varchar(50),
                         MaCongTy varchar(20),
                         foreign key(MaCongTy) references NhaCungCap(MaCongTy),
                         MaLoaiHang varchar(20),
                         foreign key(MaLoaiHang) references LoaiHang(MaLoaiHang),
                         GiaBan int,
                         SoLuong int,
                         MucGiamGia int
);

create table NhaCungCap (
                            MaCongTy varchar(20) primary key,
                            TenCongTy varchar(50) unique,
                            TenGiaoDich varchar(20) unique,
                            DiaChi varchar(50),
                            DienThoai varchar(10),
                            Fax varchar(15),
                            email varchar(30)
);

create table KhachHang (
                           MaKhachHang varchar(20) primary key,
                           TenCongTy varchar(50) unique,
                           TenGiaoDich varchar(20) unique,
                           DiaChi varchar(50),
                           DienThoai varchar(10),
                           Fax varchar(15),
                           email varchar(30)
);

create table NhanVien (
                          MaNhanVien varchar(20) primary key,
                          Ho varchar(20),
                          Ten varchar(20),
                          NgaySinh date,
                          NgayLamViec date,
                          DiaChi varchar(50),
                          DienThoai varchar(10),
                          LuongCoBan int,
                          PhuCap int
);


create table DonDatHang(
                           SoHoaDon int auto_increment primary key,
                           MaKhachHang varchar(20),
                           foreign key(MaKhachHang) references KhachHang(MaKhachHang),
                           MaNhanVien varchar(20),
                           foreign key(MaNhanVien) references NhanVien(MaNhanVien),
                           NgayDatHang date,
                           NgayGiaoHang date,
                           NgayChuyenHang date,
                           NoiGiaoHang varchar(50)
);

create table ChiTietDatHang(
                               SoHoaDon int,
                               foreign key(SoHoaDon) references DonDatHang(SoHoaDon),
                               MaHang varchar(20),
                               foreign key(MaHang) references MatHang(MaHang),
                               primary key (SoHoaDon, MaHang),
                               GiaBan int,
                               SoLuong int,
                               MucGiamGia int
);