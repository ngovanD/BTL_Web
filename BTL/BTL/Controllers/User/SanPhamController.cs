using BTL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Controllers
{
    public class SanPhamController : Controller
    {
        private static ShopDienThoaiContext db = new ShopDienThoaiContext();
        public static List<SanPhamDto> LayDanhSachSanPhamTheoLoai(int maLoaiSanPham)
        {
            /*var list = (from sp in db.SanPhams
                       where sp.MaLoaiSanPham == maLoaiSanPham
                       select sp).ToList();*/

            var listSanPhamTheoLoai = db.SanPhams.Where(sp => sp.MaLoaiSanPham == maLoaiSanPham);

            /*var list = (from sp in db.SanPhams
                    join spmd in db.SanPham_MauSac_DungLuong on sp.MaSanPham equals spmd.MaSanPham
                    join m in db.MauSacs on spmd.ID_MauSac equals m.ID_MauSac
                    join d in db.DungLuongs on spmd.ID_DungLuong equals d.ID_DungLuong
                    where sp.MaLoaiSanPham == maLoaiSanPham && spmd.SoLuongCon > 0
                    select new SanPhamDto
                    {
                        MaSanPham = sp.MaSanPham,
                        TenSanPham = sp.TenSanPham,
                        HinhAnh = sp.HinhAnh,
                        Gia = (int)spmd.Gia,
                    }).ToList();*/

            var listGiaNhoNhat = from spmd in db.SanPham_MauSac_DungLuong
                                 group spmd by spmd.MaSanPham into tem
                                 select new
                                 {
                                     MaSanPham = tem.Key,
                                     GiaNhoNhat = tem.Min(s => s.Gia)
                                 };

            var list = from sp in listSanPhamTheoLoai
                       join g in listGiaNhoNhat on sp.MaSanPham equals g.MaSanPham
                       select new SanPhamDto
                       {
                           MaSanPham = sp.MaSanPham,
                           TenSanPham = sp.TenSanPham,
                           HinhAnh = sp.HinhAnh,
                           Gia = (int)g.GiaNhoNhat
                       };



            return list.ToList();
        }

        public static SanPhamDto LaySanPhamMacDinh(int maSanPham)
        {
            var sanPham = (from sp in db.SanPhams
                        join spmd in db.SanPham_MauSac_DungLuong on sp.MaSanPham equals spmd.MaSanPham
                        join m in db.MauSacs on spmd.ID_MauSac equals m.ID_MauSac
                        join d in db.DungLuongs on spmd.ID_DungLuong equals d.ID_DungLuong
                        where sp.MaSanPham == maSanPham
                        orderby spmd.Gia
                        select new SanPhamDto
                        {
                            MaSanPham = sp.MaSanPham,
                            Id_MauSac = m.ID_MauSac,
                            Id_DungLuong = d.ID_DungLuong,
                            TenSanPham = sp.TenSanPham,
                            HinhAnh = sp.HinhAnh,
                            Gia = (int)spmd.Gia,
                        }).FirstOrDefault();
            return sanPham;
        }

        public ActionResult ChiTietSanPham(int maSanPham)
        {
            SanPhamDto sanPham = LaySanPhamMacDinh(maSanPham);
            ViewBag.sanPham = sanPham;

            var listMauSac = (from ms in db.MauSacs
                              where (from spmd in db.SanPham_MauSac_DungLuong
                                     where spmd.MaSanPham == maSanPham
                                     select spmd.ID_MauSac).Contains(ms.ID_MauSac)
                              select (ms)).ToList();
            ViewBag.listMau = listMauSac;

            var listDungLuong = (from d in db.DungLuongs 
                                 where (from spmd in db.SanPham_MauSac_DungLuong
                                        where spmd.MaSanPham == maSanPham
                                        select spmd.ID_DungLuong).Contains(d.ID_DungLuong)
                                 select(d)).ToList();
            ViewBag.listDungLuong = listDungLuong;

            return View();
        }
    }
}