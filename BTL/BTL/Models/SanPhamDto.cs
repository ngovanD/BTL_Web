using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL.Models
{
    public class SanPhamDto
    {
        private int maSanPham;
        private string tenSanPham;
        private string hinhAnh;
        private string moTa;
        private DateTime ngayTao;
        private DateTime ngayCapNhat;
        private bool sanPhamMoi;
        private bool noiBat;

        private int id_MauSac;
        private string tenMau;

        private int id_DungLuong;
        private int kichThuoc;

        private int gia;
        private int giaGiam;
        private int soLuongCon;

        private int soLuong;

        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
        public string TenSanPham { get => tenSanPham; set => tenSanPham = value; }
        public string HinhAnh { get => hinhAnh; set => hinhAnh = value; }
        public string MoTa { get => moTa; set => moTa = value; }
        public DateTime NgayTao { get => ngayTao; set => ngayTao = value; }
        public DateTime NgayCapNhat { get => ngayCapNhat; set => ngayCapNhat = value; }
        public bool SanPhamMoi { get => sanPhamMoi; set => sanPhamMoi = value; }
        public bool NoiBat { get => noiBat; set => noiBat = value; }
        public int Id_MauSac { get => id_MauSac; set => id_MauSac = value; }
        public string TenMau { get => tenMau; set => tenMau = value; }
        public int Id_DungLuong { get => id_DungLuong; set => id_DungLuong = value; }
        public int KichThuoc { get => kichThuoc; set => kichThuoc = value; }
        public int Gia { get => gia; set => gia = value; }
        public int GiaGiam { get => giaGiam; set => giaGiam = value; }
        public int SoLuongCon { get => soLuongCon; set => soLuongCon = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public int ThanhTien { get => soLuong*Gia;}
    }
}