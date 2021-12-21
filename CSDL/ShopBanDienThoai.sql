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


CREATE TABLE SanPham(
	MaSanPham int IDENTITY(1,1) PRIMARY KEY,
	TenSanPham nvarchar(200),
	HinhAnh varchar(30),
	Gia int,
	GiaGiam int,
	SoLuongCon int,
	MoTa nvarchar(1000),
	NgayTao datetime,
	NgayCapNhat datetime,
	SanPhamMoi BIT,
	NoiBat BIT,
	MaLoaiSanPham int,
	FOREIGN KEY(MaLoaiSanPham) REFERENCES LoaiSanPham(MaLoaiSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)

///

CREATE TABLE MENU(
	MaDanhMuc int IDENTITY(1,1) PRIMARY KEY,
	TenDanhMuc nvarchar(30),
	Link varchar(100)
)