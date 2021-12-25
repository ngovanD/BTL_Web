CREATE DATABASE SHOPDIENTHOAI
GO

USE SHOPDIENTHOAI
GO

CREATE TABLE Slide(
	MaSlide int IDENTITY(1,1) PRIMARY KEY,
	TenSlide nvarchar(100),
	HinhAnh varchar(100),
	NoiDung nvarchar(300),
	Link nvarchar(100),
	TrangThai BIT
)

insert into Slide(TenSlide, HinhAnh, TrangThai) values('1', 'download.jpg', 1)
insert into Slide(TenSlide, HinhAnh, TrangThai) values('2', 'apple-fall-event-2021.jpeg', 1)
insert into Slide(TenSlide, HinhAnh, TrangThai) values('3', 'collage.jpg', 1)
insert into Slide(TenSlide, HinhAnh, TrangThai) values('4', 'images.jpg', 1)
insert into Slide(TenSlide, HinhAnh, TrangThai) values('5', 'san-pham-cua-apple-2021-hinh1_800x450.jpg', 1)

select * from Slide


CREATE TABLE TaiKhoan(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Email varchar(30) UNIQUE NOT NULL,
	HoTen nvarchar(100),
	MatKhau varchar(30) NOT NULL,
	LoaiTaiKhoan varchar(10)
)

CREATE TABLE ThongTinShop(
	MaLienHeShop int PRIMARY KEY,
	DiaChi nvarchar(100),
	Email varchar(30),
	SoDienThoai varchar(10),
	TenShop nvarchar(300),
)

CREATE TABLE LoaiSanPham(
	MaLoaiSanPham int IDENTITY(1,1) PRIMARY KEY,
	TenLoaiSanPham nvarchar(100),
	HinhAnh varchar(30)
)

insert into LoaiSanPham values(N'Iphone', 'Iphone.png')
insert into LoaiSanPham values(N'Ipad', 'Ipad.png')
insert into LoaiSanPham values(N'Macbook', 'Macbook.png')
insert into LoaiSanPham values(N'Apple Watch', 'AppleWatch.png')
insert into LoaiSanPham values(N'AirPod', 'AirPod.png')
insert into LoaiSanPham values(N'Phụ kiện', 'PhuKien.png')

CREATE TABLE SanPham(
	MaSanPham int IDENTITY(1,1) PRIMARY KEY,
	TenSanPham nvarchar(200),
	HinhAnh varchar(30),
	MoTa nvarchar(1000),
	NgayTao datetime,
	NgayCapNhat datetime,
	SanPhamMoi BIT,
	NoiBat BIT,
	MaLoaiSanPham int,
	FOREIGN KEY(MaLoaiSanPham) REFERENCES LoaiSanPham(MaLoaiSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)

insert into SanPham values(N'IPhone 12 Pro Max','ip12-pro-max.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Max Blue','iphone-13-pro-max-blue.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Silver','iphone-13-pro-silver.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Mini Red','iphone-12-mini-red.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Mini Pink','iphone-13-mini-pink.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Blue','iphone-12-pro-blue.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 White','iphone-12-white.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XR','iPhone-XR.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone SE 2020','iPhone-SE-2020.png',N'k co',GETDATE(),GETDATE(),0,0,1)

insert into SanPham values(N'Ipad Gen 9 2021 Silver','ipad-gen-9-2021-silver.png',N'k co',GETDATE(),GETDATE(),0,0,2)
insert into SanPham values(N'Ipad Mini 6 2021','ipad-mini-6-2021.png',N'k co',GETDATE(),GETDATE(),0,0,2)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',N'k co',GETDATE(),GETDATE(),0,0,2)
insert into SanPham values(N'Ipad Air gen 4 ','iPad-air-gen4-green.png',N'k co',GETDATE(),GETDATE(),0,0,2)

insert into SanPham values(N'MacBook Pro 16 Inch Silver ','MacBook_Pro_16-in_Silver.png',N'k co',GETDATE(),GETDATE(),0,0,3)
insert into SanPham values(N'MacBook Air M1  ','MacBook-Air-M1.png',N'k co',GETDATE(),GETDATE(),0,0,3)
insert into SanPham values(N'Mac Mini M1  ','Mac-Mini-M1.png',N'k co',GETDATE(),GETDATE(),0,0,3)

insert into SanPham values(N'Apple Watch Series 7 Steel  ','Apple-Watch-Series-7-41mm.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch Series 7 Nhôm  ','Apple-Watch-Series-7-41mm.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch Series 6 Thép  ','Watch-6-Thép-3.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch Series 6 Nhôm  ','Watch-6-Thép-2.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch SE ','Watch-SE.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch 5 Nike ','Watch-5-Nike-2.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch 5 Đen ','Watch-5-den.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch  ','Watch-3.png',N'k co',GETDATE(),GETDATE(),0,0,4)

insert into SanPham values(N'AirPod ','AirPods_3rd_Gen_PDP.png',N'k co',GETDATE(),GETDATE(),0,0,5)
insert into SanPham values(N'AirPod Pro 2020','AirPods-Pro.png',N'k co',GETDATE(),GETDATE(),0,0,5)
insert into SanPham values(N'AirPod Pro Max','AirPods-Max.png',N'k co',GETDATE(),GETDATE(),0,0,5)
insert into SanPham values(N'AirPod Pro 2(hộp sạc thường)','3.-AirPods-2.png',N'k co',GETDATE(),GETDATE(),0,0,5)

insert into SanPham values(N'Giác chuyển đổi MagSafe to MagSafe 2','3.-AirPods-2.png',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Dây đeo Watch 40mm Sport Loop','sport-loop-red.png',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Cáp USB-C Charge Cable 1m','cap-type-c-1m.png',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Combo Chuột Phím iMac - Chính hãng Việt Nam','Chuot-BanPhim.jpg',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Dây đeo Apple Watch Nike Sport Loop','MX802.png',N'k co',GETDATE(),GETDATE(),0,0,6)

CREATE TABLE DungLuong(
	ID_DungLuong int IDENTITY(1,1) PRIMARY KEY,
	KichThuoc int,
)

insert into DungLuong Values(32)
insert into DungLuong Values(64)
insert into DungLuong Values(128)
insert into DungLuong Values(256)

CREATE TABLE MauSac(
	ID_MauSac int IDENTITY(1,1) PRIMARY KEY,
	TenMau nvarchar(30), 
)

insert into MauSac Values('gold')
insert into MauSac Values('silver')
insert into MauSac Values('black')
insert into MauSac Values('red')

CREATE TABLE SanPham_MauSac_DungLuong(
	MaSanPham int,
	ID_DungLuong int, 
	ID_MauSac int, 
	Gia int, 
	GiaGiam int,
	SoLuongCon int,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID_DungLuong) REFERENCES DungLuong(ID_DungLuong) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID_MauSac) REFERENCES MauSac(ID_MauSac) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(MaSanPham, ID_DungLuong, ID_MauSac)
)

insert into SanPham_MauSac_DungLuong values(1, 1, 1, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 2, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 3, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 4, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 1, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 2, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 3, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 4, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 1, 50000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 2, 50000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 3, 50000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 4, 50000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 1, 60000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 2, 60000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 3, 60000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 4, 60000000, 0, 100)

insert into SanPham_MauSac_DungLuong values(2, 1, 1, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 2, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 3, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 4, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 1, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 2, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 3, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 4, 40000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 3, 1, 50000000, 0, 100)

insert into SanPham_MauSac_DungLuong values(3, 1, 1, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 1, 2, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 1, 3, 30000000, 0, 100)

insert into SanPham_MauSac_DungLuong values(4, 1, 1, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 1, 2, 30000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 1, 3, 30000000, 0, 100)


select * from SanPham_MauSac_DungLuong



select * from SanPham_MauSac_DungLuong

drop table LoaiSanPham

///

CREATE TABLE MENU(
	MaDanhMuc int IDENTITY(1,1) PRIMARY KEY,
	TenDanhMuc nvarchar(30),
	Link varchar(100)
)


CREATE TABLE ThongTinLienHe_KhachHang(
	MaThongTinLienHe_KhachHang int IDENTITY(1,1) PRIMARY KEY,
	HoTen nvarchar(100),
	DiaChi nvarchar(300),
	SoDienThoai varchar(10),
	GhiChu nvarchar(1000)
)

CREATE TABLE HoaDon(
	MaHoaDon int IDENTITY(1,1) PRIMARY KEY,
	TongTien int,
	NgayLapHoaDon datetime,
	TrangThai nvarchar(30),
	MaThongTinLienHe_KhachHang int,
	ID int,
	FOREIGN KEY(ID) REFERENCES TaiKhoan(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(MaThongTinLienHe_KhachHang) REFERENCES ThongTinLienHe_KhachHang(MaThongTinLienHe_KhachHang) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE ChiTietHoaDon(
	MaHoaDon int,
	MaSanPham int,
	ID_DungLuong int, 
	ID_MauSac int, 
	SoLuong int,
	FOREIGN KEY(MaHoaDon) REFERENCES HoaDon(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID_DungLuong) REFERENCES DungLuong(ID_DungLuong) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID_MauSac) REFERENCES MauSac(ID_MauSac) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(MaHoaDon, ID_DungLuong, ID_MauSac, MaSanPham)
)

select SanPham.MaSanPham, SanPham.TenSanPham, SanPham.HinhAnh,  min(SanPham_MauSac_DungLuong.Gia)
from SanPham inner join SanPham_MauSac_DungLuong on SanPham.MaSanPham = SanPham_MauSac_DungLuong.MaSanPham
inner join MauSac on MauSac.ID_MauSac = SanPham_MauSac_DungLuong.ID_MauSac
inner join DungLuong on DungLuong.ID_DungLuong = SanPham_MauSac_DungLuong.ID_DungLuong
where SanPham.MaLoaiSanPham = 1 and SanPham_MauSac_DungLuong.SoLuongCon > 0
group by SanPham.MaSanPham, SanPham.TenSanPham, SanPham.HinhAnh

select SanPham.MaSanPham, SanPham.TenSanPham, SanPham.HinhAnh, TenMau, KichThuoc, Gia 
from SanPham inner join SanPham_MauSac_DungLuong on SanPham.MaSanPham = SanPham_MauSac_DungLuong.MaSanPham
inner join MauSac on MauSac.ID_MauSac = SanPham_MauSac_DungLuong.ID_MauSac
inner join DungLuong on DungLuong.ID_DungLuong = SanPham_MauSac_DungLuong.ID_DungLuong
where SanPham.MaSanPham = 1
order by SanPham_MauSac_DungLuong.Gia

