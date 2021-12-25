namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DungLuong")]
    public partial class DungLuong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DungLuong()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
            SanPham_MauSac_DungLuong = new HashSet<SanPham_MauSac_DungLuong>();
        }

        [Key]
        public int ID_DungLuong { get; set; }

        public int? KichThuoc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham_MauSac_DungLuong> SanPham_MauSac_DungLuong { get; set; }
    }
}
