namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(30)]
        public string Email { get; set; }

        [StringLength(100)]
        public string HoTen { get; set; }

        [Required]
        [StringLength(30)]
        public string MatKhau { get; set; }

        [StringLength(10)]
        public string LoaiTaiKhoan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
    }
}
