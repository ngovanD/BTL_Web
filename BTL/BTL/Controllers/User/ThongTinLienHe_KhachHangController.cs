using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers.User
{
    public class ThongTinLienHe_KhachHangController : Controller
    {
        // GET: ThongTinLienHe_KhachHang
        private static ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: Slide
        public static bool TaoThongTinLienHeKhachHang(ThongTinLienHe_KhachHang tt)
        {
            return true;
        }
    }
}