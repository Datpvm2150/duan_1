<?php
class AdminTaiKhoan
{
    public $conn;
    public function __construct()
    {
        $this->conn = connectDB();
    }


    public function getAllTaiKhoan($chuc_vu_id)
    {
        try {
            $sql = 'SELECT * FROM tai_khoans WHERE chuc_vu_id = :chuc_vu_id ';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':chuc_vu_id' => $chuc_vu_id]);

            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function insertTaiKhoan($ho_ten, $email, $password, $chuc_vu_id)
    {
        try {
            $sql = 'INSERT INTO tai_khoans (ho_ten, email, mat_khau, chuc_vu_id) VALUE (:ho_ten, :email, :password, :chuc_vu_id)';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':ho_ten' => $ho_ten,
                ':email' => $email,
                ':password' => $password,
                ':chuc_vu_id' => $chuc_vu_id
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function getAllKhachHang()
    {
        try {
            $sql = 'SELECT * FROM tai_khoans WHERE chuc_vu_id = 2';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi lấy danh sách khách hàng: " . $e->getMessage());
            return [];
        }
    }
    public function getDetailTaiKhoan($id)
    {
        try {
            $sql = 'SELECT * FROM tai_khoans WHERE id = :id';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':id' => $id]);
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            error_log("Lỗi lấy chi tiết tài khoản: " . $e->getMessage());
            return false;
        }
    }

    public function checkEmailExists($email, $exclude_id = null)
    {
        try {
            $sql = 'SELECT id FROM tai_khoans WHERE email = :email';
            if ($exclude_id) {
                $sql .= ' AND id != :id';
            }
            $stmt = $this->conn->prepare($sql);
            $params = [':email' => $email];
            if ($exclude_id) {
                $params[':id'] = $exclude_id;
            }
            $stmt->execute($params);
            return $stmt->fetch(PDO::FETCH_ASSOC) ? true : false;
        } catch (Exception $e) {
            error_log("Lỗi kiểm tra email: " . $e->getMessage());
            return false;
        }
    }
    public function updateTaiKhoan($id, $ho_ten, $email, $so_dien_thoai,  $trang_thai)
    {
        try {
            $sql = 'UPDATE tai_khoans
                    SET
                        ho_ten = :ho_ten,
                        email = :email,
                        so_dien_thoai = :so_dien_thoai,
                        trang_thai = :trang_thai
                    WHERE id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':ho_ten' => $ho_ten,
                ':email' => $email,
                ':so_dien_thoai' => $so_dien_thoai,
                ':trang_thai' => $trang_thai,
                ':id' => $id
            ]);


            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function resetPassword($id, $mat_khau)
    {
        try {
            $sql = 'UPDATE tai_khoans
                    SET
                        mat_khau = :mat_khau
                    WHERE id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':mat_khau' => $mat_khau,
                ':id' => $id
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function updateKhachHang($id, $ho_ten, $email, $so_dien_thoai, $ngay_sinh, $gioi_tinh, $dia_chi, $trang_thai, $anh_dai_dien = null)
    {
        try {
            $sql = 'UPDATE tai_khoans
                    SET
                        ho_ten = :ho_ten,
                        email = :email,
                        so_dien_thoai = :so_dien_thoai,
                        ngay_sinh = :ngay_sinh,
                        gioi_tinh = :gioi_tinh,
                        dia_chi = :dia_chi,
                        trang_thai = :trang_thai';
            if (!is_null($anh_dai_dien)) {
                $sql .= ', anh_dai_dien = :anh_dai_dien';
            }
            $sql .= ' WHERE id = :id';

            $stmt = $this->conn->prepare($sql);
            $params = [
                ':ho_ten' => $ho_ten,
                ':email' => $email,
                ':so_dien_thoai' => $so_dien_thoai,
                ':ngay_sinh' => $ngay_sinh ?: null,
                ':gioi_tinh' => $gioi_tinh,
                ':dia_chi' => $dia_chi,
                ':trang_thai' => $trang_thai,
                ':id' => $id
            ];
            if (!is_null($anh_dai_dien)) {
                $params[':anh_dai_dien'] = $anh_dai_dien;
            }

            error_log("SQL Query: " . $sql);
            error_log("Parameters: " . json_encode($params));

            if ($stmt->execute($params)) {
                error_log("Rows affected: " . $stmt->rowCount());
                return true;
            } else {
                error_log("Execute failed: " . implode(", ", $stmt->errorInfo()));
                return false;
            }
        } catch (Exception $e) {
            error_log("Lỗi cập nhật tài khoản: " . $e->getMessage());
            return false;
        }
    }

    public function checkLogin($email, $password)
    {
        try {
            $sql = 'SELECT id, ho_ten, email, mat_khau, chuc_vu_id 
                    FROM tai_khoans 
                    WHERE email = :email AND trang_thai = 1';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute(['email' => $email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['mat_khau'])) {
                unset($user['mat_khau']); // Xóa mật khẩu khỏi dữ liệu
                return $user; // Trả về mảng chứa id, ho_ten, email, chuc_vu_id
            }
            return false;
        } catch (Exception $e) {
            error_log("Lỗi kiểm tra đăng nhập: " . $e->getMessage());
            return false;
        }
    }
}
