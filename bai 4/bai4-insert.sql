use bai4_quanlybanhang;
delete from NhanVien;
insert into NhanVien (MaNhanVien, Ho, Ten, NgaySinh, NgayLamViec, DiaChi, DienThoai, LuongCoBan, PhuCap) values
            ("NV001", "Bui", "Luyt", "1993-04-16", "2020-01-01", "Ho Tung Mau", "0123456789", 10000000, 1000000),
            ("NV002", "Bui", "Sang", "1999-09-25", "2020-01-01", "Ho Tung Mau", "0123451479", 12000000, 1200000),
            ("NV003", "Nguyen", "Toan", "1987-01-30", "2020-01-01", "Co Nhue", "0194451479", 11000000, 1200000),
            ("NV004", "Tran", "Chien", "1994-02-20", "2021-02-12", "Ha Dong", "0194851497", 11000000, 1200000)
;
insert into KhachHang (MaKhachHang, TenCongTy, TenGiaoDich, DiaChi, DienThoai, Fax, email) values
            ("KH001", "Công ty thương mại dịch vụ Thành Đô", "Thành Đô", "Lê Trọng Tấn, Thanh XUân", "0124854554", "", "giamdocdieuhanh@thanhdo.com"),
            ("KH002", "Công ty TNHH một thành viên Bác Tôm", "Bác Tôm", "Lê Trọng Tấn, Thanh XUân", "0134447445", "", "giamdocdieuhanh@bactom.com"),
            ("KH003", "Tập đoàn thép Hòa Phát", "Hòa Phát Corp", "Ba Đình", "0999999999", "", "giamdocdieuhanh@hoaphat.com"),
            ("KH004", "Công ty Đá quý Bảo Châu", "Bảo Châu", "Thanh Xuân", "0111221231", "", "giamdocdieuhanh@baochau.com");
insert into KhachHang (MaKhachHang, TenCongTy, TenGiaoDich, DiaChi, DienThoai, Fax, email) values
    ("KH006", "Công ty B", "CT B", "Lê Trọng Tấn, Thanh XUân", "234554", "", "giamdocdieuhanh@564567dfgd.com");

insert into LoaiHang (MaLoaiHang, TenLoaiHang) VALUES
            ("LT", "Laptop"),
            ("LK", "Linh kiện"),
            ("BC", "Build case"),
            ("PK", "Phụ kiện");
insert into NhaCungCap (MaCongTy, TenCongTy, TenGiaoDich, DiaChi, DienThoai, Fax, email) values
            ("DELL", "Dell", "Dell", "Hoa Kỳ", "0123123123", "14511214", "sale@dell.co"),
            ("Apple", "Apple", "Apple", "Hoa Kỳ", "0123123124", "14511215", "sale@apple.co"),
            ("Logitech", "Logitech", "Logitech", "Hoa Kỳ", "0123123125", "14511216", "sale@logitech.co"),
            ("SamSung", "SamSung", "SamSung", "Hàn Quốc", "0123123127", "14511217", "sale@samsung.co");
insert into MatHang (MaHang, TenHang, MaCongTy, MaLoaiHang, GiaBan, SoLuong, MucGiamGia) values
            ("DELL-M7650", "Laptop Dell M7650","DELL", "LT", 25000000, 8000, 0 ),
            ("DELL-M8660", "Laptop Dell M8660","DELL", "LT", 37000000, 400, 1500000 ),
            ("MacPro2021", "Macbook Pro 2021","DELL", "LT", 32000000, 700, 0 ),
            ("WideDP20P", "Màn hình Samsung WideDP20P","SamSung", "LK", 3200000, 750, 0 ),
            ("AntiGL-S145", "Màn hình Samsung AntiGL-S145","SamSung", "LK", 5200000, 750, 0 ),
            ("DellWS1", "Bộ PC Dell Workstation 001","DELL", "BC", 30000000, 600, 1230000 ),
            ("DellWS2", "Bộ PC Dell Workstation 002","DELL", "BC", 40000000, 600, 1550000 ),
            ("KB-LGT-464", "Bàn phím Logitech S464","Logitech", "PK", 465000, 1000, 0 ),
            ("KB-LGT-466", "Bàn phím Logitech T466","Logitech", "PK", 850000, 1000, 120000 ),
            ("MO-LGT-BM", "Chuột máy tính Logitech BM hi-res","Logitech", "PK", 660000, 1000, 70000 );
delete from MatHang;

insert into DonDatHang (MaKhachHang, MaNhanVien, NgayDatHang, NgayGiaoHang, NgayChuyenHang, NoiGiaoHang) VALUES
            ("KH001", "NV001", "2021-04-15", "2021-04-16", "2021-04-20", "Ha Noi"),
            ("KH002", "NV002", "2021-05-15", "2021-05-16", "2021-05-19", "Quang Ninh"),
            ("KH003", "NV002", "2021-05-12", "2021-05-12", "2021-05-12", "Quang Ninh"),
            ("KH004", "NV003", "2021-05-12", "2021-05-12", "2021-05-12", "TP. Hồ Chí Minh"),
            ("KH004", "NV004", "2021-07-12", "2021-07-12", "2021-07-12", "TP. Hồ Chí Minh"),
            ("KH002", "NV002", "2021-08-13", "2021-08-14", "2021-08-19", "Quang Ninh"),
            ("KH004", "NV003", "2021-08-12", "2021-08-16", "2021-08-17", "TP. Hồ Chí Minh");
insert into ChiTietDatHang (SoHoaDon, MaHang, GiaBan, SoLuong, MucGiamGia) VALUES
            (1, "DELL-M7650", 2500000, 20, 100000),
            (1, "MO-LGT-BM", 660000, 20, 70000),
            (2, "MacPro2021", 32000000, 30, 0),
            (2, "DellWS1", 30000000, 20, 1230000),
            (3, "WideDP20P", 3200000, 40, 1230000),
            (3, "DellWS2", 40000000, 40, 1550000),
            (3, "KB-LGT-464", 465000, 40, 0),
            (3, "MO-LGT-BM", 660000, 40, 70000),
            (4, "DELL-M8660", 37000000, 20, 1500000),
            (4, "KB-LGT-466", 850000, 20, 120000),
            (5, "MacPro2021", 32000000, 50, 400000),
            (6, "DellWS2", 37000000, 8, 1500000),
            (6, "AntiGL-S145", 5200000, 8, 0),
            (6, "KB-LGT-466", 850000, 8, 120000),
            (6, "MO-LGT-BM", 660000, 8, 70000),
            (7, "DELL-M8660", 37000000, 30, 1500000),
            (7, "KB-LGT-466", 850000, 30, 120000);





