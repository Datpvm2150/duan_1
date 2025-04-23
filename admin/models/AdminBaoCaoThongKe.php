<?php
require_once '../commons/env.php';

class AdminBaoCaoThongKe
{
    public $conn;

    public function __construct()
    {
        $this->conn = connectDB();
    }

    public function getTongDoanhThu()
    {
        try {
            $sql = 'SELECT SUM(tong_tien) as tong_doanh_thu 
                    FROM don_hangs 
                    WHERE trang_thai_id = 9';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC)['tong_doanh_thu'] ?? 0;
        } catch (Exception $e) {
            error_log("Lỗi lấy tổng doanh thu: " . $e->getMessage());
            return 0;
        }
    }

    public function getDonHangTheoTrangThai()
    {
        try {
            $sql = 'SELECT ttdh.ten_trang_thai, COUNT(dh.id) as so_luong 
                    FROM don_hangs dh 
                    JOIN trang_thai_don_hangs ttdh ON dh.trang_thai_id = ttdh.id 
                    GROUP BY ttdh.ten_trang_thai';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi lấy đơn hàng theo trạng thái: " . $e->getMessage());
            return [];
        }
    }

    public function getThongKeSanPhamTheoDanhMuc()
    {
        try {
            $sql = 'SELECT dm.ten_danh_muc, 
                           COUNT(sp.id) as so_luong_san_pham, 
                           COALESCE(SUM(ctdh.so_luong), 0) as so_luong_ban, 
                           COALESCE(SUM(ctdh.thanh_tien), 0) as doanh_thu 
                    FROM danh_mucs dm 
                    LEFT JOIN san_phams sp ON dm.id = sp.danh_muc_id 
                    LEFT JOIN chi_tiet_don_hangs ctdh ON sp.id = ctdh.san_pham_id 
                    LEFT JOIN don_hangs dh ON ctdh.don_hang_id = dh.id AND dh.trang_thai_id = 9 
                    GROUP BY dm.id, dm.ten_danh_muc';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi lấy thống kê sản phẩm theo danh mục: " . $e->getMessage());
            return [];
        }
    }

    public function getThongKeTaiKhoan()
    {
        try {
            $sql = 'SELECT cv.ten_chuc_vu, COUNT(tk.id) as so_luong 
                    FROM tai_khoans tk 
                    JOIN chuc_vus cv ON tk.chuc_vu_id = cv.id 
                    GROUP BY cv.id, cv.ten_chuc_vu';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi lấy thống kê tài khoản: " . $e->getMessage());
            return [];
        }
    }
}
?>