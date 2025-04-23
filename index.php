<?php 
session_start();
// Require file Common
require_once './commons/env.php'; // Khai báo biến môi trường
require_once './commons/function.php'; // Hàm hỗ trợ

// Require toàn bộ file Controllers
require_once './controllers/HomeController.php';

// Require toàn bộ file Models
// require_once './models/Student.php';
require_once './models/SanPham.php';
require_once './models/TaiKhoan.php';
require_once './models/GioHang.php';
require_once './models/DonHang.php';
require_once './models/DanhMuc.php';
// Route
$act = $_GET['act'] ?? '/';
// var_dump($_GET['act']);die();

// if ($_GET['act']) {
//     $act = $_GET['act'];
// }else{
//     $act = '/';
// }

// Để bảo bảo tính chất chỉ gọi 1 hàm Controller để xử lý request thì mình sử dụng match

match ($act) {
    // Trang chủ 
    //Route
    '/'                                     => (new HomeController())->home(), //trường hợp đặc biệt
    // 'danh-sach-san-pham'=>(new HomeController())->danhSachSanPham(), //BASE_URL/?act=danh-sach-san-pham
    'chi-tiet-san-pham'                     =>(new HomeController())->chiTietSanPham(),
    'them-gio-hang'                         =>(new HomeController())->addGioHang(),
    'gio-hang'                              =>(new HomeController())->gioHang(),
    'xoa-san-pham-trong-gio-hang'           => (new HomeController())->xoaSanPhamTrongGioHang(),
    'thanh-toan'                            =>(new HomeController())->thanhToan(),
    'xu-ly-thanh-toan'                      =>(new HomeController())->postThanhToan(),
    'lich-su-mua-hang'                      =>(new HomeController())->lichSuMuaHang(),
    'chi-tiet-mua-hang'                     =>(new HomeController())->chiTietMuaHang(),
    'huy-don-hang'                          =>(new HomeController())->huyDonHang(),

    // Auth 
    'login'                                 =>(new HomeController())->formLogin(),
    'check-login'                           =>(new HomeController())->postLogin(),
    'register'                              =>(new HomeController())->formRegister(),
    'check-register'                        =>(new HomeController())->postRegister(),
    'dang-xuat'                             =>(new HomeController())->logOut(),


    // 'danh-muc'                           =>(new HomeController())->danhSachDanhMuc(),
    'san-pham'                              =>(new HomeController())->danhSachSanPham(),
    'binh-luan'                             =>(new HomeController())->postBinhLuan(),
    'contact'                               =>(new HomeController())->contact(),
    'gioi-thieu'                            =>(new HomeController())->gioiThieu(),

    'tim-kiem'          => (new HomeController())->timKiemSanPham(),
    default             => header("HTTP/1.0 404 Not Found")

    
};