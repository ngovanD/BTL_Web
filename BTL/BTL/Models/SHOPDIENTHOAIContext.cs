using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BTL.Models
{
    public partial class ShopDienThoaiContext : DbContext
    {
        public ShopDienThoaiContext()
            : base("name=ShopDienThoaiContext")
        {
        }

        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<DungLuong> DungLuongs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<LoaiSanPham> LoaiSanPhams { get; set; }
        public virtual DbSet<MauSac> MauSacs { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<SanPham_MauSac_DungLuong> SanPham_MauSac_DungLuong { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongTinLienHe_KhachHang> ThongTinLienHe_KhachHang { get; set; }
        public virtual DbSet<ThongTinShop> ThongTinShops { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LoaiSanPham>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiSanPham>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.LoaiSanPham)
                .WillCascadeOnDelete();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<Slide>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.LoaiTaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.TaiKhoan)
                .WillCascadeOnDelete();

            modelBuilder.Entity<ThongTinLienHe_KhachHang>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinLienHe_KhachHang>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.ThongTinLienHe_KhachHang)
                .WillCascadeOnDelete();

            modelBuilder.Entity<ThongTinShop>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinShop>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);
        }
    }
}
