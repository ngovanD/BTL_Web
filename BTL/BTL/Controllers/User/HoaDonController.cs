using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL.Models;

namespace BTL.Controllers.User
{
    public class HoaDonController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: HoaDon
        public ActionResult DanhSachHoaDon(int id)
        {
            var listHoaDon = db.HoaDons.Where(h => h.ID == id).ToList();
            ViewBag.listHoaDon = listHoaDon;
            return View();
        }

        public ActionResult ChiTietHoaDon(int maHoaDon)
        {
            var hoaDon = db.HoaDons.SingleOrDefault(h => h.MaHoaDon == maHoaDon);
            ViewBag.hoaDon = hoaDon;

            var thongTinLienHeKhachHang = db.ThongTinLienHe_KhachHang.SingleOrDefault(t => t.MaThongTinLienHe_KhachHang == hoaDon.MaThongTinLienHe_KhachHang);
            ViewBag.thongTinLienHeKhachHang = thongTinLienHeKhachHang;

            var listSanPham = from ct in db.ChiTietHoaDons
                              join sp in db.SanPhams on ct.MaSanPham equals sp.MaSanPham
                              join ms in db.MauSacs on ct.ID_MauSac equals ms.ID_MauSac
                              join d in db.DungLuongs on ct.ID_DungLuong equals d.ID_DungLuong
                              where ct.MaHoaDon == maHoaDon
                              select new SanPhamDto
                              {
                                  TenSanPham = sp.TenSanPham,
                                  HinhAnh = sp.HinhAnh,
                                  TenMau = ms.TenMau,
                                  KichThuoc = (int)d.KichThuoc,
                                  SoLuong = (int)ct.SoLuong,
                                  Gia = (int)db.SanPham_MauSac_DungLuong
                                               .FirstOrDefault(n => n.MaSanPham == sp.MaSanPham 
                                               && n.ID_MauSac == ms.ID_MauSac && n.ID_DungLuong == d.ID_DungLuong).Gia
                              };
            ViewBag.listSanPham = listSanPham.ToList();
            return View();
        }
    }
}