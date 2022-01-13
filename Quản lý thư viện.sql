Create database QLTV
Go
Use QLTV
Go

Create table DocGia
(
	Ma_DocGia NUMERIC IDENTITY(1,1), 
	Ho nvarchar(10), 
	TenLot nvarchar(20), 
	Ten nvarchar(20), 
	NgaySinh date,
	Primary key(Ma_DocGia)
)
Go

Create table NguoiLon
(
	Ma_DocGia NUMERIC IDENTITY(1,1) REFERENCES DocGia(Ma_DocGia), 
	SoNha nvarchar(50), 
	Duong nvarchar(50), 
	Quan nvarchar(50), 
	DienThoai nvarchar(10),  
	HanSuDung date,
	Primary key(Ma_DocGia)
)
Go

Create table TreEm
(
	Ma_DocGia NUMERIC IDENTITY(1,1) REFERENCES DocGia(Ma_DocGia), 
	Ma_DocGia_NguoiLon varchar(5),
	Primary key(Ma_DocGia)
)

Create table TuaSach
(
	Ma_TuaSach NUMERIC IDENTITY(1,1), 
	TuaSach nvarchar(50), 
	TacGia nvarchar(50), 
	TomTat nvarchar(200),
	Primary key(Ma_TuaSach)
)
Go

Create table DauSach
(
	ISBN varchar(10), 
	Ma_TuaSach NUMERIC IDENTITY(1,1) REFERENCES TuaSach(Ma_TuaSach), 
	NgonNgu nvarchar(20), 
	Bia nvarchar(20), 
	TrangThai nvarchar(10),
	Primary key(ISBN)
)
Go
DBCC CHECKIDENT(DocGia, NORESEED)
DBCC CHECKIDENT(DocGia, RESEED, 20)
Create table Muon
(
	ISBN varchar(10), 
	Ma_CuonSach varchar(5), 
	Ma_DocGia NUMERIC, 
	NgayMuon date, 
	NgayHetHan date,
	Primary key(ISBN,Ma_CuonSach)
)
Go

Create table CuonSach
(
	ISBN varchar(10) references DauSach(ISBN), 
	Ma_CuonSach varchar(5), 
	TinhTrang nvarchar(10),
	Primary key(ISBN,Ma_CuonSach)
)
Go

Create table DangKy
(
	ISBN varchar(10) references DauSach(ISBN), 
	Ma_DocGia NUMERIC IDENTITY(1,1) REFERENCES DocGia(Ma_DocGia), 
	NgayDK date, 
	GhiChu nvarchar(50),
	Primary key(ISBN,Ma_DocGia)
)
Go

Create table QuaTrinhMuon
(
	ISBN varchar(10), 
	Ma_CuonSach varchar(5), 
	NgayMuon date, 
	Ma_DocGia NUMERIC IDENTITY(1,1) REFERENCES DocGia(Ma_DocGia), 
	NgayHetHan date, 
	NgayTra date, 
	TienMuon money, 
	TienDaTra money, 
	TienDatCoc money, 
	GhiChu nvarchar(50),
	Primary key(ISBN,Ma_CuonSach,NgayMuon)
)
Go

ALTER TABLE TreEm
ADD CONSTRAINT FK_NguoiLon FOREIGN KEY(Ma_DocGia) REFERENCES NguoiLon(Ma_DocGia)
Go

ALTER TABLE CuonSach
ADD CONSTRAINT FK_Muon FOREIGN KEY(ISBN,Ma_CuonSach) REFERENCES Muon(ISBN,Ma_CuonSach)
Go

ALTER TABLE QuaTrinhMuon
ADD CONSTRAINT FK_CuonSach FOREIGN KEY(ISBN,Ma_CuonSach) REFERENCES CuonSach(ISBN,Ma_CuonSach)
Go
ALTER TABLE Muon
ADD CONSTRAINT FK_doc FOREIGN KEY(Ma_DocGia) REFERENCES Docgia(Ma_DocGia)
Go

Insert into DocGia
Values
(N'Nguyễn',N'Ánh',N'Ngọc','03/20/1978'),
(N'Trần',N'Tuấn',N'Khang','07/12/1980'),
(N'Đỗ',N'Thị',N'Tú','12/12/1982'),
(N'Lê',N'Thị',N'Hoa','06/15/1987'),
(N'Bùi',N'Tuấn',N'Khang','05/05/1990')
Go

Insert into NguoiLon
Values
('100/22',N'Đặng Tất',N'Phước Long','0913546782','06/12/2000'),
('55/22',N'Huỳnh Thúc Kháng',N'Phước Tiến','0913546782','07/22/2000'),
('67',N'Củ Chi',N'Lộc Thọ','0913546782','08/24/2000'),
('33',N'Lý Thánh Tôn',N'Phú Nhuận','0913546782','01/11/2000'),
('120/38',N'Nguyễn Trãi',N'Tân Lập','0913546782','09/25/2000')
Go

Insert into TreEm
Values
('DGNL1'),
('DGNL2'),
('DGNL3'),
('DGNL4'),
('DGNL5')
Go

Insert into TuaSach
Values
(N'Giết Con Chim Nhại',N'Harper Lee','Null'),
(N'Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất',N'Jonas Jonasson','Null'),
(N'5 Centimet Trên Giây',N'Shinkai Makoto','Null'),
(N'Ông Già Và Biển Cả',N'Ernest Hemingway','Null'),
(N'Điều Kỳ Diệu Của Tiệm Tạp Hóa Namiya','Higashino Keigo',N'Null')
Go

Insert into DauSach
Values
('8582123456',N'Tiếng Việt',N'Cứng',N'Còn'),
('8783336578',N'Tiếng Việt',N'Mềm',N'Còn'),
('8884567753',N'Tiếng Việt',N'Mềm',N'Còn'),
('8985753887',N'Tiếng Việt',N'Cứng',N'Còn'),
('8486275432',N'Tiếng Việt',N'Cứng',N'Còn')
Go

Insert into Muon
Values
('8582123456','CS001','03/25/2020','04/25/2020'),
('8783336578','CS002','05/17/2020','06/17/2020'),
('8884567753','CS003','07/30/2020','08/30/2020'),
('8985753887','CS004','09/10/2020','10/10/2020'),
('8486275432','CS005','12/02/2020','01/02/2021')
Go

Insert into CuonSach
Values
('8582123456','CS001',N'Mới'),
('8783336578','CS002',N'Cũ'),
('8884567753','CS003',N'Mới'),
('8985753887','CS004',N'Cũ'),
('8486275432','CS005',N'Mới')
Go

Insert into DangKy
Values
('8582123456','03/20/2020','Null'),
('8783336578','05/12/2020','Null'),
('8884567753','07/28/2020','Null'),
('8985753887','09/07/2020','Null'),
('8486275432','11/30/2020','Null')
Go

Insert into QuaTrinhMuon
Values
('8582123456','CS001','03/25/2020','04/25/2020','04/10/2020',10000,5000,5000,'Null'),
('8783336578','CS002','05/17/2020','06/17/2020','06/18/2020',20000,10000,5000,N'Còn thiếu 5000 và trả trễ 1 ngày'),
('8884567753','CS003','07/30/2020','08/30/2020','08/15/2020',15000,10000,5000,'Null'),
('8985753887','CS004','09/10/2020','10/10/2020','09/30/2020',25000,10000,5000,N'Còn nợ 10000'),
('8486275432','CS005','12/02/2020','01/02/2021','01/01/2021',17000,10000,7000,'Null')
Go
--5A. 
SELECT YEAR(NGAYMUON) 'NĂM', COUNT(ISBN) AS 'PHIẾU MƯỢN SÁCH'
FROM MUON
GROUP BY YEAR(NGAYMUON)
--5B.
select a.isbn, a.ma_cuonsach, datediff(day, a.ngaymuon, b.ngaytra)
from muon a
join cuonsach c on a.isbn = c.isbn
join quatrinhmuon b on c.isbn = b.isbn
--5C.
SELECT MA_CUONSACH,COUNT(MA_CUONSACH) AS [SO LAN MUON],(SUM(DATEDIFF(DAY, NGAYMUON,NGAYTRA))/ COUNT(MA_CUONSACH)) AS [NGAY MUON TRUNG BINH]
FROM QUATRINHMUON GROUP BY MA_CUONSACH
--5d. Cho biết danh sách những phiếu mượn trả sách quá hạn? 
SELECT dg.Ho,dg.TenLot,dg.Ten,qtm.NgayMuon,NgayHetHan,NgayTra
FROM QuaTrinhMuon qtm join DocGia dg on qtm.Ma_DocGia = dg.Ma_DocGia
Where (YEAR(NgayTra)-YEAR(NgayHetHan))*365+(MONTH(NgayTra)-MONTH(NgayHetHan))*30+(DAY(NgayTra)-DAY(NgayHetHan))>0
--5.e 
 select   (Ho + ''+ TenLot + '' + Ten) as 'độc giả ', Ma_CuonSach as 'sách được mượn'
 from DocGia  dg  join quatrinhmuon qt on dg.Ma_DocGIA=qt.Ma_DocGIA
 where (select DATEDIFF(DAYOFYEAR,NgayMuon,NgayTra)) > 14
 --câu 5f : cho biết danh sách độc giả ,sách được mượn của những độc giả đã và đang mượn quá hạn
select a.Ma_DocGia as [Mã đọc giả],a.Ten as [Tên đọc giả] ,b.Ma_CuonSach as [Sách mượn quá hạn]
from DocGia a join QuaTrinhMuon b on a.Ma_DocGia = b.Ma_Docgia 
where (select DATEDIFF(DAYOFYEAR,b.NgayMuon,b.NgayTra)) > 14 and (select (GETDATE())) > (b.NgayHetHan) or b.NgayTra is null
--g
select Ma_DocGia,count(QuaTrinhMuon.Ma_CuonSach) as N'So luong sach nhieu nhat da muon'
from QuaTrinhMuon
Group by Ma_DocGia
having count(QuaTrinhMuon.Ma_CuonSach) >= ALL(SELECT Count(QuaTrinhMuon.Ma_CuonSach)
								From QuaTrinhMuon
								Group by Ma_DocGia)
--h. Bạn đọc mượn sách nhiều nhất vào ngày nào?

Select QTM.NgayMuon as N'Ngày mượn', Count(QTM.Ma_DocGia) as N'Số người mượn'
From QuaTrinhMuon QTM
Group by QTM.NgayMuon
Having Count(QTM.Ma_DocGia) >= ALL(SELECT Count(QuaTrinhMuon.Ma_DocGia)
								From QuaTrinhMuon
								Group by NgayMuon)
--====================================================================
--6a. Hiện tt độc giả
Create proc sp_Thongtindocgia (@Ma_DocGia NUMERIC)
as
begin
	if exists (select dg.Ma_DocGia from DocGia dg join NguoiLon l on dg.Ma_DocGia = l.Ma_DocGia 
	join TreEm e on dg.Ma_DocGia = e.Ma_DocGia where @Ma_DocGia = dg.Ma_DocGia)
	begin 
		if exists (select e.Ma_DocGia from TreEm e where e.Ma_DocGia = @Ma_DocGia)
		begin
			select * from DocGia dg join TreEm e on dg.Ma_DocGia = e.Ma_DocGia
		end
		else begin
			select * from DocGia dg join NguoiLon l on dg.Ma_DocGia=l.Ma_DocGia
		end

	end
end
--6b. hiện tt đầu sách
create proc sp_thongtindausach (@ISBN varchar(10))
as
begin
	if exists (select d.ISBN from DauSach d where d.ISBN = @ISBN)
	begin 
		select d.ISBN,d.Bia,d.Ma_TuaSach,d.NgonNgu, t.TacGia,t.TomTat,c.Ma_CuonSach,count(m.Ma_CuonSach) as [số lượng sách chưa đc mượn]
		from DauSach d join TuaSach t on d.Ma_TuaSach = t.Ma_TuaSach
		join CuonSach c on d.ISBN=c.ISBN
		join Muon m on d.ISBN = m.ISBN
		where c.Ma_CuonSach not in (select m.Ma_CuonSach from Muon m) and d.ISBN = @ISBN
		group by d.ISBN,d.Bia,d.Ma_TuaSach,d.NgonNgu, t.TacGia,t.TomTat,c.Ma_CuonSach
	end
end
--6c. liệt kê những độc giả đang mượn sách
CREATE PROC sp_Thongtinnguoilondangmuon 
as begin
	select d.Ma_DocGia,d.TenLot,d.Ten,d.NgaySinh,l.DienThoai,l.SoNha,l.Quan from QuaTrinhMuon q join DocGia d on q.Ma_DocGia=d.Ma_DocGia
	join NguoiLon l on q.Ma_DocGia=l.Ma_DocGia
	where q.NgayHetHan < GETDATE()
end
--6d. liệt kê những độc giả người lớn đang mượn sách quá hạn
CREATE PROC sp_Thongtinnguoilonquahan
as begin
	select d.Ma_DocGia,d.TenLot,d.Ten,d.NgaySinh,l.DienThoai,l.SoNha,l.Quan from QuaTrinhMuon q join DocGia d on q.Ma_DocGia=d.Ma_DocGia
	join NguoiLon l on q.Ma_DocGia=l.Ma_DocGia
	where (select (GETDATE())) > (q.NgayHetHan) or q.NgayTra is null
end
--6e.liệt kê những độc giả người lớn đang mượn sách có trẻ em cũng đang mượn sách
CREATE PROC sp_docgiacotreemmuon
as begin
	select d.Ma_DocGia,d.TenLot,d.Ten,d.NgaySinh,l.DienThoai,l.SoNha,l.Quan from QuaTrinhMuon q join DocGia d on q.Ma_DocGia=d.Ma_DocGia
	join NguoiLon l on q.Ma_DocGia=l.Ma_DocGia join TreEm e on l.Ma_DocGia=e.Ma_DocGia
	where (select (GETDATE())) > (q.NgayHetHan) or q.NgayTra is null
end
--6f. cập nhật trạng thái của đầu sách
CREATE PROC sp_capnhattrangthai
as begin
	if (select COUNT(d.ISBN) as SL  from DauSach d join CuonSach c on d.ISBN=c.ISBN
	group by d.ISBN) > 0
	begin 
		update DauSach set TrangThai = 'Y'
	end
	else begin 
		update DauSach set TrangThai = 'N'
	end
end
--6g thêm tựa sách
CREATE PROC sp_themtuasach (@TuaSach nvarchar(50), 
	@TacGia nvarchar(50), 
	@TomTat nvarchar(200))
as begin
	if (@TuaSach not in (select TuaSach from TuaSach )) or (@TacGia not in (select TacGia from TuaSach )) or 
	(@TomTat not in (select TomTat from TuaSach ))
	begin
		insert into TuaSach values(@TuaSach,@TacGia,@TomTat)
	end
	else print 'Không thể thêm tựa sách này '
	Rollback tran
end
--6h. thêm cuốn sách
CREATE PROC sp_themcuonsach (@ISBN varchar(10),@Ma_CuonSach varchar(5))
as begin
	if(@ISBN not in (select ISBN from DauSach))
	begin 
		print'ma ISBN k ton tai'
		rollback tran
	end
	else begin
	if (@Ma_CuonSach not in (select Ma_CuonSach from CuonSach ))
	begin
		declare @tinhtrang nvarchar(10)
		set @tinhtrang = 'yes'
		insert into CuonSach values(@ISBN,@Ma_CuonSach,@tinhtrang)
	end
	else print 'Không thể thêm cuốn sách này '
	Rollback tran
	end
end
--6i thêm độc giả người lớn 
CREATE PROC sp_themdocgianguoilon ( 
	@Ho nvarchar(10), 
	@TenLot nvarchar(20), 
	@Ten nvarchar(20), 
	@NgaySinh date,
	@SoNha nvarchar(50), 
	@Duong nvarchar(50), 
	@Quan nvarchar(50), 
	@DienThoai nvarchar(10),  
	@HanSuDung date)
as begin
	insert into DocGia values(@Ho,@TenLot,@Ten,@NgaySinh)
	if(DATEDIFF(YEAR,@NgaySinh,GETDATE()) > 18)
	begin 
		insert into NguoiLon values(@SoNha,@Duong,@Quan,@DienThoai,@HanSuDung)
	end
	else return
end
--6j. thêm độc giả trẻ em
CREATE PROC sp_themdocgiatreem ( 
	@Ho nvarchar(10), 
	@TenLot nvarchar(20), 
	@Ten nvarchar(20), 
	@NgaySinh date,
	@Ma_DocGia_NguoiLon varchar(5))
as begin
	insert into DocGia values(@Ho,@TenLot,@Ten,@NgaySinh)
	if ((select count(e.Ma_DocGia_NguoiLon) as [số trẻ em] 
	from NguoiLon l join TreEm e on l.Ma_DocGia=e.Ma_DocGia group by l.Ma_DocGia) > 2)
	begin
		print 'khong thể thêm trẻ em vì vượt quá số lượng bảo lãnh'
		return
	end
	else
	insert into TreEm values(@Ma_DocGia_NguoiLon)
end
--6k. xóa độc giả
CREATE PROC sp_xoadocgia ( 
	@Ma_DocGia NUMERIC)
as begin
	if not exists (select Ma_DocGia from DocGia where Ma_DocGia = @Ma_DocGia)
	begin
		print 'không tồn tại độc giả này'
		return
	end
	else if exists (select Ma_DocGia from Muon where Ma_DocGia = @Ma_DocGia)
	begin
		print 'k thể xóa đc'
		return
	end
	else if exists (select Ma_DocGia from DocGia where DATEDIFF(year,NgaySinh,GETDATE()) > 18 and Ma_DocGia = @Ma_DocGia)
		begin
			if((select count(e.Ma_DocGia_NguoiLon) as SL from NguoiLon l join TreEm e on l.Ma_DocGia=e.Ma_DocGia group by l.Ma_DocGia) = 0)
			begin 
				delete from NguoiLon where Ma_DocGia = @Ma_DocGia
				delete from QuaTrinhMuon where Ma_DocGia = @Ma_DocGia
				delete from DangKy where Ma_DocGia = @Ma_DocGia
				delete from DocGia where Ma_DocGia = @Ma_DocGia
			end
			else if exists (select m.Ma_DocGia from Muon m join TreEm e on m.Ma_DocGia=e.Ma_DocGia) begin
				print 'k thể xóa đc'
				rollback tran
				end
				else 
				begin 
					delete from TreEm where Ma_DocGia = @Ma_DocGia
					delete from NguoiLon where Ma_DocGia = @Ma_DocGia
					delete from QuaTrinhMuon where Ma_DocGia = @Ma_DocGia
					delete from DangKy where Ma_DocGia = @Ma_DocGia
					delete from DocGia where Ma_DocGia = @Ma_DocGia
				end
		end
		else 
		begin 
			delete from TreEm where Ma_DocGia = @Ma_DocGia
			delete from QuaTrinhMuon where Ma_DocGia = @Ma_DocGia
			delete from DangKy where Ma_DocGia = @Ma_DocGia
			delete from DocGia where Ma_DocGia = @Ma_DocGia
		end
end
--6.l muon sach
CREATE PROC sp_muonsach ( 
	@ISBN varchar(10), 
	@Ma_CuonSach varchar(5),
	@Ma_DocGia NUMERIC,
	@NgayMuon date, 
	@NgayHetHan date)
as begin
	if exists (select Ma_DocGia from Muon where ISBN = @ISBN)
	begin
		print 'doc gia dang muon sach cung loai'
		return
	end
	else if exists (select Ma_DocGia from DocGia where DATEDIFF(year,NgaySinh,GETDATE()) > 18 and Ma_DocGia = @Ma_DocGia)
		begin 
			if((select COUNT(*) from Muon where @Ma_DocGia = Ma_DocGia ) > 5)
			begin 
				print 'muon qua so sach'
				return
			end
		end
		else if((select COUNT(*) from Muon where @Ma_DocGia = Ma_DocGia ) > 5)
		begin
			print 'muon qua so sach'
			return
		end
	if((select COUNT(*)as SL from CuonSach where Ma_CuonSach = @Ma_CuonSach and TinhTrang = 'Còn') > 0)
	begin
		insert into Muon values(@ISBN,@Ma_CuonSach,@Ma_DocGia,@NgayMuon,@NgayHetHan)
		update CuonSach set TinhTrang = 'Hết' where @Ma_CuonSach = Ma_CuonSach
		update DauSach set TrangThai = 'cũ' where ISBN = @ISBN
		print 'mượn sách thành công'
	end
	else begin 
		print 'Vui lòng chờ đến khi có sách'
		insert into DangKy values (@ISBN,@Ma_DocGia,GETDATE(),'đang chờ')
	end
end
--6.m tra sach
CREATE PROC sp_trasach ( 
	@ISBN varchar(10), 
	@Ma_CuonSach varchar(5), 
	@NgayMuon date, 
	@Ma_DocGia NUMERIC, 
	@NgayHetHan date, 
	@NgayTra date,  
	@TienDaTra money, 
	@TienDatCoc money, 
	@GhiChu nvarchar(50))
as begin
	declare @X int 
	if exists (select Ma_DocGia  from Muon where datediff(dayofyear,NgayHetHan,GETDATE())> 14 and Ma_DocGia = @Ma_DocGia)
	begin
		set @X = DATEDIFF(DAYOFYEAR,@NgayHetHan,GETDATE()) * 1000
	end
	insert into QuaTrinhMuon values(@ISBN,@Ma_CuonSach,@NgayMuon,@Ma_DocGia,@NgayHetHan,GETDATE(),@X,@TienDaTra,@TienDatCoc,@GhiChu)
	delete from Muon where ISBN = @ISBN and Ma_CuonSach = @Ma_CuonSach
end
--=============================================TRIGGER
--7.a 
CREATE TRIGGER tg_delmuon ON CuonSach
FOR update
AS 
BEGIN
	UPDATE CuonSach SET TinhTrang = 'yes'
	from inserted i where CuonSach.Ma_CuonSach = i.Ma_CuonSach
END
--7.b
CREATE TRIGGER tg_insmuon ON CuonSach
FOR update
AS 
BEGIN
	UPDATE CuonSach SET TinhTrang = 'no'
	from inserted i where CuonSach.Ma_CuonSach = i.Ma_CuonSach
END
--7.c
CREATE TRIGGER tg_insmuon ON DauSach
FOR update
AS 
BEGIN
	UPDATE DauSach SET TrangThai = 'no'
	from inserted i where CuonSach.ISBN = i.ISBN
END
--7.d
CREATE TRIGGER tg_themmoi ON TuaSach
FOR insert,update
AS 
BEGIN
	if update (TacGia)
	begin tran
		update TuaSach set TacGia = i.TacGia
		from inserted i join deleted d on i.Ma_TuaSach=d.Ma_TuaSach
		print 'Đã thêm mới'
	commit
	if update (TuaSach)
	begin tran
		update TuaSach set TuaSach = i.TuaSach
		from inserted i join deleted d on i.Ma_TuaSach=d.Ma_TuaSach
		print 'Đã thêm mới'
	commit
	begin tran
		declare @TuaSach nvarchar(50), 
			@TacGia nvarchar(50), 
			@TomTat nvarchar(200)
		select @TuaSach = i.TuaSach
		from inserted i 
		select @TacGia = i.TacGia
		from inserted i
		select @TomTat = i.TomTat
		from inserted i
		insert into TuaSach values(@TuaSach,@TacGia,@TomTat)
		print 'Đã thêm mới'
	commit
END
--7e
CREATE TRIGGER tg_suathongtin ON TuaSach
FOR update
AS 
BEGIN
	declare @Ma_TuaSach numeric
	insert into TuaSach
	select @Ma_TuaSach = i.TacGia from inserted i join deleted d on i.Ma_TuaSach = d.Ma_TuaSach
	print 'Vừa sửa thông tin của tựa sách có mã số tựa sách là '+@Ma_TuaSach
END
--7f
CREATE TRIGGER tg_themtuasach ON TuaSach
FOR insert
AS 
BEGIN
	if exists (select i.TuaSach from inserted i where i.TuaSach in (select TuaSach from TuaSach))
	begin
		print 'đã tồn tại tựa sách này'
		rollback tran
		return
	end
	else print 'có thể thêm tựa sách này'
END