namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SanPham_MauSac_DungLuong
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaSanPham { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_DungLuong { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_MauSac { get; set; }

        public int? Gia { get; set; }

        public int? GiaGiam { get; set; }

        public int? SoLuongCon { get; set; }

        public virtual DungLuong DungLuong { get; set; }

        public virtual MauSac MauSac { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
