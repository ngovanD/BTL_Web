using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL.Models;

namespace BTL.Models
{
    public class GioHang
    {
        ShopDienThoaiContext db = new ShopDienThoaiContext();
        private int maSanPham;
        private string tenSanPham;
        private string hinhAnh;

        private int id_MauSac;
        private string tenMau;

        private int id_DungLuong;
        private int kichThuoc;

        private int gia;
        private int soLuong;



        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
        public string TenSanPham { get => tenSanPham; set => tenSanPham = value; }
        public string HinhAnh { get => hinhAnh; set => hinhAnh = value; }
        public int Id_MauSac { get => id_MauSac; set => id_MauSac = value; }
        public string TenMau { get => tenMau; set => tenMau = value; }
        public int Id_DungLuong { get => id_DungLuong; set => id_DungLuong = value; }
        public int KichThuoc { get => kichThuoc; set => kichThuoc = value; }
        public int Gia { get => gia; set => gia = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }


        public int ThanhTien {get{ return soLuong * gia; } }

        public GioHang(int maSanPham, int id_MauSac, int id_DungLuong)
        {
            MaSanPham = maSanPham;
            Id_MauSac = id_MauSac;
            Id_DungLuong = id_DungLuong;

            SanPham sanPham = db.SanPhams.SingleOrDefault(sp => sp.MaSanPham == maSanPham);
            MauSac maSac = db.MauSacs.SingleOrDefault(ms => ms.ID_MauSac == Id_MauSac);
            DungLuong dungLuong = db.DungLuongs.SingleOrDefault(ms => ms.ID_DungLuong == Id_DungLuong);
            SanPham_MauSac_DungLuong spmd = db.SanPham_MauSac_DungLuong.SingleOrDefault(s => s.MaSanPham == maSanPham && s.ID_MauSac == id_MauSac && s.ID_DungLuong == id_DungLuong);

            TenSanPham = sanPham.TenSanPham;
            HinhAnh = sanPham.HinhAnh;
            TenMau = maSac.TenMau;
            kichThuoc = (int)dungLuong.KichThuoc;

            gia = (int)spmd.Gia;
            soLuong = 1;
        }
    }
}