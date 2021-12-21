namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinShop")]
    public partial class ThongTinShop
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaLienHeShop { get; set; }

        [StringLength(100)]
        public string DiaChi { get; set; }

        [StringLength(30)]
        public string Email { get; set; }

        [StringLength(10)]
        public string SoDienThoai { get; set; }

        [StringLength(300)]
        public string TenShop { get; set; }
    }
}
