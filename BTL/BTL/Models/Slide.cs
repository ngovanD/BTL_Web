namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Slide")]
    public partial class Slide
    {
        [Key]
        public int MaSlide { get; set; }

        [StringLength(100)]
        public string TenSlide { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        [StringLength(300)]
        public string NoiDung { get; set; }

        [StringLength(100)]
        public string Link { get; set; }

        public bool? TrangThai { get; set; }
    }
}
