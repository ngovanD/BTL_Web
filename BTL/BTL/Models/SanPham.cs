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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
            SanPham_MauSac_DungLuong = new HashSet<SanPham_MauSac_DungLuong>();
        }

        [Key]
        public int MaSanPham { get; set; }

        [StringLength(200)]
        public string TenSanPham { get; set; }

        [StringLength(30)]
        public string HinhAnh { get; set; }

        [StringLength(1000)]
        public string MoTa { get; set; }

        public DateTime? NgayTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        public bool? SanPhamMoi { get; set; }

        public bool? NoiBat { get; set; }

        public int? MaLoaiSanPham { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham_MauSac_DungLuong> SanPham_MauSac_DungLuong { get; set; }
    }
}
