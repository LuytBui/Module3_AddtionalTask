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

SELECT dangkycungcap.MaDKCC, nhacungcap.*, dongxe.HangXe, mucphi.DonGia
FROM nhacungcap JOIN dangkycungcap ON nhacungcap.MaNhaCC = dangkycungcap.MaNhaCC
JOIN dongxe ON dongxe.DongXe = dangkycungcap.DongXe
JOIN mucphi ON mucphi.MaMP = dangkycungcap.MaMP
HAVING (dongxe.HangXe = "Toyota" AND mucphi.DonGia = 15000)
		OR (dongxe.HangXe = "KIA" AND mucphi.DonGia = 20000)
;
