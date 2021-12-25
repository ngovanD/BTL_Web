using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL.Models;

namespace BTL.Controllers.Admin
{
    public class HoaDonAdminController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();

        // GET: HoaDons
        public ActionResult Index()
        {
            var hoaDons = db.HoaDons.Include(h => h.TaiKhoan).Include(h => h.ThongTinLienHe_KhachHang);
            return View(hoaDons.ToList());
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
            ViewBag.MaThongTinLienHe_KhachHang = new SelectList(db.ThongTinLienHe_KhachHang, "MaThongTinLienHe_KhachHang", "HoTen", hoaDon.MaThongTinLienHe_KhachHang);
            return View(hoaDon);
        }

        // POST: HoaDons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHoaDon,TongTien,NgayLapHoaDon,TrangThai,MaThongTinLienHe_KhachHang,ID")] HoaDon hoaDon)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(hoaDon).State = EntityState.Modified;
                    db.SaveChanges();

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.Error = "Lỗi Không sửa  được" + ex.Message;
                ViewBag.ID = new SelectList(db.TaiKhoans, "ID", "Email", hoaDon.ID);
                ViewBag.MaThongTinLienHe_KhachHang = new SelectList(db.ThongTinLienHe_KhachHang, "MaThongTinLienHe_KhachHang", "HoTen", hoaDon.MaThongTinLienHe_KhachHang);
                return View(hoaDon);
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