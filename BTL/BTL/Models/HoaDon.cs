namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }

        [Key]
        public int MaHoaDon { get; set; }

        public int? TongTien { get; set; }

        public DateTime? NgayLapHoaDon { get; set; }

        [StringLength(30)]
        public string TrangThai { get; set; }

        public int? MaThongTinLienHe_KhachHang { get; set; }

        public int? ID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }

        public virtual ThongTinLienHe_KhachHang ThongTinLienHe_KhachHang { get; set; }
    }
}
