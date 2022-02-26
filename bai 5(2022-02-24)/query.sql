#-	Thống kê số lượng tour của các thành phố
select ThanhPho.TenThanhPho, count(Tour.DiemDen_ID) as `SoLuongTour`
from Tour join DiemDen On Tour.DiemDen_ID = DiemDen.Id
join ThanhPho on ThanhPho.ID = DiemDen.ThanhPho_ID
group by Tour.DiemDen_ID;

#-	Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 -))))
select count(*) 
from Tour
where (NgayBatDau between "2020-03-01" and "2020-03-31");

#Hoặc
select * 
from Tour
where (Month(NgayBatDau) = 3 and Year(NgayBatDau) = 2020);

#-	Tính số tour có ngày kết thúc trong tháng 4 năm 2020 -)))
select count(*) 
from Tour
where (NgayKetThuc between "2020-04-01" and "2020-04-30");

#Hoặc
select * 
from Tour
where (Month(NgayKetThuc) = 3 and Year(NgayKetThuc) = 2020);
