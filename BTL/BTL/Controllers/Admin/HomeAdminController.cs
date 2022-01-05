using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers.Admin
{
    public class HomeAdminController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();
        public ActionResult Index()
        {
            var chiTietHoaDons = db.ChiTietHoaDons.Select(c =>c).ToList();
            ViewBag.TongSanPhamBan = chiTietHoaDons.Sum(c => c.SoLuong);

            var hoaDons = db.HoaDons.Select(h => h).ToList();
            ViewBag.TongTienBan = hoaDons.Sum(h => h.TongTien);

            ViewBag.TongHoaDonBan = hoaDons.Count();

            var taiKhoans = db.TaiKhoans.Select(t => t).ToList();
            ViewBag.SoUser = taiKhoans.Count();

            var SanPham = from c in db.ChiTietHoaDons
                    group c by c.MaSanPham into tem
                    select new
                    {
                        MaSanPham = tem.Key,
                        SoLuong = tem.ToList().Sum(t => t.SoLuong)
                    };

            var danhSachSanPham = from s in SanPham
                                  join sp in db.SanPhams on s.MaSanPham equals sp.MaSanPham
                                  select new SanPhamDto{ 
                                     MaSanPham = s.MaSanPham,
                                     TenSanPham = sp.TenSanPham,
                                     SoLuong = (int)s.SoLuong
                                  };
            ViewBag.Top3 = danhSachSanPham.Take(3).ToList<SanPhamDto>();

            return View();
        }

        public ActionResult DangNhap(FormCollection form)
        {
            string email = form["Email"].ToString();
            string matKhau = form["MatKhau"].ToString();
            TaiKhoan taiKhoan = new TaiKhoan();
            taiKhoan.Email = email;

            bool check = db.TaiKhoans.Any(t=>t.Email == email && t.MatKhau==matKhau&&t.LoaiTaiKhoan=="Admin");
            if (check)
            {
                Session["Admin"] = taiKhoan;
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.TrangThai = "Kiểm tra lại email và mật khẩu";
                return RedirectToAction("Index");
            }

        }

        public ActionResult DangXuat()
        {
            Session.Remove("Admin");
            return RedirectToAction("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}