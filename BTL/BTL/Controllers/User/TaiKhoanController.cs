using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers
{
    public class TaiKhoanController : Controller
    {
        private static ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: TaiKhoan
        public static Boolean KiemTraTaiKhoan(TaiKhoan taiKhoan)
        {
            bool check = db.TaiKhoans.Any(tk => tk.Email == taiKhoan.Email && tk.MatKhau == taiKhoan.MatKhau);
            return check;
        }

        public static TaiKhoan LayTaiKhoanTheoEmail(string email)
        {
            var taiKhoan = db.TaiKhoans.SingleOrDefault(tk => tk.Email == email);
            return taiKhoan;
        }

        public static void TaoTaiKhoanUser(TaiKhoan taiKhoan)
        {
            taiKhoan.LoaiTaiKhoan = "User";
            db.TaiKhoans.Add(taiKhoan);
            db.SaveChanges();
        }

        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection form)
        {
            string email = form["Email"].ToString();
            string matKhau = form["MatKhau"].ToString();
            TaiKhoan taiKhoan = new TaiKhoan();
            taiKhoan.Email = email;
            taiKhoan.MatKhau = matKhau;

            bool check = KiemTraTaiKhoan(taiKhoan);
            if(check)
            {
                taiKhoan = LayTaiKhoanTheoEmail(email);
                Session["taiKhoan"] = taiKhoan;
                return Redirect("/Home");
            }
            else
            {
                ViewBag.TrangThai = "Kiểm tra lại email và mật khẩu";
                return View();
            }
            
        }


        public ActionResult DangKy()
        {
            return View();
        }


        [HttpPost]
        public ActionResult DangKy(FormCollection form)
        {
            string email = form["Email"].ToString();
            string hoTen = form["HoTen"].ToString();
            string matKhau = form["MatKhau"].ToString();
            string matKhauXacNhan = form["MatKhauXacNhan"].ToString();

            if(!matKhau.Equals(matKhauXacNhan))
            {
                ViewBag.TrangThai = "Mật khẩu không trùng nhau !!!";
                return View();
            }

            TaiKhoan taiKhoan = LayTaiKhoanTheoEmail(email);

            if(taiKhoan != null)
            {
                ViewBag.TrangThai = "Email này đã được dùng !!!";
                return View();
            }
            taiKhoan = new TaiKhoan();
            taiKhoan.Email = email;
            taiKhoan.HoTen = hoTen;
            taiKhoan.MatKhau = matKhau;

            TaoTaiKhoanUser(taiKhoan);

            Session["taiKhoan"] = taiKhoan;
            return Redirect("/Home");
        }

        public ActionResult DangXuat()
        {
            Session.Remove("taiKhoan");
            return Redirect("/Home");
        }
    }
}