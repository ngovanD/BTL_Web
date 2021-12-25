namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ThongTinLienHe_KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThongTinLienHe_KhachHang()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        public int MaThongTinLienHe_KhachHang { get; set; }

        [StringLength(100)]
        public string HoTen { get; set; }

        [StringLength(300)]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string SoDienThoai { get; set; }

        [StringLength(1000)]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
    }
}
