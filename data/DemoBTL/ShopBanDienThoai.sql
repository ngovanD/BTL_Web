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
insert into TaiKhoan values('cuongmack@gmail.com',N'Nguyễn Cao Cường','123','admin')
insert into TaiKhoan values('NhungNguyen2k@gmail.com',N'Nguyễn Thuỳ Nhung','456','nhanVien')
insert into TaiKhoan values('SonNguyen@gmail.com',N'Nguyễn Thái Sơn','456','nhanVien')
insert into TaiKhoan values('TungNguyen@gmail.com',N'Nguyễn Sơn Tùng','456','nhanVien')
insert into TaiKhoan values('Nguyen@gmail.com',N'Hoàng Nguyên','456','nhanVien')

CREATE TABLE ThongTinShop(
	MaLienHeShop int PRIMARY KEY,
	DiaChi nvarchar(100),
	Email varchar(30),
	SoDienThoai varchar(10),
	TenShop nvarchar(300),
)
insert into ThongTinShop values('1',N'Nguyễn Như Quỳnh -Hưng Yên','0989478214','cuongmac@gmail.com',N'Shopduck')


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


--them tiep
insert into SanPham values(N'IPhone 11 Pro','iphone-11-pro-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone X','iphone-x-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XR','iphone-xr-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XS','iphone-xs-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone XS Max','iphone-xs-max-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 8 Plus','iphone-8-plus-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)
insert into SanPham values(N'IPhone 8','iphone-8-300x300.png',N'k co',GETDATE(),GETDATE(),0,0,1)

insert into SanPham values(N'Ipad gen 6 9.6 Inch','ipad-gen-6-9.7-inch-32gb.png',N'k co',GETDATE(),GETDATE(),0,0,2)
insert into SanPham values(N'Ipad mini','ipad-mini-6-4g-16gb.png',N'k co',GETDATE(),GETDATE(),0,0,2)
insert into SanPham values(N'Ipad air 4G','apple-ipad-air-4g-16gb.png',N'k co',GETDATE(),GETDATE(),0,0,2)


insert into SanPham values(N'MacBook Air','macbookair.png',N'k co',GETDATE(),GETDATE(),0,0,3)
insert into SanPham values(N'MacBook Siler ','mbp-silver.png',N'k co',GETDATE(),GETDATE(),0,0,3)
insert into SanPham values(N'MacBook Air Gold','macbook-air-gold.png',N'k co',GETDATE(),GETDATE(),0,0,3)
insert into SanPham values(N'IMac 2021','imac-2021-1.png',N'k co',GETDATE(),GETDATE(),0,0,3)

insert into SanPham values(N'Apple Watch series 6 40mm','apple-watch-series-6-40mm.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Apple Watch series 6 44mm','apple-watch-series-6.png',N'k co',GETDATE(),GETDATE(),0,0,4)
insert into SanPham values(N'Airpod 2','bluetooth-airpods-2-apple.png',N'k co',GETDATE(),GETDATE(),0,0,5)

insert into SanPham values(N'Apple TV','f.png',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Sạc Dự Phòng','RAVPower_Sạc_dự_phòng_5000mA.png',N'k co',GETDATE(),GETDATE(),0,0,6)
insert into SanPham values(N'Sạc Đôi Không dây kèm Loa','f.png',N'k co',GETDATE(),GETDATE(),0,0,6)

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

insert into SanPham_MauSac_DungLuong values(1, 1, 1, 26750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 2, 28750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 3, 32850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 1, 4, 36650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 1, 26750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 2, 28750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 3, 32850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 2, 4, 36650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 1, 26750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 2, 28750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 3, 32850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 3, 4, 36650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 1, 26750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 2, 28750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 3, 32850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(1, 4, 4, 36650000, 0, 100)

insert into SanPham_MauSac_DungLuong values(2, 1, 1, 31950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 2, 34450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 3, 38250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 1, 4, 46450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 1, 31950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 2, 34450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 3, 38250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 2, 4, 46450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 3, 1, 31950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 3, 2, 34450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 3, 3, 38250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 3, 4, 46450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 4, 1, 31950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 4, 2, 34450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 4, 3, 38250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(2, 4, 4, 46450000, 0, 100)

insert into SanPham_MauSac_DungLuong values(3, 1, 1, 28650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 1, 2, 34750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 1, 3, 39950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 2, 1, 28650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 2, 2, 34750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 2, 3, 39950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 3, 1, 28650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 3, 2, 34750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 3, 3, 39950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 4, 1, 28650000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 4, 2, 34750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(3, 4, 3, 39950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(4, 1, 1, 14950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 1, 2, 16950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 1, 3, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 2, 1, 14950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 2, 2, 16950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 2, 3, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 3, 1, 14950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 3, 2, 16950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(4, 3, 3, 19950000, 0, 100)


insert into SanPham_MauSac_DungLuong values(5, 1, 1, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 1, 2, 24150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 1, 3, 28150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 2, 1, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 2, 2, 24150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 2, 3, 28150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 3, 1, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 3, 2, 24150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 3, 3, 28150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 4, 1, 19950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 4, 2, 24150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(5, 4, 3, 28150000, 0, 100)

insert into SanPham_MauSac_DungLuong values(6, 1, 1, 25450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 1, 2, 26150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 1, 3, 28950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 2, 1, 25450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 2, 2, 26150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 2, 3, 28950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 3, 1, 25450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 3, 2, 26150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 3, 3, 28950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 4, 1, 25450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 4, 2, 26150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(6, 4, 3, 28950000, 0, 100)


insert into SanPham_MauSac_DungLuong values(7, 1, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 1, 2, 20150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 1, 3, 22590000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 2, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 2, 2, 20150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 2, 3, 22590000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 3, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 3, 2, 20150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 3, 3, 22590000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 4, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 4, 2, 20150000, 0, 100)
insert into SanPham_MauSac_DungLuong values(7, 4, 3, 22590000, 0, 100)

insert into SanPham_MauSac_DungLuong values(8, 1, 1, 11490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 1, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 1, 3, 12990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 2, 1, 11490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 2, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 2, 3, 12990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 3, 1, 11490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 3, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(8, 3, 3, 12990000, 0, 100)

insert into SanPham_MauSac_DungLuong values(9, 1, 1, 10490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 1, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 1, 3, 14490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 2, 1, 10490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 2, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 2, 3, 14490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 3, 1, 10490000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 3, 2, 12050000, 0, 100)
insert into SanPham_MauSac_DungLuong values(9, 3, 3, 14490000, 0, 100)

insert into SanPham_MauSac_DungLuong values(10, 1, 1, 10450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(10, 1, 2, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(10, 2, 1, 10450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(10, 2, 2, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(10, 3, 1, 10450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(10, 3, 2, 16750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(11, 1, 1, 14750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(11, 1, 2, 21950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(11, 2, 1, 14750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(12, 2, 2, 21950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(12, 3, 1, 14750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(12, 3, 2, 21950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(13, 1, 1, 21350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 1, 2, 29350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 1, 3, 36350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 1, 4, 54550000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 2, 1, 21350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 2, 2, 29350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 2, 3, 36350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(13, 2, 4, 54550000, 0, 100)

insert into SanPham_MauSac_DungLuong values(14, 1, 1, 27450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 1, 2, 34350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 1, 3, 42350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 1, 4, 59950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 2, 1, 27450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 2, 2, 34350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 2, 3, 42350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(14, 2, 4, 59950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(15, 1, 1, 16450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(15, 1, 2, 21850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(15, 2, 1, 16450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(15, 2, 2, 21850000, 0, 100)

insert into SanPham_MauSac_DungLuong values(16, 1, 1, 28790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(16, 1, 2, 29950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(16, 2, 1, 28790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(16, 2, 2, 29950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(17, 1, 1, 52750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(17, 1, 2, 64750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(17, 2, 1, 52750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(17, 2, 2, 64750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(18, 1, 1, 64750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(18, 1, 2, 90750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(18, 2, 1, 64750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(18, 2, 2, 90750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(19, 1, 1, 31450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(19, 1, 2, 36950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(19, 2, 1, 31450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(19, 2, 2, 36950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(20, 1, 1, 24550000, 0, 100)
insert into SanPham_MauSac_DungLuong values(20, 1, 2, 52000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(20, 2, 1, 24550000, 0, 100)
insert into SanPham_MauSac_DungLuong values(20, 2, 2, 52000000, 0, 100)


insert into SanPham_MauSac_DungLuong values(21, 1, 1, 25250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 1, 2, 35450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 2, 1, 25250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 2, 2, 35450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 3, 1, 25250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 3, 2, 35450000, 0, 100)

insert into SanPham_MauSac_DungLuong values(21, 3, 1, 31220000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 3, 2, 42190000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 4, 1, 31220000, 0, 100)
insert into SanPham_MauSac_DungLuong values(21, 4, 2, 42190000, 0, 100)

insert into SanPham_MauSac_DungLuong values(22, 3, 1, 17450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(22, 3, 2, 28350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(22, 4, 1, 17450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(22, 4, 2, 28350000, 0, 100)

insert into SanPham_MauSac_DungLuong values(23, 3, 1, 10950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(23, 3, 2, 15750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(23, 4, 1, 10950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(23, 4, 2, 15750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(24, 3, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(24, 3, 2, 20750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(24, 4, 1, 18450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(24, 4, 2, 20750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(25, 2, 1, 9350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(25, 2, 2, 11950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(25, 3, 1, 9350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(25, 3, 2, 11950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(25, 4, 1, 9350000, 0, 100)
insert into SanPham_MauSac_DungLuong values(25, 4, 2, 11950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(26, 3, 1, 16950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(26, 3, 2, 18950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(26, 2, 1, 16950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(26, 2, 2, 18950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(27, 3, 1, 6850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(27, 3, 2, 8950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(27, 4, 1, 6850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(27, 4, 2, 8950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(28, 2, 1, 8250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(28, 2, 2, 8450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(28, 3, 1, 8250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(28, 3, 2, 8450000, 0, 100)

insert into SanPham_MauSac_DungLuong values(29, 3, 1, 7250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(29, 3, 2, 8450000, 0, 100)
insert into SanPham_MauSac_DungLuong values(29, 4, 1, 7250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(29, 4, 2, 8450000, 0, 100)

insert into SanPham_MauSac_DungLuong values(30, 1, 1, 4990000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(31, 1, 1, 11990000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(32, 1, 1, 5490000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(33, 1, 1, 5190000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(34, 1, 1, 2990000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(35, 1, 1, 590000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(38, 1, 1,  5290000, 0, 100)

insert into SanPham_MauSac_DungLuong values(37, 1, 1, 690000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(36, 1, 1, 1290000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(39, 1, 1, 490000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(40, 1, 1, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 1, 2, 17700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 1, 3, 18850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 1, 4, 20750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 2, 1, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 2, 2, 17700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 2, 3, 18850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 2, 4, 20750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 3, 1, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 3, 2, 17700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 3, 3, 18850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 3, 4, 20750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 4, 1, 16750000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 4, 2, 17700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 4, 3, 18850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(40, 4, 4, 20750000, 0, 100)

insert into SanPham_MauSac_DungLuong values(41, 1, 1, 11790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 1, 2, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 1, 3, 13000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 1, 4, 14600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 2, 1, 11790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 2, 2, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 2, 3, 13000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 2, 4, 14600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 3, 1, 11790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 3, 2, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 3, 3, 13000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 3, 4, 14600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 4, 1, 11790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 4, 2, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 4, 3, 13000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(41, 4, 4, 14600000, 0, 100)

insert into SanPham_MauSac_DungLuong values(42, 1, 1, 11990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 1, 2, 12800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 1, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 1, 4, 16600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 2, 1, 11990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 2, 2, 12800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 2, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 2, 4, 16600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 3, 1, 11990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 3, 2, 12800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 3, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 3, 4, 16600000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 4, 1, 11990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 4, 2, 12800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 4, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(42, 4, 4, 16600000, 0, 100)

insert into SanPham_MauSac_DungLuong values(43, 1, 1, 9700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 1, 2, 10800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 1, 3, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 1, 4, 13400000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 2, 1, 9700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 2, 2, 10800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 2, 3, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 2, 4, 13400000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 3, 1, 9700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 3, 2, 10800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 3, 3, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 3, 4, 13400000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 4, 1, 9700000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 4, 2, 10800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 4, 3, 12500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(43, 4, 4, 13400000, 0, 100)

insert into SanPham_MauSac_DungLuong values(44, 1, 1, 1100000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 1, 2, 12900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 1, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 1, 4, 14900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 2, 1, 1100000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 2, 2, 12900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 2, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 2, 1, 1100000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 3, 2, 12900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 3, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 3, 1, 1100000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 3, 2, 12900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 4, 3, 13500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 4, 4, 14900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 4, 4, 14900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(44, 4, 4, 14900000, 0, 100)

insert into SanPham_MauSac_DungLuong values(45, 1, 1, 7890000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 1, 2, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 1, 3, 9000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 1, 4, 9880000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 2, 1, 7890000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 2, 2, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 2, 3, 9000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 2, 4, 9880000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 3, 1, 7890000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 3, 2, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 3, 3, 9000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 3, 4, 9880000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 4, 1, 7890000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 4, 2, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 4, 3, 9000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(45, 4, 4, 9880000, 0, 100)

insert into SanPham_MauSac_DungLuong values(46, 1, 1, 6500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 1, 2, 7000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 1, 3, 7500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 1, 4, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 2, 1, 6500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 2, 2, 7000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 2, 3, 7500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 2, 4, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 3, 1, 6500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 3, 2, 7000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 3, 3, 7500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 3, 4, 8200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 4, 1, 6500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 4, 2, 7000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 4, 3, 7500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(46, 4, 4, 8200000, 0, 100)

insert into SanPham_MauSac_DungLuong values(47, 1, 1, 1049000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 1, 2, 1249000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 2, 1, 1049000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 2, 2, 1249000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 3, 1, 1049000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 3, 2, 1249000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 4, 1, 1049000, 0, 100)
insert into SanPham_MauSac_DungLuong values(47, 4, 2, 1249000, 0, 100)

insert into SanPham_MauSac_DungLuong values(48, 1, 1, 1250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 1, 2, 1499000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 2, 1, 1250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 2, 2, 1499000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 3, 1, 1250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 3, 2, 1499000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 4, 1, 1250000, 0, 100)
insert into SanPham_MauSac_DungLuong values(48, 4, 2, 1499000, 0, 100)

insert into SanPham_MauSac_DungLuong values(49, 1, 1, 17790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 1, 2, 19790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 2, 1, 17790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 2, 2, 19790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 3, 1, 17790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 3, 2, 19790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 4, 1, 17790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(49, 4, 2, 19790000, 0, 100)

insert into SanPham_MauSac_DungLuong values(50, 1, 1, 18900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 1, 2, 22790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 2, 1, 18900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 2, 2, 22790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 3, 1, 18900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 3, 2, 22790000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 4, 1, 18900000, 0, 100)
insert into SanPham_MauSac_DungLuong values(50, 4, 2, 22790000, 0, 100)

insert into SanPham_MauSac_DungLuong values(51, 1, 1, 23990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(51, 1, 2, 25990000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(51, 2, 1, 23990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(51, 2, 2, 25990000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(52, 1, 1, 32450000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 1, 2, 35990000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 2, 1, 40990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 2, 2, 47950000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 3, 1, 32450000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 3, 2, 35990000 , 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 4, 1, 40990000, 0, 100)
insert into SanPham_MauSac_DungLuong values(52, 4, 2, 47950000 , 0, 100)

insert into SanPham_MauSac_DungLuong values(53, 1, 1, 94500000, 0, 100)
insert into SanPham_MauSac_DungLuong values(53, 1, 2, 99000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(53, 2, 1, 11200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(53, 2, 2, 12950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(54, 1, 1, 9850000, 0, 100)
insert into SanPham_MauSac_DungLuong values(54, 1, 2, 10000000, 0, 100)
insert into SanPham_MauSac_DungLuong values(54, 2, 1, 12200000, 0, 100)
insert into SanPham_MauSac_DungLuong values(54, 2, 2, 13950000, 0, 100)

insert into SanPham_MauSac_DungLuong values(55, 1, 1, 1800000, 0, 100)
insert into SanPham_MauSac_DungLuong values(55, 1, 2, 2300000, 0, 100)

insert into SanPham_MauSac_DungLuong values(56, 1, 2, 5950000, 0, 100)
insert into SanPham_MauSac_DungLuong values(57, 1, 2, 499000, 0, 100)
insert into SanPham_MauSac_DungLuong values(57, 1, 2, 1190000, 0, 100)

select * from SanPham_MauSac_DungLuong



select * from SanPham_MauSac_DungLuong

--drop table LoaiSanPham

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
insert into ThongTinLienHe_KhachHang values(N'Hồ Cao Cường',N'Nguyễn Như Quỳnh -Hưng Yên','0989478214',N'k có')
-- k them
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
--k them
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

