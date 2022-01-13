﻿CREATE DATABASE QLTM 

USE QLTM
GO


CREATE TABLE THOMOC (
	MATM VARCHAR(5) PRIMARY KEY,
	TENTM NVARCHAR(30) NOT NULL,
	NGAYSINH DATE NOT NULL,
	NGAYLAMVIEC DATE NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	LUONG DECIMAL(10,2) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL
)

CREATE TABLE KHACHHANG (
	MAKH VARCHAR(5) PRIMARY KEY,
	TENKH NVARCHAR(30) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL
)

CREATE TABLE NHACUNGCAPVT(
	MANCC VARCHAR(5) PRIMARY KEY,
	TENNCC NVARCHAR(30) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	SDT VARCHAR(20) NOT NULL
)

CREATE TABLE VATTU (
	MAVT VARCHAR(5) PRIMARY KEY,
	TENVT NVARCHAR(30) NOT NULL,
	DVT NVARCHAR(10) NOT NULL,
	GIAVT DECIMAL(10,2) NOT NULL,
	MANCC VARCHAR(5) FOREIGN KEY REFERENCES NHACUNGCAPVT(MANCC)
)

CREATE TABLE LOAISP(
	MALSP VARCHAR(5) PRIMARY KEY,
	TENLOAISP NVARCHAR(10) NOT NULL
)

CREATE TABLE SANPHAM (
	MASP VARCHAR(5) PRIMARY KEY,
	TENSP NVARCHAR(20) NOT NULL,
	IMG VARCHAR(MAX),
	MOTA NVARCHAR(255),
	CHIEURONG_CM SMALLINT NOT NULL,
	CHIEUCAO_CM SMALLINT NOT NULL,
	GIASP DECIMAL(10,2) NOT NULL,
	MALSP VARCHAR(5) FOREIGN KEY REFERENCES LOAISP(MALSP)
)

CREATE TABLE PHANCONG (
	MATM VARCHAR(5) FOREIGN KEY REFERENCES THOMOC(MATM),
	MASP VARCHAR(5) FOREIGN KEY REFERENCES SANPHAM(MASP),
	THOIGIAN DECIMAL(5,1) NOT NULL,
	PRIMARY KEY (MATM, MASP)
)

CREATE TABLE VATTUTAOSP (
	MASP VARCHAR(5) FOREIGN KEY REFERENCES SANPHAM(MASP),
	MAVT VARCHAR(5) FOREIGN KEY REFERENCES VATTU(MAVT),
	SOLUONGVT DECIMAL(5,1) NOT NULL,
	PRIMARY KEY (MASP, MAVT)
)

CREATE TABLE DONDATSP (
	SOHD VARCHAR(10) PRIMARY KEY,
	MAKH VARCHAR(5) FOREIGN KEY REFERENCES KHACHHANG(MAKH),
	NGAYDAT DATE NOT NULL,
	NGAYGIAO DATE NOT NULL,
	NOIGIAO NVARCHAR(50)
)

CREATE TABLE CTDATSP (
	SOHD VARCHAR(10) FOREIGN KEY REFERENCES DONDATSP(SOHD),
	MASP VARCHAR(5) FOREIGN KEY REFERENCES SANPHAM(MASP),
	SOLUONG SMALLINT NOT NULL,
	PRIMARY KEY (SOHD, MASP)
)


INSERT INTO THOMOC(MATM,TENTM,NGAYSINH,NGAYLAMVIEC,DIACHI,SDT,LUONG,PHAI) VALUES
('TM001',N'PHAN TRẦN HỮU PHÚC','2001/10/22','2021/11/01',N'56 KA CÙ LAO THƯỢNG, NHA TRANG','0708488401',5000000,'NAM'),
('TM002',N'NGUYỄN CAO CƯỜNG','1991/04/12','2015/10/10',N'TỔ 20 HÒN NGHÊ 2, NHA TRANG','0935123441',10000000,'NAM'),
('TM003',N'PHẠM BÁ TÍN','1995/02/24','2020/02/15',N'40 NGÕ NGỌC SƠN, VŨNG ĐÌNH, NHA TRANG','0703478407',5000000,'NAM'),
('TM004',N'PHAN QUANG','2000/09/23','2021/11/01',N'57 KA CÙ LAO THƯỢNG, NHA TRANG','0707468412',5000000,'NAM'),
('TM005',N'TRẦN CÔNG NHÂN','1991/01/06','2015/10/1',N'30 TÔN THẤT TÙNG, NHA TRANG','0708488401',10000000,'NAM')

INSERT INTO KHACHHANG(MAKH,TENKH,DIACHI,SDT,PHAI) VALUES
('KH001',N'PHẠM MINH HOÀNG',N'53 KA CÙ LAO TRUNG, NHA TRANG','0708378402','NAM'),
('KH002',N'NGUYỄN PHƯƠNG LAM',N'TỔ 10 HÒN NGHÊ 1, NHA TRANG','0946123441',N'NỮ'),
('KH003',N'LÊ VĂN THANH',N'105 NGUYỄN KHUYẾN, VĨNH HÃI, NHA TRANG','0743477407','NAM'),
('KH004',N'NGUYỄN TRỌNG HIẾU',N'40 ĐƯỜNG BIỆT THỰ, NHA TRANG','0707499432','NAM'),
('KH005',N'TRẦN THỊ QUỲNH TRÂM',N'23 KB CÙ LAO THƯỢNG, NHA TRANG','0908486404',N'NỮ')

INSERT INTO NHACUNGCAPVT(MANCC,TENNCC,DIACHI,SDT) VALUES 
('CC001',N'GỖ NHA TRANG','22 LÊ HỒNG PHONG, NHA TRANG','0905703521'),
('CC002',N'VẬT TƯ HỒNG HẢI','13 NGUYỄN KHUYẾN, VĨNH HẢI, NHA TRANG','0905703521'),
('CC003',N'TIỆM KÍNH, GƯƠNG PHAN BIỂU','26 NGUYỄN KHUYẾN, VĨNH HẢI, NHA TRANG','0905703522')

INSERT INTO VATTU(MAVT,TENVT,DVT,GIAVT,MANCC) VALUES
('VT001',N'VÁN ÉP OKAL','TẤM',250000,'CC001'),
('VT002',N'VÁN ÉP PLYWOOD','TẤM',260000,'CC001'),
('VT003',N'VÁN ÉP MDF','TẤM',240000,'CC001'),
('VT004',N'VÁN ÉP HDF','TẤM',250000,'CC001'),
('VT005',N'SƠN LÓT','LÍT',100000,'CC002'),
('VT006',N'SƠN PU CHỐNG THẤM','LÍT',100000,'CC002'),
('VT007',N'SƠN PU BÓNG MỜ','LÍT',100000,'CC002'),
('VT008',N'ĐINH','KILOGRAM',50000,'CC002'),
('VT009',N'GƯƠNG','MÉT',100000,'CC003'),
('VT010',N'KÍNH','MÉT',100000,'CC003')

INSERT INTO LOAISP(MALSP,TENLOAISP) VALUES
('LSP01',N'BÀN'),
('LSP02',N'GHẾ'),
('LSP03',N'TỦ'),
('LSP04',N'GIƯỜNG')

INSERT INTO SANPHAM(MASP,TENSP,IMG,MOTA,CHIEURONG_CM,CHIEUCAO_CM,GIASP,MALSP) VALUES
('SP001',N'BÀN LÀM VIỆC IKIA 3M','LINK IMG',N'MẶT BÀN 3 MÉT, BO TRÒN CÁC GÓC', 300 , 120 , 500000 ,'LSP01'),
('SP002',N'BÀN LÀM VIỆC IKIA 2M','LINK IMG',N'MẶT BÀN 2 MÉT, BO TRÒN CÁC GÓC', 200, 120 , 300000 ,'LSP01'),
('SP003',N'BÀN UỐNG CÀ PHÊ ORAN','LINK IMG',N'MẶT BÀN TRÒN, SƠN PU CHỐNG THẤM', 50 , 100 , 100000 ,'LSP01'),
('SP004',N'GHẾ LÀM VIỆC CỔ ĐIỂN','LINK IMG',N'SƠN CHỐNG THẤM, BO TRÒN CÁC GÓC CỦA MẶT GHẾ', 30 , 150 , 200000 ,'LSP02'),
('SP005',N'GHẾ UỐNG CÀ PHÊ ORAN','LINK IMG',N'MẶT GHẾ TRÒN, KHÔNG CÓ TỰA LƯNG, BO TRNF CÁC CHÂN', 20 , 50 , 90000 ,'LSP02'),
('SP006',N'GIƯỜNG NGỦ 2M','LINK IMG',N'GIƯỜNG DÀI 2 MÉT, SƠN BÓNG MỜ', 180 , 200 , 1000000 ,'LSP04'),
('SP007',N'GIƯỜNG NGỦ 3M','LINK IMG',N'GIƯỜNG DÀI 3 MÉT, SƠN BÓNG MỜ', 200 , 300 , 2000000 ,'LSP04'),
('SP008',N'TỦ QUẦN ÁO AKIRA','LINK IMG',N'SƠN PU CHỐNG THẤM, CÓ HAI CỬA, CÓ MỘT GƯƠNG Ở CỬA TRÁI', 160 , 230 , 1000000 ,'LSP03'),
('SP009',N'TỦ ĐỰNG RƯỢU','LINK IMG',N'SƠN PU CHỐNG THẤM, CÓ KÍNH Ở BỐN MẶT TỦ', 160 , 240 , 1400000 ,'LSP03')

INSERT INTO PHANCONG(MATM,MASP,THOIGIAN) VALUES
('TM001','SP001',8),
('TM002','SP002',7),
('TM003','SP003',6),
('TM004','SP004',7),
('TM005','SP005',5),
('TM001','SP006',16),
('TM002','SP006',16),
('TM003','SP007',17),
('TM004','SP007',17),
('TM005','SP008',20),
('TM004','SP008',20),
('TM002','SP009',14),
('TM003','SP009',14)

INSERT INTO VATTUTAOSP(MASP,MAVT,SOLUONGVT) VALUES
('SP001','VT008',0.5),
('SP001','VT002',1),
('SP001','VT005',1),
('SP001','VT006',1),
('SP002','VT008',0.4),
('SP002','VT001',0.8),
('SP002','VT005',1),
('SP002','VT006',1),
('SP003','VT008',0.3),
('SP003','VT003',0.4),
('SP003','VT005',0.5),
('SP003','VT006',0.5),
('SP004','VT008',0.3),
('SP004','VT002',0.5),
('SP004','VT005',0.5),
('SP004','VT006',0.5),
('SP005','VT008',0.3),
('SP005','VT003',0.3),
('SP005','VT005',0.5),
('SP005','VT006',0.5),
('SP006','VT008',0.7),
('SP006','VT004',2),
('SP006','VT005',1),
('SP006','VT007',1),
('SP007','VT008',1),
('SP007','VT004',2.2),
('SP007','VT005',1.2),
('SP007','VT006',1.2),
('SP008','VT008',1.3),
('SP008','VT002',2.5),
('SP008','VT005',1.5),
('SP008','VT006',1.5),
('SP008','VT009',2.2),
('SP009','VT008',1),
('SP009','VT002',1),
('SP009','VT005',1),
('SP009','VT006',1),
('SP009','VT010',8)

INSERT INTO DONDATSP(SOHD,MAKH,NGAYDAT,NGAYGIAO) VALUES
('HD001','KH001','8/10/2021','9/1/2021'),
('HD002','KH002','8/21/2021','9/15/2021'),
('HD003','KH003','7/10/2021','7/21/2021'),
('HD004','KH004','9/3/2021','9/30/2021'),
('HD005','KH005','6/26/2021','7/6/2021'),
('HD006','KH001','9/21/2021','10/15/2021'),
('HD007','KH002','10/30/2021','11/5/2021')

INSERT INTO CTDATSP(SOHD,MASP,SOLUONG) VALUES
('HD001','SP001',1),
('HD001','SP004',1),
('HD002','SP003',5),
('HD002','SP005',5),
('HD003','SP007',1),
('HD004','SP006',1),
('HD004','SP008',1),
('HD005','SP009',1),
('HD006','SP002',1),
('HD006','SP004',1),
('HD007','SP009',1)

--1.Thợ mộc nào của trại mộc làm được số lượng sản phẩm nhiều nhất và số lượng sản phẩm bán được của những thợ mộc này là bao nhiêu.
SELECT TM.MATM,TM.TENTM,SUM(CT.SOLUONG) AS [SO LUONG SP]
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
join CTDATSP CT ON PC.MASP=CT.MASP
GROUP BY TM.MATM,TM.TENTM
HAVING SUM(CT.SOLUONG) >= ALL(SELECT SUM(CT1.SOLUONG) FROM PHANCONG PC1 JOIN CTDATSP CT1 ON PC1.MASP=CT1.MASP GROUP BY PC1.MATM)
--2.Cho biết thông tin khách hàng, và số tiền phải trả ứng với mỗi sản phẩm, theo thứ tự số tiền phải trả tăng dần.
SELECT KH.TENKH, SUM(CT.SOLUONG*SP.GIASP) AS [SO TIEN PHAI TRA]
FROM KHACHHANG KH JOIN DONDATSP D ON KH.MAKH= D.MAKH 
JOIN CTDATSP CT ON D.SOHD=CT.SOHD
JOIN SANPHAM SP ON CT.MASP=SP.MASP
GROUP BY  KH.TENKH
ORDER BY SUM(CT.SOLUONG*SP.GIASP)
--3.cho biết số lượng khách hàng có địa chỉ tại nha trang đặt mua hàng
SELECT COUNT(*) AS [SO LUONG KHACH HANG]
FROM KHACHHANG KH JOIN DONDATSP D ON KH.MAKH= D.MAKH 
JOIN CTDATSP CT ON D.SOHD=CT.SOHD
WHERE KH.DIACHI LIKE '%NHA TRANG%'
--4. cho biết số tiền phải trả ứng với mỗi sản phẩm
SELECT SP.TENSP, SUM(SP.GIASP*CT.SOLUONG) AS [SO TIEN]
FROM SANPHAM SP JOIN CTDATSP CT ON SP.MASP=CT.MASP
GROUP BY SP.TENSP
--5. cho biết số sản phẩm của từng loại sản phẩm
SELECT L.TENLOAISP,L.MALSP, COUNT(S.MASP) AS [SO SP]
FROM LOAISP L JOIN SANPHAM S ON L.MALSP=S.MALSP
GROUP BY L.TENLOAISP,L.MALSP
--6. liệt kê số tiền phải trả của mỗi vật tư ứng với mỗi nhà cung cấp.
SELECT NCC.TENNCC,NCC.MANCC, SUM(VT.GIAVT*VP.SOLUONGVT) AS [SO TIEN PHAI TRA]
FROM NHACUNGCAPVT NCC JOIN VATTU VT ON NCC.MANCC=VT.MANCC
JOIN VATTUTAOSP VP ON VT.MAVT = VP.MAVT
GROUP BY NCC.TENNCC,NCC.MANCC
--7. cho biết số giờ làm việc của từng thợ mộc
SELECT TM.MATM,TM.TENTM,SUM(PC.THOIGIAN) AS [SO GIO LAM VC]
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
GROUP BY TM.MATM,TM.TENTM 
--8. Tính tổng số tiền thu được của từng khách hàng mua hàng.
SELECT KH.MAKH,KH.TENKH,SUM(CT.SOLUONG*SP.GIASP) AS [SỐ TIỀN THU]
FROM KHACHHANG KH JOIN DONDATSP D ON KH.MAKH= D.MAKH 
JOIN CTDATSP CT ON D.SOHD=CT.SOHD
JOIN SANPHAM SP ON CT.MASP=SP.MASP 
GROUP BY KH.MAKH,KH.TENKH
--9. đếm số sản phẩm của từng khách hàng được giao trong năm 2021
SELECT KH.TENKH,YEAR(D.NGAYGIAO) AS [NAM], COUNT(D.SOHD) AS [SO SAN PHAM]
FROM KHACHHANG KH JOIN DONDATSP D ON KH.MAKH= D.MAKH
WHERE YEAR(D.NGAYGIAO) = 2021
GROUP BY KH.TENKH,YEAR(D.NGAYGIAO)
--10. đếm số lượng vật tư cần có để tạo nên từng sản phẩm
SELECT SP.TENSP, COUNT(VT.MAVT) AS [SỐ VT]
FROM VATTUTAOSP VT JOIN SANPHAM SP ON VT.MASP=SP.MASP
GROUP BY SP.TENSP
--JOIN tìm những thợ mộc làm sp có masp là: SP008 HOẶC SP007
SELECT TM.MATM,TM.TENTM 
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
WHERE PC.MASP = 'SP007'
UNION
SELECT TM.MATM,TM.TENTM 
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
WHERE PC.MASP = 'SP008'
--INTERSECT tìm những thợ mộc làm sp có masp là: SP008 VÀ SP007
SELECT TM.MATM,TM.TENTM 
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
WHERE PC.MASP = 'SP007'
INTERSECT
SELECT TM.MATM,TM.TENTM 
FROM THOMOC TM JOIN PHANCONG PC ON TM.MATM=PC.MATM
WHERE PC.MASP = 'SP008'
--EXCEPT tìm những vật tư tạo nên sp có mã sp là SP009
SELECT MAVT
FROM VATTUTAOSP 
EXCEPT
SELECT MAVT
FROM VATTUTAOSP
WHERE MASP = 'SP009'
--trigger
--1 HÓA ĐƠN K THỂ CÓ NHIỀU HƠN 10 CTHD
CREATE TRIGGER addCTHD ON CTDATSP
FOR INSERT
AS 
BEGIN
	DECLARE @D INT
	SET @D = (SELECT COUNT(*) FROM CTDATSP A JOIN INSERTED B ON A.MASP=B.MASP)
	IF (@D > 10)
	BEGIN
		PRINT 'SO CTHD K THE LON HON 10'
		ROLLBACK TRAN 
		RETURN
	END
END
--CTHD s cho giá bán > giá mua
--