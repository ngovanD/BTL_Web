using BTL.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        private static ShopDienThoaiContext db = new ShopDienThoaiContext();
        // GET: Slide
        public static List<LoaiSanPham> LayDanhSachLoaiSanPham()
        {
            var list = db.LoaiSanPhams.Select(l => l);
            return list.ToList();
        }

        public static LoaiSanPham LayLoaiSanPham(int maLoaiSanPham)
        {
            var list = db.LoaiSanPhams.Where(l => l.MaLoaiSanPham == maLoaiSanPham);
            return list.ToList().SingleOrDefault();
        }

       /* public ActionResult TrangTheoTungSanPham(int maLoaiSanPham, int? page)
        {
            List<SanPhamDto> list = SanPhamController.LayDanhSachSanPhamTheoLoai(maLoaiSanPham);
            LoaiSanPham loaiSanPham = LayLoaiSanPham(maLoaiSanPham);
            ViewBag.loaiSanPham = loaiSanPham;

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.listSanPhamTheoLoai = list.ToPagedList(pageNumber, pageSize);

            return View();
        }*/

        public ActionResult TrangTheoTungSanPham(int maLoaiSanPham, string Gia1, string Gia2,
            string currentFilter1, string currentFilter2, int? page)
        {
            if (Gia1 != null && Gia2 != null)
            {
                page = 1;
            }
            else
            {
                Gia1 = currentFilter1;
                Gia2 = currentFilter2;
            }
            ViewBag.currentFilter1 = Gia1;
            ViewBag.currentFilter2 = Gia2;

            int gia1 = 0;
            int gia2 = 0;
            bool check1 = int.TryParse(Gia1, out gia1);
            bool check2 = int.TryParse(Gia2, out gia2);


            List<SanPhamDto> list = SanPhamController.LayDanhSachSanPhamTheoLoai(maLoaiSanPham);
            if (check1 && check2)
            {
                list = list.Where(p => p.Gia >= gia1 && p.Gia <= gia2).ToList();
            }
            LoaiSanPham loaiSanPham = LayLoaiSanPham(maLoaiSanPham);
            ViewBag.loaiSanPham = loaiSanPham;

            int pageSize = 6;
            int pageNumber = (page ?? 1);
            ViewBag.listSanPhamTheoLoai = list.ToPagedList(pageNumber, pageSize);

            return View();
        }
    }
}