<?php
require_once './models/AdminBaoCaoThongKe.php';

class AdminBaoCaoThongKeController
{
    public function home()
    {
        // Kiểm tra session user_admin
        if (!isset($_SESSION['user_admin']) || !is_array($_SESSION['user_admin']) || !isset($_SESSION['user_admin']['chuc_vu_id']) || $_SESSION['user_admin']['chuc_vu_id'] != 1) {
            $_SESSION['error'] = "Bạn không có quyền truy cập hoặc chưa đăng nhập!";
            header("Location: " . BASE_URL_ADMIN . "?act=login-admin");
            exit;
        }

        $baoCaoModel = new AdminBaoCaoThongKe();

        // Lấy dữ liệu thống kê
        $tongDoanhThu = $baoCaoModel->getTongDoanhThu();
        $donHangTheoTrangThai = $baoCaoModel->getDonHangTheoTrangThai();
        $thongKeDanhMuc = $baoCaoModel->getThongKeSanPhamTheoDanhMuc();
        $thongKeTaiKhoan = $baoCaoModel->getThongKeTaiKhoan();

        // Truyền dữ liệu sang view
        require_once './views/home.php';
    }
}
?>