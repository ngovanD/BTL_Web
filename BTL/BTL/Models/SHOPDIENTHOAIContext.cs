using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BTL.Models
{
    public partial class SHOPDIENTHOAIContext : DbContext
    {
        public SHOPDIENTHOAIContext()
            : base("name=SHOPDIENTHOAIContext")
        {
        }

        public virtual DbSet<LoaiSanPham> LoaiSanPhams { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongTinShop> ThongTinShops { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
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

            modelBuilder.Entity<ThongTinShop>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinShop>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);
        }
    }
}
