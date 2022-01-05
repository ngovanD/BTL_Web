using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL.Models
{
    public class SanPhamKichThuocMauSacDTO
    {
        public int MaSanPham { get; set; }
        public int ID_DungLuong { get; set; }

        public int ID_MauSac { get; set; }

        public int Gia { get; set; }

        public int SoLuongCon { get; set; }

        public int KichThuoc { get; set; }

        public string TenMau { get; set; }
    }
}