--1. Tạo các users John, Joe, Fred, Lynn, Amy, and Beth
--a.Password lần lượt là tên username viết hoa
CREATE LOGIN John with password = 'JOHN'
CREATE USER John FOR LOGIN John 
CREATE LOGIN Joe with password = 'JOE'
CREATE USER Joe FOR LOGIN Joe
CREATE LOGIN Fred with password = 'FRED'
CREATE USER Fred FOR LOGIN Fred 
CREATE LOGIN Lynn with password =  'LYNN'
CREATE USER Lynn FOR LOGIN Lynn
CREATE LOGIN Amy with password =  'AMY'
CREATE USER Amy FOR LOGIN Amy
CREATE LOGIN Beth with password = 'BETH'
CREATE USER Beth FOR LOGIN Beth
--b. Đảm bảo các user này có thể tạo bất kỳ bảng nào trong tablespace với quota 10M. Ví dụ minh họa.
GRANT CREATE TABLE TO John,Joe,Fred,Lynn,Amy,Beth
--ví dụ:
SELECT * FROM Attendance 

--2 
CREATE DATABASE KIEMTRA
CREATE TABLE Attendance (
	ID INT PRIMARY KEY,
	NAME NVARCHAR(20)
)
--a.Tạo các role sau: DataEntry, Supervisor, và Management 
CREATE ROLE DataEntry
CREATE ROLE Supervisor
CREATE ROLE Management
--b.Gán John, Joe, và Lynn vào role DataEntry, gán Fred vào role Supervisor, và gán Amy và Beth vào role Management.
GRANT DataEntry TO John, Joe, Lynn
GRANT Supervisor TO Fred
GRANT Management TO Amy, Beth

--c.Cho role DataEntry các quyền SELECT, INSERT, và UPDATE trên bảng Attendance
GRANT SELECT, INSERT, UPDATE ON Attendance TO DataEntry
--d. Cho role Supervisor các quyền SELECT và DELETE trên bảng Attendance
GRANT SELECT, DELETE ON Attendance TO Supervisor
--e. Cho role Management quyền SELECT trên bảng Attendance
GRANT SELECT ON Attendance TO Management
--f. Lần lượt kiểm tra kết quả phân quyền đã cấp cho các role
select * 
from Attendance


insert into Attendance
values(5,'Tan')

delete from Attendance 
where ID = 3
--câu 3. 
--a)Gán password cho role DataEntry ở bài 2a là “mgt”
ALTER ROLE DataEntry IDENTIFIED BY mgt
-- b)	Cho phép user John quyền cấp quyền cho các user khác
GRANT SELECT,INSERT, UPDATE ON Attendance to John WITH ADMIN OPTION
--c)	Gán tất cả các quyền mà John có cho Beth. Beth có quyền INSERT và UPDATE trên bảng Attendance không?
GRANT SELECT, INSERT, UPDATE ON  Attendance TO Beth

INSERT INTO Attendance
VALUES(3,'KIET')

UPDATE Attendance
SET NAME = (SELECT NAME FROM Attendance WHERE NAME = 'Tan')