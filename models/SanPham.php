<?php
class SanPham
{
    public $conn; // Khai báo phương thức
    public function __construct()
    {
        $this->conn = connectDB();
    }
    //Viết hàm lấy toàn bộ danh sách sản phẩm
    public function getAllProduct()
    {
        try {
            $sql = 'SELECT san_phams.*, danh_mucs.ten_danh_muc
                    FROM san_phams
                    INNER JOIN danh_mucs ON san_phams.danh_muc_id = danh_mucs.id';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi: " . $e->getMessage();
            return [];
        }
    }
    public function getDetailtSanPham($id)
    {
        try {
            $sql = 'SELECT san_phams.*, danh_mucs.ten_danh_muc 
                    FROM san_phams 
                    INNER JOIN danh_mucs ON san_phams.danh_muc_id = danh_mucs.id 
                    WHERE san_phams.id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return $stmt->fetch();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function getListAnhSanPham($id)
    {
        try {
            $sql = 'SELECT * FROM hinh_anh_san_phams WHERE san_pham_id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function getBinhLuanFromSanPham($id)
    {
        try {
            $sql = 'SELECT binh_luans.*,tai_khoans.ho_ten, tai_khoans.anh_dai_dien
                    FROM binh_luans
                    INNER JOIN tai_khoans ON binh_luans.tai_khoan_id = tai_khoans.id
                    WHERE binh_luans.san_pham_id = :id';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([':id' => $id]);

            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
    public function getListSanPhamCungDanhMuc($danh_muc_id)
    {
        try {
            $sql = 'SELECT san_phams.*, danh_mucs.ten_danh_muc
            FROM san_phams
            INNER JOIN danh_mucs ON san_phams.danh_muc_id = danh_mucs.id 
            WHERE san_phams.danh_muc_id = ' . $danh_muc_id;

            $stmt = $this->conn->prepare($sql);

            $stmt->execute();

            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function postBinhLuanByIdSanPham($san_pham_id, $tai_khoan_id, $noi_dung, $ngay_dang, $trang_thai)
    {
        try {
            $sql = 'INSERT INTO `binh_luans` (`san_pham_id`,`tai_khoan_id`,`noi_dung`, `ngay_dang`, `trang_thai`)
                    VALUES (:san_pham_id,:tai_khoan_id,:noi_dung,:ngay_dang,:trang_thai) ';

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ':san_pham_id' => $san_pham_id,
                ':tai_khoan_id' => $tai_khoan_id,
                ':noi_dung' => $noi_dung,
                ':ngay_dang' => $ngay_dang,
                ':trang_thai' => $trang_thai
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function searchProducts($keyword)
    {
        try {
            $sql = '
                SELECT san_phams.*, danh_mucs.ten_danh_muc
                FROM san_phams 
                JOIN danh_mucs ON san_phams.danh_muc_id = danh_mucs.id
                WHERE (san_phams.ten_san_pham LIKE :keyword OR danh_mucs.ten_danh_muc LIKE :keyword)
                AND san_phams.trang_thai = 1
                ORDER BY san_phams.ngay_nhap DESC
            ';
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':keyword' => "%$keyword%"]);
            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi: " . $e->getMessage();
        }
    }

    // Lọc sản phẩm theo danh mục và mức giá cố định
    public function filterProducts($danh_muc_id = null, $min_price = null)
    {
        try {
            $sql = 'SELECT san_phams.*, danh_mucs.ten_danh_muc
                    FROM san_phams
                    INNER JOIN danh_mucs ON san_phams.danh_muc_id = danh_mucs.id
                    WHERE 1=1';

            $params = [];

            if ($danh_muc_id) {
                $sql .= ' AND san_phams.danh_muc_id = :danh_muc_id';
                $params[':danh_muc_id'] = $danh_muc_id;
            }

            if ($min_price !== null && $min_price > 0) {
                $sql .= ' AND COALESCE(san_phams.gia_khuyen_mai, san_phams.gia_san_pham) > :min_price';
                $params[':min_price'] = $min_price;
            }

            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi: " . $e->getMessage();
            return [];
        }
    }
}
