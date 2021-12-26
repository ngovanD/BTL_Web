using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers.User
{
    public class GioHangController : Controller
    {
        ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: GioHang
        public ActionResult GioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        public ActionResult ThemGioHang(int maSanPham, int id_MauSac, int id_DungLuong, string strURL)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanPham = lstGioHang.Find(n => n.MaSanPham == maSanPham && n.Id_MauSac == id_MauSac && n.Id_DungLuong == id_DungLuong);
            if (sanPham == null)
            {
                sanPham = new GioHang(maSanPham, id_MauSac, id_DungLuong);
                lstGioHang.Add(sanPham);
            }
            else
            {
                sanPham.SoLuong++;
            }
            ViewBag.TongTienGioHang = TongTien();

            return Redirect(strURL);
        }

        public ActionResult XoaSanPham(int maSanPham, int id_MauSac, int id_DungLuong, string strURL)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.MaSanPham == maSanPham && n.Id_MauSac == id_MauSac && n.Id_DungLuong == id_DungLuong);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.MaSanPham == maSanPham && n.Id_MauSac == id_MauSac && n.Id_DungLuong == id_DungLuong);
            }

            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }

            return Redirect(strURL);
        }


        public ActionResult CapNhatGioHang(int maSanPham, int id_MauSac, int id_DungLuong, FormCollection f)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.MaSanPham == maSanPham && n.Id_MauSac == id_MauSac && n.Id_DungLuong == id_DungLuong);

            if (sanpham != null)
            {
                sanpham.SoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.SoLuong);
            }
            return iTongSoLuong;
        }

        private int TongTien()
        {
            int TongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                TongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return TongTien;
        }

        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "TaiKhoan");
            }

            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGioHang);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            var hoTen = collection["HoTen"];
            var diaChi = collection["DiaChi"];
            var soDienThoai = collection["SoDienThoai"];
            var ghiChu = collection["GhiChu"];

            ThongTinLienHe_KhachHang tt = new ThongTinLienHe_KhachHang();
            tt.HoTen = hoTen;
            tt.DiaChi = diaChi;
            tt.SoDienThoai = soDienThoai;
            tt.GhiChu = ghiChu;

            db.ThongTinLienHe_KhachHang.Add(tt);
            db.SaveChanges();

            HoaDon ddh = new HoaDon();
            TaiKhoan kh = (TaiKhoan)Session["Taikhoan"];
            List<GioHang> gh = LayGioHang();
            ddh.ID = kh.ID;
            ddh.NgayLapHoaDon = DateTime.Now;
            ddh.TrangThai = "Chờ xác nhận";
            ddh.MaThongTinLienHe_KhachHang = tt.MaThongTinLienHe_KhachHang;
            ddh.TongTien = TongTien();
            db.HoaDons.Add(ddh);
            db.SaveChanges();

            foreach (var item in gh)
            {
                ChiTietHoaDon ctdh = new ChiTietHoaDon();
                ctdh.MaHoaDon = ddh.MaHoaDon;
                ctdh.MaSanPham = item.MaSanPham;
                ctdh.ID_MauSac = item.Id_MauSac;
                ctdh.ID_DungLuong = item.Id_DungLuong;
                ctdh.SoLuong = item.SoLuong;
                db.ChiTietHoaDons.Add(ctdh);
            }

            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");
        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
    }
}