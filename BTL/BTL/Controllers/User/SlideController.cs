using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers
{
    public class SlideController : Controller
    {
        private static ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: Slide
        public static List<Slide> LayDanhSachSlide()
        {
            var list = db.Slides.Select(s => s);
            return list.ToList();
        }
    }
}