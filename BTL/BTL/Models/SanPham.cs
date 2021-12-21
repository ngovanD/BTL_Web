namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [Key]
        public int MaSanPham { get; set; }

        [StringLength(200)]
        public string TenSanPham { get; set; }

        [StringLength(30)]
        public string HinhAnh { get; set; }

        public int? Gia { get; set; }

        public int? GiaGiam { get; set; }

        public int? SoLuongCon { get; set; }

        [StringLength(1000)]
        public string MoTa { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        public bool? SanPhamMoi { get; set; }

        public bool? NoiBat { get; set; }

        public int? MaLoaiSanPham { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }
    }
}
