Create database KTHTSQL;
use KTHTSQL;
create table NhanVien
(
	MaNV varchar(5) primary key,
	HoLot nvarchar(10),
	Ten nvarchar(10),
	GioiTinh nvarchar(3),

)
create table HangHoa
(
	MaHH varchar(6) primary key,
	TenHH nvarchar(50),
	DonViTinh nvarchar(50),
	TenNCC nvarchar(30),

)
create table HoaDonNhap
(
	SoHD nvarchar(10) primary key,
	NgayNhap date,
	MaNV varchar(5),
	foreign key (MaNV) references NhanVien
)
create table CTHDN
(
	SoHD nvarchar(10),
	MaHH varchar(6),
	SoLuong smallint,
	DonGiaNhap int,
	primary key(SoHD,MaHH),
	foreign key (SoHD) references HoaDonNhap,
	foreign key (MaHH) references HangHoa
)
insert into NhanVien(MaNV,HoLot,Ten,GioiTinh) values
(
	'NV01','Ngoc','T','Nam'
),
(
	'NV02','Quoc','P','Nam'
),
(
	'NV03','Phung','A','Nam'
),
(
	'NV04','Tuyet','N','Nữ'
),
(
	'NV05','Hong','N','Nữ'
)
insert into HangHoa(MaHH,TenHH,DonViTinh,TenNCC) values
(
	'H001','Cam','Kg','Công ty 01'
),
(
	'H002','Ổi','Thùng','Công ty 02'
),
(
	'H003','Quýt','Kg','Công ty 03'	
),
(
	'H004','Nho','Kg','Công ty 04'
),
(
	'H005','Xoài','Thùng','Công ty 05'
)
go
set dateformat dmy
insert into HoaDonNhap(SoHD,NgayNhap,MaNV) values
(
	'HD001','20/03/2018','NV01'
),
(
	'HD002','29/03/2018','NV02'
),
(
	'HD003','01/04/2018','NV03'
),
(
	'HD004','03/04/2018','NV01'
),
(
	'HD005','05/04/2018','NV05'
)
go
set dateformat dmy
insert into HoaDonNhap(SoHD,NgayNhap,MaNV) values
(
	'HD006','20/03/2017','NV01'
)
go
set dateformat dmy
insert into HoaDonNhap(SoHD,NgayNhap,MaNV) values
(
	'HD007','20/04/2017','NV01'
)
insert into CTHDN(SoHD,MaHH,SoLuong,DonGiaNhap) values
(
	'HD001','H001','10','120000'
),
(
	'HD002','H002','13','100000'
),
(
	'HD003','H003','15','140000'
),
(
	'HD004','H004','16','150000'
),
(
	'HD005','H005','20','200000'
)
insert into CTHDN(SoHD,MaHH,SoLuong,DonGiaNhap) values
(
	'HD006','H001','10','120000'
),
(
	'HD007','H001','10','120000'
)

--a
select b.MaHH, TenHH,
sum(case MONTH(NgayNhap) when 1 then b.SoLuong else 0 end) as Thang1,
sum(case MONTH(NgayNhap) when 2 then b.SoLuong else 0 end) as Thang2,
sum(case MONTH(NgayNhap) when 3 then b.SoLuong else 0 end) as Thang3,
sum(case MONTH(NgayNhap) when 4 then b.SoLuong else 0 end) as Thang4,
sum(case MONTH(NgayNhap) when 5 then b.SoLuong else 0 end) as Thang5,
sum(case MONTH(NgayNhap) when 6 then b.SoLuong else 0 end) as Thang6,
sum(case MONTH(NgayNhap) when 7 then b.SoLuong else 0 end) as Thang7,
sum(b.SoLuong) as [canam]
from CTHDN b join HangHoa a on a.MaHH=b.MaHH
		join HoaDonNhap c on b.SoHD=c.SoHD
group by b.MaHH, TenHH
----a1
select b.MaHH, TenHH,
sum(case MONTH(c.NgayNhap) when 1 then SoLuong else 0 end) as Thang1,
sum(case MONTH(c.NgayNhap) when 2 then SoLuong else 0 end) as Thang2,
sum(case MONTH(c.NgayNhap) when 3 then SoLuong else 0 end) as Thang3,
sum(case MONTH(c.NgayNhap) when 4 then SoLuong else 0 end) as Thang4,
sum(case MONTH(c.NgayNhap) when 5 then SoLuong else 0 end) as Thang5,
sum(case MONTH(c.NgayNhap) when 6 then SoLuong else 0 end) as Thang6
from CTHDN a join HangHoa b on a.MaHH=b.MaHH
	join HoaDonNhap c on a.SoHD=c.SoHD
group by b.MaHH, TenHH


--b
select top 2 TenHH, count(SoHD) as[So lan nhap]
from CTHDN a join HangHoa b on b.MaHH=a.MaHH
group by TenHH
order by Count(SoHD) desc

--

select top(2) TenHH, 'so lan nhap'=count(TenHH), MaHH, DonViTinh, TenNCC
from HangHoa 
group by MaHH, DonViTinh, TenNCC, TenHH
--c
select TenNCC, sum(SoLuong*DonGiaNhap)
from CTHDN a join HoaDonNhap b on a.SoHD=b.SoHD
	join HangHoa c on c.MaHH=a.MaHH
where year(NgayNhap) = 2017
group by TenNCC
--d
select b.MaHH, TenHH,
sum(case DATEPART(QUARTER,NgayNhap) when 1 then b.SoLuong else 0 end) as Quy1,
sum(case DATEPART(QUARTER,NgayNhap) when 2 then b.SoLuong else 0 end) as Quy2,
sum(case DATEPART(QUARTER,NgayNhap) when 3 then b.SoLuong else 0 end) as Quy3,
sum(case DATEPART(QUARTER,NgayNhap) when 4 then b.SoLuong else 0 end) as Quy4
from (HoaDonNhap as a JOIN CTHDN AS b
on a.SoHD=b.SoHD)
join HangHoa as c on b.MaHH=c.MaHH
where YEAR(NgayNhap)=2018
group by b.MaHH,TenHH, NgayNhap
-- nay` moi dung'
select b.MaHH, TenHH,
sum (case DATEPART(quarter, NgayNhap) when 1 then DonGiaNhap*SoLuong else 0 end) as quy1,
sum (case DATEPART(quarter, NgayNhap) when 2 then DonGiaNhap*SoLuong else 0 end) as quy2,
sum (case DATEPART(quarter, NgayNhap) when 3 then DonGiaNhap*SoLuong else 0 end) as quy3,
sum (case DATEPART(quarter, NgayNhap) when 4 then DonGiaNhap*SoLuong else 0 end) as quy4
from CTHDN a join HangHoa b on a.MaHH=b.MaHH
	join HoaDonNhap c on a.SoHD=c.SoHD
where year(NgayNhap)=2018
group by b.MaHH, TenHH
--e
update CTHDN
set DonGiaNhap=DonGiaNhap*0.8
from CTHDN a join HoaDonNhap c on a.SoHD=c.SoHD
where NgayNhap='2018-3-20'
--
update CTHDN
set DonGiaNhap=DonGiaNhap*0.8
from CTHDN as a join HoaDonNhap as b on a.SoHD=b.SoHD
where b.NgayNhap='2018-12-24'
--f
Select HoLot, Ten, count(nv.MaNV) as sohdnhap, YEAR(NgayNhap) as ngaynhap
from HoaDonNhap hdn join NhanVien nv on hdn.MaNV=nv.MaNV
where YEAR(NgayNhap)=2018
group by HoLot, Ten, ngaynhap
having count(nv.MaNV)>=all (Select count(nv1.MaNV)
							from HoaDonNhap hdn1 join NhanVien nv1 on hdn1.MaNV=nv1.MaNV
							where YEAR(NgayNhap)=2018
							group by hdn1.MaNV)
select *
from HoaDonNhap