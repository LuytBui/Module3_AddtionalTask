use bai4_quanlybanhang;
#1.	Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty
select Ho, Ten, Diachi, year(NgayLamViec) as `Nam bat dau`
from NhanVien;

#2.	Mã và tên của các mặt hàng có giá trị lớn hơn 100000 và số lượng hiện có ít hơn 50
select MaHang, TenHang, SoLuong
from MatHang
where soluong < 50
    and GiaBan > 100000;

#3.	Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select MaHang, TenHang, NhaCungCap.TenCongTy
from MatHang join NhaCungCap on MatHang.MaCongTy = NhaCungCap.MaCongTy;

#4.	Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương=lương cơ bản+phụ cấp)
select MaNhanVien, Ho, Ten, (LuongCoBan + PhuCap) as "Luong"
from NhanVien;

#5.	Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2021.
create view NV_Xuat_sac_2021 as
select NhanVien.MaNhanVien, concat(NhanVien.Ho, " ",NhanVien.Ten) as "Nhan Vien" ,sum(ChiTietDathang.SoLuong) as SL2021
from ChiTietDatHang join DonDatHang on ChiTietDatHang.SoHoaDon = DonDatHang.SoHoaDon
join NhanVien on DonDatHang.MaNhanVien = NhanVien.MaNhanVien
where year(DonDathang.NgayGiaoHang) = 2021
group by NhanVien.MaNhanVien
having SL2021 >= 100 ;

## tang luong
delimiter //
create procedure TangLuongNhanVien2021_100_150()
begin
    drop view if exists NhanVienXuatSac;
    create view NhanVienXuatSac as
        select NhanVien.MaNhanVien, concat(NhanVien.Ho, " ",NhanVien.Ten) as "Nhan Vien",
               year(DonDathang.NgayGiaoHang) as Nam ,sum(ChiTietDathang.SoLuong) as SanLuong
        from ChiTietDatHang join DonDatHang on ChiTietDatHang.SoHoaDon = DonDatHang.SoHoaDon
             join NhanVien on DonDatHang.MaNhanVien = NhanVien.MaNhanVien
        where year(DonDathang.NgayGiaoHang) = 2021
        group by NhanVien.MaNhanVien
        having SanLuong >= 100 ;
    update NhanVien
    set LuongCoBan = LuongCoBan * 1.5
    where MaNhanVien in (select MaNhanVien from NhanVienXuatSac);
    select * from NhanVien;
end
// delimiter ;
call TangLuongNhanVien2021_100_150();

#6.	Trong năm 2021 những mặt hàng nào đặt mua đúng một lần
select MatHang.TenHang, count(CT.SoHoaDon) as SLHoaDon
from MatHang left join ChiTietDatHang CT on mathang.MaHang = CT.MaHang
left join DonDatHang on DonDatHang.SoHoaDon = CT.SoHoaDon
where year(DonDatHang.NgayDatHang) = 2021
group by MatHang.MaHang
having SLHoaDon = 1;

#7.	Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty.

### thay select = delete
select *
from KhachHang
where not exists (select MaKhachHang from DonDatHang where DonDatHang.MaKhachHang = KhachHang.MaKhachHang);

#8.	Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và số lượng hàng bán được của những nhân viên này là bao nhiêu
create view SanLuongNhanVien as
select NhanVien.MaNhanVien, sum(ChiTietDathang.SoLuong) as SanLuong
from ChiTietDatHang join DonDatHang on ChiTietDatHang.SoHoaDon = DonDatHang.SoHoaDon
                    join NhanVien on DonDatHang.MaNhanVien = NhanVien.MaNhanVien
group by NhanVien.MaNhanVien
order by SanLuong desc;
select SLNV.SanLuong, NhanVien.*
from NhanVien join SanLuongNhanVien SLNV on nhanvien.MaNhanVien = SLNV.MaNhanVien
where NhanVien.MaNhanVien =
      (select MaNhanVien from SanLuongNhanVien
          where SanLuong = (select max(SanLuong) from SanLuongNhanVien));

#9.	Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất.
update nhanvien
set PhuCap = PhuCap * 1.5
where NhanVien.MaNhanVien =
      (select MaNhanVien from SanLuongNhanVien
       where SanLuong = (select max(SanLuong) from SanLuongNhanVien));

#10.	Thông kê trong năm 2021 mỗi một mặt hàng trong mỗi tháng và trong cả năm bán được với số lượng bao nhiêu
#(Yêu cầu kết quả hiểu thị dưới dạng bảng, hai cột đầu là mã hàng, tên hàng, các cột còn lại tương ứng từ tháng 1 đến tháng 12 và cả năm.
#Như vậy mỗi dòng trong kết quả cho biết số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng
select MatHang.MaHang, MatHang.TenHang,
       count(*) as `Ca nam`,
       count(case month(NgayGiaoHang) when 1 then 1 else null end) as `T1`,
       count(case month(NgayGiaoHang) when 2 then 1 else null end) as `T2`,
       count(case month(NgayGiaoHang) when 3 then 1 else null end) as `T3`,
       count(case month(NgayGiaoHang) when 4 then 1 else null end) as `T4`,
       count(case month(NgayGiaoHang) when 5 then 1 else null end) as `T5`,
       count(case month(NgayGiaoHang) when 6 then 1 else null end) as `T6`,
       count(case month(NgayGiaoHang) when 7 then 1 else null end) as `T7`,
       count(case month(NgayGiaoHang) when 8 then 1 else null end) as `T8`,
       count(case month(NgayGiaoHang) when 9 then 1 else null end) as `T9`,
       count(case month(NgayGiaoHang) when 10 then 1 else null end) as `T10`,
       count(case month(NgayGiaoHang) when 11 then 1 else null end) as `T11`,
       count(case month(NgayGiaoHang) when 12 then 1 else null end) as `T12`

from MatHang left join chitietdathang c on mathang.MaHang = c.MaHang
left join dondathang d on d.SoHoaDon = c.SoHoaDon
where year (NgayGiaoHang) = 2021
group by MatHang.MaHang;



