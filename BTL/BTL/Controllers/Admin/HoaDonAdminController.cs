using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL.Models;
using PagedList;

namespace BTL.Controllers.Admin
{
    public class HoaDonAdminController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();

        // GET: HoaDons
        public ActionResult Index(int? page)
        {
            var hoaDons = db.HoaDons.Include(h => h.TaiKhoan).Include(h => h.ThongTinLienHe_KhachHang);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(hoaDons.OrderBy(h=>h.MaHoaDon).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult XacNhan(int maHoaDon)
        {
            var hoaDon = db.HoaDons.Where(h=> h.MaHoaDon == maHoaDon).FirstOrDefault();
            hoaDon.TrangThai = "Xác nhận";
            db.SaveChanges();
            return RedirectToAction("Details", new { id = maHoaDon });
        }

        public ActionResult Huy(int maHoaDon)
        {
            var hoaDon = db.HoaDons.Where(h => h.MaHoaDon == maHoaDon).FirstOrDefault();
            hoaDon.TrangThai = "Hủy";
            db.SaveChanges();
            return RedirectToAction("Details", new { id = maHoaDon });
        }

        // GET: HoaDons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            var thongTinLienHeKhachHang = db.ThongTinLienHe_KhachHang.SingleOrDefault(t => t.MaThongTinLienHe_KhachHang == hoaDon.MaThongTinLienHe_KhachHang);
            ViewBag.thongTinLienHeKhachHang = thongTinLienHeKhachHang;

            var listSanPham = from ct in db.ChiTietHoaDons
                              join sp in db.SanPhams on ct.MaSanPham equals sp.MaSanPham
                              join ms in db.MauSacs on ct.ID_MauSac equals ms.ID_MauSac
                              join d in db.DungLuongs on ct.ID_DungLuong equals d.ID_DungLuong
                              where ct.MaHoaDon == hoaDon.MaHoaDon
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

            return View(hoaDon);
        }

        // GET: HoaDons/Create
        public ActionResult Create()
        {
            ViewBag.ID = new SelectList(db.TaiKhoans, "ID", "Email");
            ViewBag.MaThongTinLienHe_KhachHang = new SelectList(db.ThongTinLienHe_KhachHang, "MaThongTinLienHe_KhachHang", "HoTen");
            return View();
        }

        // POST: HoaDons/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHoaDon,TongTien,NgayLapHoaDon,TrangThai,MaThongTinLienHe_KhachHang,ID")] HoaDon hoaDon)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    db.HoaDons.Add(hoaDon);
                    db.SaveChanges();

                }
                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi Không tạo mới được" + ex.Message;
                ViewBag.ID = new SelectList(db.TaiKhoans, "ID", "Email", hoaDon.ID);
                ViewBag.MaThongTinLienHe_KhachHang = new SelectList(db.ThongTinLienHe_KhachHang, "MaThongTinLienHe_KhachHang", "HoTen", hoaDon.MaThongTinLienHe_KhachHang);
                return View(hoaDon);
            }


        }

        // GET: HoaDons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID = new SelectList(db.TaiKhoans, "ID", "Email", hoaDon.ID);
            ViewBag.ThongTinKhachhang = db.ThongTinLienHe_KhachHang.Where(t => t.MaThongTinLienHe_KhachHang == hoaDon.MaThongTinLienHe_KhachHang).FirstOrDefault();
            return View(hoaDon);
        }

        // POST: HoaDons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HoTen, SoDienThoai, DiaChi, GhiChu")] ThongTinLienHe_KhachHang thongTinLienHe_KhachHang, [Bind(Include = "MaHoaDon")] HoaDon hoaDon)
        {
            HoaDon hoaDonCanTim = db.HoaDons.Find(hoaDon.MaHoaDon);
            try
            {
                if (ModelState.IsValid)
                {
                    thongTinLienHe_KhachHang.MaThongTinLienHe_KhachHang = (int)hoaDonCanTim.MaThongTinLienHe_KhachHang;
                    db.Entry(thongTinLienHe_KhachHang).State = EntityState.Modified;
                    db.SaveChanges();

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.Error = "Lỗi Không sửa  được" + ex.Message;
                ViewBag.ThongTinKhachHang = thongTinLienHe_KhachHang;
                return View(hoaDonCanTim);
            }


        }

        // GET: HoaDons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        // POST: HoaDons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            try
            {
                db.HoaDons.Remove(hoaDon);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không xóa được." + ex.Message;
                return View("Delete", hoaDon);
            }

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}