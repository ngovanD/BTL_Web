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
	TenLoaiSanPham nvarchar(100)
)

insert into LoaiSanPham values(N'iphone')
insert into LoaiSanPham values(N'ipad')
insert into LoaiSanPham values(N'MacBook')
insert into LoaiSanPham values(N'AirPod')
insert into LoaiSanPham values(N'Apple Watch')
insert into LoaiSanPham values(N'Phukien')
go
CREATE TABLE SanPham(
	MaSanPham int IDENTITY(1,1) PRIMARY KEY,
	TenSanPham nvarchar(200),
	HinhAnh varchar(30),
	Gia int,
	GiaGiam int,
	MoTa nvarchar(1000),
	NgayTao datetime,
	NgayCapNhat datetime,
	SanPhamMoi BIT,
	NoiBat BIT,
	MaLoaiSanPham int,
	FOREIGN KEY(MaLoaiSanPham) REFERENCES LoaiSanPham(MaLoaiSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)
insert into SanPham values(N'IPhone 12 Pro Max','ip12-pro-max.png',28950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Max','ip12-pro-max.png',31450000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Max','ip12-pro-max.png',36650000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Max Blue','iphone-13-pro-max-blue.png',32450000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Max Blue','iphone-13-pro-max-blue.png',34450000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Max Blue','iphone-13-pro-max-blue.png',39950000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Max Blue','iphone-13-pro-max-blue.png',44950000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Silver','iphone-13-pro-silver.png',29450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Silver','iphone-13-pro-silver.png',32550000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Silver','iphone-13-pro-silver.png',35950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Pro Silver','iphone-13-pro-silver.png',40950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Mini Red','iphone-12-mini-red.png',23450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Mini Red','iphone-12-mini-red.png',25350000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Mini Red','iphone-12-mini-red.png',30750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Mini Pink','iphone-13-mini-pink.png',19950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Mini Pink','iphone-13-mini-pink.png',22750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 13 Mini Pink','iphone-13-mini-pink.png',28150000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Blue','iphone-12-pro-blue.png',25450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Blue','iphone-12-pro-blue.png',26950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 Pro Blue','iphone-12-pro-blue.png',28950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 12 White','iphone-12-white.png',13640000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XR','iPhone-XR.png',20450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XR','iPhone-XR.png',12990000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone SE 2020','iPhone-SE-2020.png',10790000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone SE 2020','iPhone-SE-2020.png',11790000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone SE 2020','iPhone-SE-2020.png',14490000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Gen 9 2021 Silver','ipad-gen-9-2021-silver.png',10450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Gen 9 2021 Silver','ipad-gen-9-2021-silver.png',13790000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Mini 6 2021','ipad-mini-6-2021.png',14750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Mini 6 2021','ipad-mini-6-2021.png',18450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',21450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',23150000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',27350000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',40950000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Pro 11(M1) 2021 ','ipad-pro-11inch-m1-silver.png',49950000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Air gen 4 ','iPad-air-gen4-green.png',16450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Ipad Air gen 4 ','iPad-air-gen4-green.png',18690000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Pro 16 Inch Silver ','MacBook_Pro_16-in_Silver.png',64750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Pro 16 Inch Silver ','MacBook_Pro_16-in_Silver.png',69750000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Air M1  ','MacBook-Air-M1.png',26450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Air M1  ','MacBook-Air-M1.png',31350000 ,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Pro M1  ','MacBook-Pro-M1.png',32900000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'MacBook Pro M1  ','MacBook-Pro-M1.png',37450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Mac Mini M1  ','Mac-Mini-M1.png',17450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Mac Mini M1  ','Mac-Mini-M1.png',21750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 7 Steel  ','Apple-Watch-Series-7-41mm.png',20750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 7 Steel  ','Apple-Watch-Series-7-41mm.png',19750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 7 Nhôm  ','Apple-Watch-Series-7-41mm.png',10950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 7 Nhôm  ','Apple-Watch-Series-7-41mm.png',12750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 6 Thép  ','Watch-6-Thép-3.png',17180000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 6 Thép  ','Watch-6-Thép-3.png',18950000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 6 Nhôm  ','Watch-6-Thép-2.png',8580000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch Series 6 Nhôm  ','Watch-6-Thép-2.png',9750000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch SE ','Watch-SE.png',6850000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch SE ','Watch-SE.png',7800000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch 5 Nike ','Watch-5-Nike-2.png',8250000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch 5 Nike ','Watch-5-Nike-2.png',8450000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch 5 Đen ','Watch-5-den.png',7250000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch 5 Đen ','Watch-5-den.png',7650000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch  ','Watch-3.png',4740000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Apple Watch  ','Watch-3.png',5550000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'AirPod ','AirPods_3rd_Gen_PDP.png',4990000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'AirPod Pro 2020','AirPods-Pro.png',5490000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'AirPod Pro Max','AirPods-Max.png',11990000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'AirPod Pro 2(hộp sạc thường)','3.-AirPods-2.png',2990000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Giác chuyển đổi MagSafe to MagSafe 2','3.-AirPods-2.png',590000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Dây đeo Watch 40mm Sport Loop','sport-loop-red.png',1250000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Cáp USB-C Charge Cable 1m','cap-type-c-1m.png',490000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Combo Chuột Phím iMac - Chính hãng Việt Nam','Chuot-BanPhim.jpg',3990000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'Dây đeo Apple Watch Nike Sport Loop','MX802.png',1250000,0,N'k co',GETDATE(),GETDATE(),0,0,1)
CREATE TABLE DungLuong(
	ID int IDENTITY(1,1) PRIMARY KEY,
	KichThuoc int,
)

CREATE TABLE SanPham_DungLuong(
	MaSanPham int,
	ID int, 
	SoLuongCon int,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID) REFERENCES DungLuong(ID) ON DELETE CASCADE ON UPDATE CASCADE
)


CREATE TABLE MauSac(
	ID int IDENTITY(1,1) PRIMARY KEY,
	TenMau nvarchar(30), 
	MaSanPham int,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE SanPham_MauSac(
	MaSanPham int,
	ID int, 
	SoLuongCon int,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(ID) REFERENCES DungLuong(ID) ON DELETE CASCADE ON UPDATE CASCADE
)



CREATE TABLE MENU(
	MaDanhMuc int IDENTITY(1,1) PRIMARY KEY,
	TenDanhMuc nvarchar(30),
	Link varchar(100)
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
	SoLuong int,
	FOREIGN KEY(MaHoaDon) REFERENCES HoaDon(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(MaHoaDon, MaSanPham)
)
