SELECT * FROM nhacungcap;
SELECT * FROM dongxe;
SELECT * FROM loaidichvu;
SELECT * FROM mucphi;
SELECT * FROM dangkycungcap;

# Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
SELECT dongXe as "dòng xe có số chỗ ngồi trên 5 chỗ"
FROM dongxe
WHERE soChoNgoi > 5;

# Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
#thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
#thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
SELECT nhacungcap.*
FROM nhacungcap JOIN dangkycungcap ON nhacungcap.MaNhaCC = dangkycungcap.MaNhaCC
JOIN dongxe ON dongxe.DongXe = dangkycungcap.DongXe
JOIN mucphi ON mucphi.MaMP = dangkycungcap.MaMP
WHERE (dongxe.HangXe = "Toyota" AND mucphi.DonGia = 15000)
		OR (dongxe.HangXe = "KIA" AND mucphi.DonGia = 20000)
GROUP BY nhacungcap.MaNhaCC
;


#Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
#cấp và giảm dần theo mã số thuế
SELECT * FROM nhacungcap
ORDER BY TenNhaCC, MaSoThue DESC;

#Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
#yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
#cung cấp là “20/11/2015”
SELECT nhacungcap.*, count(nhacungcap.MaNhaCC) as `So lan DK`
FROM dangkycungcap JOIN nhacungcap ON dangkycungcap.MaNhaCC = nhacungcap.MaNhaCC
WHERE dangkycungcap.NgayBatDauCungCap > 2015-11-20
GROUP BY dangkycungcap.MaNhaCC;

#Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
#chỉ được liệt kê một lần
SELECT DISTINCT HangXe
FROM dongxe;

#Câu 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
#HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
#tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
#tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra


SELECT dangkycungcap.MaDKCC, dangkycungcap.MaNhaCC, 
		nhacungcap.TenNhaCC, nhacungcap.DiaChi, nhacungcap.MaSoThue, 
		loaidichvu.TenLoaiDV, 
        mucphi.DonGia,
        dongxe.HangXe, 
        dangkycungcap.NgayBatDauCungCap, dangkycungcap.NgayBatDauCungCap
FROM nhacungcap LEFT JOIN dangkycungcap ON dangkycungcap.MaNhaCC = nhacungcap.MaNhaCC
JOIN loaidichvu ON loaidichvu.MaLoaiDV = dangkycungcap.MaLoaiDV
JOIN mucphi ON mucphi.MaMP = dangkycungcap.MaMP
JOIN dongxe ON dongxe.DongXe = dangkycungcap.DongXe
;


