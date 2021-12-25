using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL.Models;

namespace BTL.Controllers.Admin
{
    public class ThongTinShopAdminController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();

        // GET: ThongTinShops
        public ActionResult Index()
        {
            return View(db.ThongTinShops.ToList());
        }

        // GET: ThongTinShops/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTinShop thongTinShop = db.ThongTinShops.Find(id);
            if (thongTinShop == null)
            {
                return HttpNotFound();
            }
            return View(thongTinShop);
        }

        // GET: ThongTinShops/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ThongTinShops/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLienHeShop,DiaChi,Email,SoDienThoai,TenShop")] ThongTinShop thongTinShop)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.ThongTinShops.Add(thongTinShop);
                    db.SaveChanges();

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không tạo mới được." + ex.Message;
                return View(thongTinShop);
            }



        }

        // GET: ThongTinShops/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTinShop thongTinShop = db.ThongTinShops.Find(id);
            if (thongTinShop == null)
            {
                return HttpNotFound();
            }
            return View(thongTinShop);
        }

        // POST: ThongTinShops/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLienHeShop,DiaChi,Email,SoDienThoai,TenShop")] ThongTinShop thongTinShop)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(thongTinShop).State = EntityState.Modified;
                    db.SaveChanges();

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.Error = "Lỗi không sửa được." + ex.Message;
                return View(thongTinShop);
            }


        }

        // GET: ThongTinShops/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTinShop thongTinShop = db.ThongTinShops.Find(id);
            if (thongTinShop == null)
            {
                return HttpNotFound();
            }
            return View(thongTinShop);
        }

        // POST: ThongTinShops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ThongTinShop thongTinShop = db.ThongTinShops.Find(id);
            try
            {
                db.ThongTinShops.Remove(thongTinShop);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không xóa được" + ex.Message;
                return View("Delete", thongTinShop);
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