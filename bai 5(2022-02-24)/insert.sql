#Thêm 5 thành phố
#Thêm 10 khách hàng
#Thêm 5 điểm đến
#Thêm 2 loại tour
#Thêm 15 tour
#Thêm 10 hóa đơn đặt tour

insert into ThanhPho (ID, TenThanhPho) values
	("HN", "Hà Nội"),
	("DN", "Đà Nẵng"),
	("TPHCM", "TP. Hồ Chí Minh"),
	("DLAT", "Đà Lạt"),
	("HUE", "Huế");

insert into KhachHang(TenKhachHang, SoCanCuoc, NamSinh, ThanhPho_ID) values
	("Luýt", "123456", 1993, "HN"),
	("Phuong", "4514251256", 1993, "HN"),
	("Tuấn Anh", "1fdg23456", 1998, "HUE"),
	("Tùng", "45344224", 2003, "DN"),
	("Đào", "243534421248", 2003, "TPHCM"),
	("Lê", "233521", 1983, "TPHCM"),
	("Trung", "65478541256", 1989, "TPHCM"),
	("Nam", "446675", 1995, "HN"),
	("Nam", "5647768", 1996, "DN"),
	("Nam", "446453453675", 1997, "DN");
    
insert into DiemDen (ID, TenDiemDen, ThanhPho_ID) values
	("001", "Hồ Gươm", "HN"),
	("002", "Biển Đà Nẵng", "DN"),
	("003", "Phố Bùi Viện", "TPHCM"),
	("004", "Thung Lũng Tình Yêu", "DLAT"),
	("005", "Phố cổ", "HUE");
    
insert into LoaiTour(MaLoaiTour, TenLoaiTour) values
	("ND", "Nghỉ Dưỡng"),
    ("VH", "Văn Hóa");

    delete from tour;
insert into Tour(MaTour, MaLoaiTour, DiemDen_ID, NgayBatDau, NgayKetThuc) values
	("HG101", "VH", "001", "2020-02-24", "2020-02-26"),
	("HG102", "VH", "001", "2020-03-26", "2020-03-28"),
	("HG103", "VH", "001", "2020-04-28", "2020-04-30"),
	("BDN004", "ND", "002", "2020-02-14", "2020-02-21"),
	("BDN006", "ND", "002", "2020-03-14", "2020-03-29"),
	("BDN007", "ND", "002", "2020-04-14", "2020-04-29"),
	("SGBV009", "ND", "003", "2020-02-11", "2020-02-21"),
	("SGBV010", "ND", "003", "2020-02-21", "2020-03-01"),
	("SGBV011", "ND", "003", "2020-03-02", "2020-03-07"),
	("TYDL121", "ND", "004", "2020-02-11", "2020-02-21"),
	("TYDL122", "ND", "004", "2020-02-16", "2020-02-29"),
	("TYDL123", "ND", "004", "2020-03-01", "2020-03-07"),
	("HUEPC1234", "VH", "005", "2020-03-12", "2020-03-14"),
	("HUEPC1236", "VH", "005", "2020-04-14", "2020-03-14"),
	("HUEPC1239", "VH", "005", "2020-05-16", "2020-05-16"),
    ("HUEPC1240", "VH", "005", "2020-06-16", "2020-06-16");
    