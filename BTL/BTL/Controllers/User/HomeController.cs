using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers
{
    public class HomeController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();
        public ActionResult Index()
        {
            List<Slide> listSlide = SlideController.LayDanhSachSlide();
            ViewBag.listSlide = listSlide;

            List<LoaiSanPham> listLoaiSanPham = LoaiSanPhamController.LayDanhSachLoaiSanPham();
            ViewBag.listLoaiSanPham = listLoaiSanPham;
            Session["menu"] = listLoaiSanPham;

            ThongTinShop thongTinShop = db.ThongTinShops.FirstOrDefault();
            Session["thongTinShop"] = thongTinShop;


            return View();
        }

        public ActionResult CheckTaiKhoan()
        {
            return View();
        }

        public ActionResult TinTuc()
        {
            return View();
        }
    }
}