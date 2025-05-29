<?php
class AdminTaiKhoanController
{
    public $modelTaiKhoan;
    public function __construct()
    {
        $this->modelTaiKhoan = new AdminTaiKhoan();
    }
    public function danhSachQuanTri()
    {
        $listQuanTri = $this->modelTaiKhoan->getAllTaiKhoan(1);

        require_once './views/taikhoan/quantri/listQuanTri.php';
    }

    public function formAddQuanTri()
    {
        require_once './views/taikhoan/quantri/addQuanTri.php';
        deleteSessionError();
    }
    public function postAddQuanTri()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Lấy ra dữ liệu
            $ho_ten = $_POST['ho_ten'];
            $email = $_POST['email'];

            // Tạo 1 mảng trống để chứa dữ liệu
            $errors = [];
            if (empty($ho_ten)) {
                $errors['ho_ten'] = 'Tên không được để trống';
            }
            if (empty($email)) {
                $errors['email'] = 'Email không được để trống';
            }
            $_SESSION['error'] = $errors;
            // Nếu ko có lỗi thì tiến hành thêm danh mục
            if (empty($errors)) {
                //Nếu ko có lỗi thì tiến hành thêm danh mục
                // đặt pass mặc định
                $password = password_hash('123@123', PASSWORD_BCRYPT);
                $chuc_vu_id = 1;
                $this->modelTaiKhoan->insertTaiKhoan($ho_ten, $email, $password, $chuc_vu_id);
                header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-quan-tri');
                exit();
            } else {
                //Trả về form và lỗi
                $_SESSION['flash'] = true;
                header("Location: " . BASE_URL_ADMIN . '?act=form-them-quan-tri');
                exit();
            }
        }
    }
    public function formEditQuanTri()
    {
        $id_quan_tri = $_GET['id_quan_tri'];
        $quanTri = $this->modelTaiKhoan->getDetailTaiKhoan($id_quan_tri);
        // var_dump($quanTri);die;
        require_once './views/taikhoan/quantri/editQuanTri.php';
        deleteSessionError();
    }


    public function postEditQuanTri()
    {
        // Hàm này dùng để xử lý thêm dữ liệu

        //Kiểm tra xem dữ liệu có phải đc submit lên không
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Lấy ra dữ liệu
            $quan_tri_id = $_POST['id_quan_tri'] ?? '';
            //    var_dump($quan_tri_id); die;

            $ho_ten = $_POST['ho_ten'] ?? '';
            $email = $_POST['email'] ?? '';
            $so_dien_thoai = $_POST['so_dien_thoai'] ?? '';
            $trang_thai = $_POST['trang_thai'] ?? '';

            // var_dump($trang_thai); die;

            // Tạo 1 mảng trống để chứa dữ liệu
            $errors = [];

            if (empty($ho_ten)) {
                $errors['ho_ten'] = 'Tên người dùng không được để trống';
            }

            if (empty($email)) {
                $errors['email'] = 'Email người dùng không được để trống';
            }

            if (empty($so_dien_thoai)) {
                $errors['so_dien_thoai'] = 'Số điện thoại người dùng không được để trống';
            }




            if (empty($trang_thai)) {
                $errors['trang_thai'] = 'Trạng thái ';
            }


            $_SESSION['error'] = $errors;

            // Nếu ko có lỗi thì tiến hành sửa
            if (empty($errors)) {
                //Nếu ko có lỗi thì tiến hành thêm sản phẩm
                $this->modelTaiKhoan->updateTaiKhoan($quan_tri_id, $ho_ten, $email, $so_dien_thoai, $trang_thai);
                // var_dump($san_pham_id);die();

                header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-quan-tri');
                exit();
            } else {
                //Trả về form và lỗi
                //Đặt lại chỉ thị xóa session sau khi hiển thị forrm 
                $_SESSION['flash'] = true;
                header("Location: " . BASE_URL_ADMIN . '?act=form-sua-quan-tri&id_quan-tri' . $quan_tri_id);
                exit();
            }
        }
    }
    public function resetPassword()
    {
        // Chỉ lấy id_quan_tri từ URL
        $tai_khoan_id = $_GET['id_quan_tri'] ?? null;

        if (!$tai_khoan_id) {
            echo "Không tìm thấy ID tài khoản quản trị cần reset.";
            die;
        }

        // Lấy thông tin tài khoản theo ID
        $tai_Khoan = $this->modelTaiKhoan->getDetailTaiKhoan($tai_khoan_id);

        if (!$tai_Khoan) {
            echo "Tài khoản không tồn tại.";
            die;
        }

        // Kiểm tra đúng là tài khoản quản trị (chuc_vu_id = 1)
        if ($tai_Khoan['chuc_vu_id'] != 1) {
            echo "Chỉ cho phép reset mật khẩu tài khoản quản trị.";
            die;
        }

        // Reset về mật khẩu mặc định
        $password = password_hash('123@123', PASSWORD_BCRYPT);
        $status = $this->modelTaiKhoan->resetPassword($tai_khoan_id, $password);

        if ($status) {
            header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-quan-tri');
            exit();
        } else {
            echo "Lỗi khi reset mật khẩu.";
            die;
        }
    }

    public function danhSachKhachHang()
    {
        $listKhachHang = $this->modelTaiKhoan->getAllKhachHang();
        require_once './views/taikhoan/khachhang/listKhachHang.php';
    }

    public function formEditKhachHang()
    {
        $id = $_GET['id_khach_hang'] ?? null;
        if ($id) {
            $khachHang = $this->modelTaiKhoan->getDetailTaiKhoan($id);
            if ($khachHang) {
                require_once './views/taikhoan/khachhang/editKhachHang.php';
                deleteSessionError();
                return;
            }
        }
        header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-khach-hang');
        exit();
    }

    public function postEditKhachHang()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Lấy dữ liệu từ form
            $khach_hang_id = $_POST['khach_hang_id'] ?? '';
            $ho_ten = trim($_POST['ho_ten'] ?? '');
            $email = trim($_POST['email'] ?? '');
            $so_dien_thoai = trim($_POST['so_dien_thoai'] ?? '');
            $ngay_sinh = $_POST['ngay_sinh'] ?? '';
            $gioi_tinh = $_POST['gioi_tinh'] ?? '';
            $dia_chi = trim($_POST['dia_chi'] ?? '');
            $trang_thai = $_POST['trang_thai'] ?? '';

            // Log dữ liệu nhận được
            error_log("Form data: " . json_encode($_POST));
            error_log("File data: " . json_encode($_FILES));

            // Lấy thông tin tài khoản hiện tại để lấy ảnh cũ
            $taiKhoanOld = $this->modelTaiKhoan->getDetailTaiKhoan($khach_hang_id);
            $old_file = $taiKhoanOld['anh_dai_dien'] ?? null;

            $errors = [];

            // Validate bắt buộc
            $requiredFields = [
                'ho_ten' => 'Tên người dùng',
                'email' => 'Email người dùng',
                'so_dien_thoai' => 'Số điện thoại',
                'ngay_sinh' => 'Ngày sinh',
                'gioi_tinh' => 'Giới tính',
                'dia_chi' => 'Địa chỉ',
                'trang_thai' => 'Trạng thái'
            ];

            foreach ($requiredFields as $field => $label) {
                if (empty($$field)) {
                    $errors[$field] = "$label không được để trống";
                }
            }

            // Xử lý upload ảnh đại diện
            $anh_dai_dien = $old_file; // Mặc định giữ ảnh cũ
            $hinh_anh = $_FILES['anh_dai_dien'] ?? null;
            if (isset($hinh_anh) && $hinh_anh['error'] == UPLOAD_ERR_OK) {
                // Validate định dạng file
                $allowed = ['jpg', 'jpeg', 'png'];
                $file_ext = strtolower(pathinfo($hinh_anh['name'], PATHINFO_EXTENSION));
                error_log("File extension: " . $file_ext);
                if (!in_array($file_ext, $allowed)) {
                    $errors['anh_dai_dien'] = 'Chỉ chấp nhận định dạng file jpg, jpeg hoặc png';
                } else if ($hinh_anh['size'] > 5 * 5024 * 5024) {
                    $errors['anh_dai_dien'] = 'File ảnh không được lớn hơn 5MB';
                } else {
                    // Upload ảnh mới
                    $new_file = uploadFile1($hinh_anh, 'uploads/avatars/'); // Loại bỏ './'
                    if ($new_file) {
                        $anh_dai_dien = $new_file;
                        // Xóa ảnh cũ nếu có
                        if (!empty($old_file)) {
                            deleteFile($old_file);
                        }
                    } else {
                        $errors['anh_dai_dien'] = 'Lỗi khi upload ảnh. Vui lòng kiểm tra định dạng hoặc kích thước file.';
                        error_log("Upload failed for anh_dai_dien: " . $hinh_anh['name'] . ", size: " . $hinh_anh['size']);
                    }
                }
            }

            // Kiểm tra email trùng lặp
            $existing = $this->modelTaiKhoan->checkEmailExists($email, $khach_hang_id);
            if ($existing) {
                $errors['email'] = 'Email đã tồn tại';
            }

            $_SESSION['error'] = $errors;
            error_log("Errors: " . json_encode($errors));

            if (empty($errors)) {
                $result = $this->modelTaiKhoan->updateKhachHang(
                    $khach_hang_id,
                    $ho_ten,
                    $email,
                    $so_dien_thoai,
                    $ngay_sinh,
                    $gioi_tinh,
                    $dia_chi,
                    $trang_thai,
                    $anh_dai_dien
                );

                if ($result) {
                    error_log("Update successful for ID: " . $khach_hang_id);
                    header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-khach-hang');
                    exit();
                } else {
                    $_SESSION['error']['database'] = 'Lỗi khi cập nhật dữ liệu vào cơ sở dữ liệu';
                    error_log("Update failed for ID: " . $khach_hang_id);
                }
            }

            // Nếu có lỗi
            $_SESSION['flash'] = true;
            header("Location: " . BASE_URL_ADMIN . '?act=form-sua-khach-hang&id_khach_hang=' . urlencode($khach_hang_id));
            exit();
        }
    }

    public function detailKhachHang()
    {
        $id = $_GET['id_khach_hang'] ?? null;
        if ($id) {
            $khachHang = $this->modelTaiKhoan->getDetailTaiKhoan($id);
            if ($khachHang) {
                require_once './views/taikhoan/khachhang/detailKhachHang.php';
                return;
            }
        }
        header("Location: " . BASE_URL_ADMIN . '?act=tai-khoan-khach-hang');
        exit();
    }

    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $email = $_POST['email'] ?? '';
            $password = $_POST['password'] ?? '';

            $taiKhoanModel = new AdminTaiKhoan();
            $user = $taiKhoanModel->checkLogin($email, $password);

            if ($user) {
                $_SESSION['user_admin'] = $user; // Đảm bảo $user là mảng
                $_SESSION['success'] = "Đăng nhập thành công!";
                header("Location: " . BASE_URL_ADMIN);
                exit;
            } else {
                $_SESSION['error'] = "Email hoặc mật khẩu không đúng!";
                header("Location: " . BASE_URL_ADMIN . "?act=login-admin");
                exit;
            }
        }
    }
    public function logout()
    {
        if (isset($_SESSION['user_admin'])) {
            unset($_SESSION['user_admin']);
            header("Location :" . BASE_URL_ADMIN . '?act=login-admin');
        }
    }
}
