<?php

class HomeController
{
    public $modelSanPham;

    public $modelTaiKhoan;

    public $modelGioHang;

    public $modelDonHang;

    public $modelDanhMuc;


    public function __construct()
    {
        $this->modelSanPham = new SanPham();
        $this->modelTaiKhoan = new ClientTaiKhoan();
        $this->modelGioHang = new GioHang();
        $this->modelDonHang = new DonHang();
        $this->modelDanhMuc = new DanhMuc();
    }

    public function home()
    {
        $listSanPham = $this->modelSanPham->getAllProduct();
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            if ($mail) {  // Thêm kiểm tra này
                $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);
                if (!$gioHang) {
                    $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                    $gioHang = ['id' => $gioHangId];
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                } else {
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                }
            }
        }
        require_once './views/home.php';
    }

    public function danhSachSanPham()
    {
        $danh_muc_id = isset($_GET['danh_muc_id']) ? (int)$_GET['danh_muc_id'] : null;
        $min_price = isset($_GET['min_price']) ? (float)$_GET['min_price'] : null;

        $listDanhMuc = $this->modelDanhMuc->getAllDanhMuc();

        if ($danh_muc_id || ($min_price !== null && $min_price >= 0)) {
            $listSanPham = $this->modelSanPham->filterProducts($danh_muc_id, $min_price);
        } else {
            $listSanPham = $this->modelSanPham->getAllProduct();
        }

        // Giỏ hàng logic giữ nguyên
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            if ($mail) {
                $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);
                if (!$gioHang) {
                    $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                    $gioHang = ['id' => $gioHangId];
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                } else {
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                }
            }
        }

        require_once './views/trangSanPham.php';
    }
    public function chiTietSanPham()
    {

        $id = $_GET['id_san_pham'];

        $sanPham = $this->modelSanPham->getDetailtSanPham($id);

        $listAnhSanPham = $this->modelSanPham->getListAnhSanPham($id);

        $listBinhLuan = $this->modelSanPham->getBinhLuanFromSanPham($id);

        $listSanPhamCungDanhMuc = $this->modelSanPham->getListSanPhamCungDanhMuc($sanPham['danh_muc_id']);
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }
        }
        if ($sanPham) {

            require_once './views/detailSanPham.php';
        } else {
            header("Location: " . BASE_URL);
            exit();
        }
    }

    public function formLogin()
    {
        require_once './views/auth/formLogin.php';
        deleteSessionError();
        exit();
    }

    public function postLogin()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = trim($_POST['email']);
            $password = trim($_POST['password']);

            // Lấy thông tin user theo email
            $user = $this->modelTaiKhoan->getUserByEmail($email);

            if ($user && password_verify($password, $user['mat_khau'])) {
                // Đăng nhập thành công
                $_SESSION['user_client'] = $user['email']; // Chỉ lưu email thay vì toàn bộ mảng $user
                header("Location: " . BASE_URL);
                exit();
            } else {
                // Đăng nhập thất bại
                $_SESSION['error'] = "Email hoặc mật khẩu không đúng.";
                header("Location: " . BASE_URL . '?act=login');
                exit();
            }
        }
    }



    public function formRegister()
    {
        require_once './views/auth/formDangKy.php';
        deleteSessionError();
        exit();
    }

    public function postRegister()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $ho_ten = trim($_POST['ho_ten']);
            $email = trim($_POST['email']);
            $mat_khau = trim($_POST['mat_khau']);
            $mat_khau_repeat = trim($_POST['mat_khau_repeat']);
            $chuc_vu_id = 2;

            // Kiểm tra độ dài mật khẩu
            if (strlen($mat_khau) < 6) {
                $_SESSION['err'] = "Mật khẩu phải có ít nhất 6 ký tự.";
                header("Location:" . BASE_URL . '?act=register');
                exit();
            }

            // Kiểm tra trùng khớp mật khẩu
            if ($mat_khau !== $mat_khau_repeat) {
                $_SESSION['err'] = "Mật khẩu không trùng khớp.";
                header("Location:" . BASE_URL . '?act=register');
                exit();
            }

            // Kiểm tra email đã tồn tại chưa
            $userList = $this->modelTaiKhoan->getAllTaiKhoan();
            foreach ($userList as $user) {
                if ($user['email'] === $email) {
                    $_SESSION['err'] = "Email đã tồn tại. Vui lòng dùng email khác.";
                    header("Location:" . BASE_URL . '?act=register');
                    exit();
                }
            }

            // Mã hóa mật khẩu và thêm người dùng mới
            $hashedPassword = password_hash($mat_khau, PASSWORD_BCRYPT);
            $this->modelTaiKhoan->addUser($ho_ten, $email, $hashedPassword, $chuc_vu_id);

            // Chuyển hướng về trang đăng nhập
            $_SESSION['success'] = "Đăng ký thành công. Mời bạn đăng nhập.";
            header("Location:" . BASE_URL . '?act=login');
            exit();
        }
    }


    public function logOut()
    {
        session_unset();
        header("Location:" . BASE_URL);
    }

    public function addGioHang()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (isset($_SESSION['user_client'])) {
                $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

                // var_dump($mail['id']); die;
                $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);

                if (!$gioHang) {
                    $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                    $gioHang = ['id' => $gioHangId];
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                } else {
                    $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
                }

                $san_pham_id = $_POST['san_pham_id'];
                $so_luong = $_POST['so_luong'];

                $checkSanPham = false;
                foreach ($chiTietGioHang as $detail) {
                    if ($detail['san_pham_id'] == $san_pham_id) {
                        $newSoLuong = $detail['so_luong'] + $so_luong;
                        $this->modelGioHang->updateSoLuong($gioHang['id'], $san_pham_id, $newSoLuong);
                        $checkSanPham = true;
                        break;
                    }
                }
                if (!$checkSanPham) {
                    $this->modelGioHang->addDetailGioHang($gioHang['id'], $san_pham_id, $so_luong);
                }
                header("Location:" . BASE_URL . '?act=gio-hang');
            } else {
                // var_dump('Chưa đăng nhập'); die;
                header("Location:" . BASE_URL . '?act=login');
            }
        }
    }

    public function gioHang()
    {
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }

            require_once './views/gioHang.php';
        } else {
            header("Location:" . BASE_URL . '?act=login');
        }
    }

    public function thanhToan()
    {
        if (isset($_SESSION['user_client'])) {
            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($user['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($user['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }

            require_once './views/thanhToan.php';
        } else {
            header("Location:" . BASE_URL . '?act=login');
        }
    }

    public function postThanhToan()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (!isset($_SESSION['user_client'])) {
                header("Location:" . BASE_URL . '?act=login');
                exit;
            }

            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            if (!$user) {
                session_unset();
                header("Location:" . BASE_URL . '?act=login');
                exit;
            }
            // var_dump($_POST);die;
            $ten_nguoi_nhan = $_POST['ten_nguoi_nhan'];
            $email_nguoi_nhan = $_POST['email_nguoi_nhan'];
            $sdt_nguoi_nhan = $_POST['sdt_nguoi_nhan'];
            $dia_chi_nguoi_nhan = $_POST['dia_chi_nguoi_nhan'];
            $ghi_chu = $_POST['ghi_chu'];
            $tong_tien = $_POST['tong_tien'];
            $phuong_thuc_thanh_toan_id = $_POST['phuong_thuc_thanh_toan_id'];

            $ngay_dat = date('Y-m-d');
            // var_dump($ngay_dat); die;
            $trang_thai_id = 1;
            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            $tai_khoan_id = $user['id'];

            $ma_don_hang = 'DH-' . rand(1000, 9999);

            $donHang = $this->modelDonHang->addDonHang(
                $tai_khoan_id,
                $ten_nguoi_nhan,
                $email_nguoi_nhan,
                $sdt_nguoi_nhan,
                $dia_chi_nguoi_nhan,
                $ghi_chu,
                $tong_tien,
                $phuong_thuc_thanh_toan_id,
                $ngay_dat,
                $ma_don_hang,
                $trang_thai_id
            );
            // lấy thông tin giỏ hàng
            $gioHang = $this->modelGioHang->getGioHangFromUser($tai_khoan_id);

            // save product in cartDetail
            if ($donHang) {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);

                foreach ($chiTietGioHang as $item) {
                    $donGia = $item['gia_khuyen_mai'] ?? $item['gia_san_pham'];

                    $this->modelDonHang->addChiTietDonHang($donHang, $item['san_pham_id'], $donGia, $item['so_luong'], $donGia * $item['so_luong']);
                }
                // Delete all pproduct from cart detail + del cart info
                $this->modelGioHang->clearDetailGioHang($gioHang['id']);

                $this->modelGioHang->clearGioHang($tai_khoan_id);

                header("Location:" . BASE_URL . '?act=lich-su-mua-hang');
                exit;
            } else {
                var_dump('Lỗi đặt hàng.');
                die;
            }
        }
    }

    public function lichSuMuaHang()
    {
        if (isset($_SESSION['user_client'])) {
            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            $tai_khoan_id = $user['id'];

            $arrTrangThaiDonHang = $this->modelDonHang->getTrangThaiDonHang();
            $TrangThaiDonHang = array_column($arrTrangThaiDonHang, 'ten_trang_thai', 'id');
            // print_r($TrangThaiDonHang);die;

            $arrPhuongThucThanhToan = $this->modelDonHang->getPhuongThucThanhToan();
            $PhuongThucThanhToan = array_column($arrPhuongThucThanhToan, 'ten_phuong_thuc', 'id');
            // var_dump($PhuongThucThanhToan);die;

            $donHangs = $this->modelDonHang->getDonHangFromUser($tai_khoan_id);


            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($user['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($user['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }

            require_once  "./views/lichSuMuaHang.php";
        } else {
            // var_dump('Bạn chưa đăng nhập');die;
            header("Location:" . BASE_URL . '?act=login');
        }
    }
    public function chiTietMuaHang()
    {
        if (isset($_SESSION['user_client'])) {
            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            $tai_khoan_id = $user['id'];

            $donHangId = $_GET['id'];

            $arrTrangThaiDonHang = $this->modelDonHang->getTrangThaiDonHang();
            $TrangThaiDonHang = array_column($arrTrangThaiDonHang, 'ten_trang_thai', 'id');
            // print_r($TrangThaiDonHang);die;

            $arrPhuongThucThanhToan = $this->modelDonHang->getPhuongThucThanhToan();
            $PhuongThucThanhToan = array_column($arrPhuongThucThanhToan, 'ten_phuong_thuc', 'id');
            // var_dump($PhuongThucThanhToan);die;

            $donHang = $this->modelDonHang->getDonHangById($donHangId);
            // var_dump($donHang);

            $chiTietDonHang = $this->modelDonHang->getChiTietDonHangByDonHangId($donHangId);
            // echo "<pre>";
            // print_r($chiTietDonHang);

            if ($donHang['tai_khoan_id'] != $tai_khoan_id) {
                echo "Bạn không có quyền truy cập đơn hàng này";
                exit;
            }

            require_once  "./views/chiTietMuaHang.php";
        } else {
            // var_dump('Bạn chưa đăng nhập');die;
            header("Location:" . BASE_URL . '?act=login');
        }
    }
    public function huyDonHang()
    {
        if (isset($_SESSION['user_client'])) {
            $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            $tai_khoan_id = $user['id'];

            $donHangId = $_GET['id'];

            $donHang = $this->modelDonHang->getDonHangById($donHangId);
            // var_dump($donHang['tai_khoan_id']); die;
            if ($donHang['tai_khoan_id'] != $tai_khoan_id) {
                echo "Bạn không có quyền hủy đơn hàng này";
                exit;
            }

            if ($donHang['trang_thai_id'] != 1) {
                echo "Chỉ đơn hàng ở trạng thái chưa xác nhận mới có thể hủy";
                exit;
            }

            $this->modelDonHang->updateTrangThaiDonHang($donHangId, 11);
            header("Location:" . BASE_URL . '?act=lich-su-mua-hang');
            exit;
        } else {
            // var_dump('Bạn chưa đăng nhập');die;
            header("Location:" . BASE_URL . '?act=login');
        }
    }

    public function contact()
    {
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }
        }
        require_once('./views/Contact.php');
    }
    public function gioiThieu()
    {
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);

            // var_dump($mail['id']); die;
            $gioHang = $this->modelGioHang->getGioHangFromUser($mail['id']);

            if (!$gioHang) {
                $gioHangId = $this->modelGioHang->addGioHang($mail['id']);
                $gioHang = ['id' => $gioHangId];
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            } else {
                $chiTietGioHang = $this->modelGioHang->getDetailGioHang($gioHang['id']);
            }
        }
        require_once('./views/gioiThieu.php');
    }

    public function postBinhLuan()
    {
        $san_pham_id = $_GET['id_san_pham'];
        $_SESSION['thong_bao_binh_luan'] = "";
        // var_dump($_GET['id_san_pham']); 
        if (isset($_SESSION['user_client'])) {
            $mail = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
            $tai_khoan_id = $mail['id'];
            // var_dump($tai_khoan_id);

            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $noi_dung = $_POST['noi_dung'];
                $ngay_dang = date('Y-m-d');
                $trang_thai = 1;
                // var_dump($ngay_dang); 
                if ($noi_dung !== "") {
                    $binhLuan = $this->modelSanPham->postBinhLuanByIdSanPham($san_pham_id, $tai_khoan_id, $noi_dung, $ngay_dang, $trang_thai);
                    header("Location:" . BASE_URL . "?act=chi-tiet-san-pham&id_san_pham=" . $san_pham_id);
                    exit();
                } else {
                    $_SESSION['thong_bao_binh_luan'] = "Thanh bình luận không để trống";
                    header("Location:" . BASE_URL . "?act=chi-tiet-san-pham&id_san_pham=" . $san_pham_id);
                    exit();
                }
            }
        } else {
            header("Location:" . BASE_URL . '?act=login');
            exit();
        }
    }

    public function timKiemSanPham()
    {
        $keyword = isset($_GET['query']) ? trim($_GET['query']) : '';

        // Nếu từ khóa rỗng, trả về danh sách trống
        $listSanPham = [];
        if (!empty($keyword)) {
            $listSanPham = $this->modelSanPham->searchProducts($keyword);
        }

        // Gửi dữ liệu đến View
        require_once './views/searchResults.php';
    }

    public function xoaSanPhamTrongGioHang()
    {
        if (!isset($_SESSION['user_client'])) {
            header("Location:" . BASE_URL . '?act=login');
            exit;
        }

        $user = $this->modelTaiKhoan->getTaiKhoanFromEmail($_SESSION['user_client']);
        if (!$user) {
            session_unset();
            header("Location:" . BASE_URL . '?act=login');
            exit;
        }
        $tai_khoan_id = $user['id'];

        $gioHang = $this->modelGioHang->getGioHangFromUser($tai_khoan_id);
        if (!$gioHang || !isset($gioHang['id'])) {
            header("Location:" . BASE_URL . '?act=gio-hang');
            exit;
        }

        $san_pham_id = isset($_GET['id_san_pham']) ? (int)$_GET['id_san_pham'] : 0;
        if ($san_pham_id <= 0) {
            error_log("ID sản phẩm không hợp lệ: $san_pham_id");
            header("Location:" . BASE_URL . '?act=gio-hang');
            exit;
        }

        // Gọi phương thức xóa và kiểm tra kết quả
        $result = $this->modelGioHang->DeleteSanPhamByID($san_pham_id, $gioHang['id']);
        if ($result) {
            $_SESSION['success'] = "Đã xóa sản phẩm khỏi giỏ hàng.";
        } else {
            $_SESSION['error'] = "Không thể xóa sản phẩm. Vui lòng thử lại.";
        }

        header("Location:" . BASE_URL . '?act=gio-hang');
        exit;
    }
}
