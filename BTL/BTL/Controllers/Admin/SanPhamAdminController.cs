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
    public class SanPhamAdminController : Controller
    {
        private ShopDienThoaiContext db = new ShopDienThoaiContext();

        // GET: SanPhams
        public ActionResult Index(int? page)
        {

            var sanPhams = db.SanPhams.Include(s => s.LoaiSanPham);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(sanPhams.OrderBy(h => h.MaSanPham).ToPagedList(pageNumber, pageSize));
        }

        // GET: SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            var list = from smd in db.SanPham_MauSac_DungLuong
                       join d in db.DungLuongs on smd.ID_DungLuong equals d.ID_DungLuong
                       join m in db.MauSacs on smd.ID_MauSac equals m.ID_MauSac
                       where smd.MaSanPham == sanPham.MaSanPham
                       select new SanPhamKichThuocMauSacDTO
                       {
                           MaSanPham = smd.MaSanPham,
                           ID_DungLuong = d.ID_DungLuong,
                           ID_MauSac = m.ID_MauSac,
                           Gia = (int)smd.Gia,
                           SoLuongCon = (int)smd.SoLuongCon,
                           KichThuoc = (int)d.KichThuoc,
                           TenMau = m.TenMau 
                       };
            ViewBag.DanhSachDungLuongMauSac = list.ToList();
            return View(sanPham);
        }

        // GET: SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
            ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSanPham,TenSanPham,HinhAnh,MoTa,NgayTao,NgayCapNhat,SanPhamMoi,NoiBat,MaLoaiSanPham")] SanPham sanPham,
            [Bind(Include = "ID_DungLuong, ID_MauSac, Gia, SoLuongCon")] SanPham_MauSac_DungLuong smd)
        {
            if (smd.Gia == null || smd.SoLuongCon == null)
            {
                ViewBag.Error = "Bạn phải điền cả giá và số lượng";
                ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
                ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
                ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
                return View(sanPham);
            }
            try
            {
                if (ModelState.IsValid)
                {
                    sanPham.HinhAnh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadFile = Server.MapPath("~/wwwroot/images/sanpham/" + FileName);
                        f.SaveAs(UploadFile);
                        sanPham.HinhAnh = FileName;
                    }
                    sanPham.NgayTao = DateTime.Now;
                    sanPham.NgayCapNhat = DateTime.Now;
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();

                    smd.MaSanPham = sanPham.MaSanPham;

                    db.SanPham_MauSac_DungLuong.Add(smd);
                    db.SaveChanges();

                }
                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không tạo mới được." + ex.Message;
                ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
                ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
                ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
                return View(sanPham);
            }
        }

        // GET: SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
            ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
            ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
            return View(sanPham);
        }

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSanPham,TenSanPham,HinhAnh,MoTa,NgayTao,NgayCapNhat,SanPhamMoi,NoiBat,MaLoaiSanPham")] SanPham sanPham,
            [Bind(Include = "ID_DungLuong, ID_MauSac, Gia, SoLuongCon")] SanPham_MauSac_DungLuong smd)
        {
            if (smd.Gia == null || smd.SoLuongCon == null)
            {
                ViewBag.Error = "Bạn phải điền cả giá và số lượng";
                ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
                ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
                ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
                return View(sanPham);
            }
            try
            {
                if (ModelState.IsValid)
                {
                    SanPham sp = db.SanPhams.Where(s => s.MaSanPham == sanPham.MaSanPham).FirstOrDefault();
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadFile = Server.MapPath("~/wwwroot/images/sanpham/" + FileName);
                        f.SaveAs(UploadFile);
                        sp.HinhAnh = FileName;
                    }

                    sp.NgayCapNhat = DateTime.Now;
                    sp.TenSanPham = sanPham.TenSanPham;
                    sp.MoTa = sanPham.MoTa;
                    sp.SanPhamMoi = sanPham.SanPhamMoi;
                    sp.NoiBat = sanPham.NoiBat;
                    sp.MaLoaiSanPham = sanPham.MaLoaiSanPham;
                    //db.Entry(sanPham).State = EntityState.Modified;
                    db.SaveChanges();

                    smd.MaSanPham = sanPham.MaSanPham;

                    bool check = db.SanPham_MauSac_DungLuong.Any(s => s.MaSanPham == smd.MaSanPham &&  s.ID_DungLuong == smd.ID_DungLuong && s.ID_MauSac == smd.ID_MauSac);

                    if(check)
                    {
                        var SMD = db.SanPham_MauSac_DungLuong.Where(s => s.MaSanPham == smd.MaSanPham && s.ID_DungLuong == smd.ID_DungLuong && s.ID_MauSac == smd.ID_MauSac).FirstOrDefault();
                        SMD.Gia = smd.Gia;
                        SMD.SoLuongCon = smd.SoLuongCon;

                        db.SaveChanges();
                    }
                    else
                    {
                        db.SanPham_MauSac_DungLuong.Add(smd);
                        db.SaveChanges();
                    }

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không sửa được" + ex.Message;
                ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
                ViewBag.ID_DungLuong = new SelectList(db.DungLuongs, "ID_DungLuong", "KichThuoc");
                ViewBag.ID_MauSac = new SelectList(db.MauSacs, "ID_MauSac", "TenMau");
                return View(sanPham);
            }


        }

        // GET: SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            try
            {

                db.SanPhams.Remove(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi không xóa được sản phẩm" + ex.Message;
                return View("Delete", sanPham);
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