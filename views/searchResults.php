<?php require_once 'layouts/header.php'; ?>
<?php require_once 'layouts/menu.php'; ?>


<style>
    /* CSS chỉnh sửa ảnh sản phẩm */
    .product-item img {
        width: 100%;
        /* Đảm bảo ảnh chiếm toàn bộ chiều rộng của khung */
        height: 200px;
        /* Chiều cao cố định */
        object-fit: contain;
        /* Hiển thị toàn bộ ảnh mà không bị cắt */
        border-radius: 10px;
        /* Bo góc ảnh */
        background-color: #f9f9f9;
        /* Thêm nền để ảnh không bị trống */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        /* Hiệu ứng hover */
    }

    .product-item img:hover {
        transform: scale(1.05);
        /* Phóng to nhẹ khi hover */
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        /* Đổ bóng khi hover */
    }

    /* Căn chỉnh nội dung sản phẩm */
    .product-item .card-body {
        padding: 15px;
        text-align: center;
    }

    .product-item .card-title a {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .product-item .card-title a:hover {
        color: #e74c3c;
        /* Đổi màu chữ khi hover */
    }

    .product-item .card-text {
        font-size: 14px;
        color: #666;
        margin-bottom: 5px;
    }

    .product-item .card-text.text-danger {
        font-size: 14px;
        font-weight: bold;
        color: #e74c3c;
    }
</style>


<main>
    <div class="search-results text-center my-4">
        <h2>Kết quả tìm kiếm</h2>
        <?php if (empty($listSanPham)): ?>
            <p class="text-muted">Không tìm thấy sản phẩm nào phù hợp.</p>
        <?php else: ?>
            <div class="row row-cols-1 row-cols-md-3 g-4 product-grid">
                <?php foreach ($listSanPham as $sanPham): ?>
                    <div class="col">
                        <div class="card h-100 text-center product-item">
                            <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">
                                <img
                                    src="<?= $sanPham['hinh_anh']; ?>"
                                    class="card-img-top"
                                    alt="<?= $sanPham['ten_san_pham']; ?>">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">
                                        <?= $sanPham['ten_san_pham']; ?>
                                    </a>
                                </h5>
                                <p class="card-text">Danh mục: <?= $sanPham['ten_danh_muc']; ?></p>
                                <p class="card-text">Giá: <?= number_format($sanPham['gia_san_pham'], 0, ',', '.'); ?> VND</p>
                                <?php if ($sanPham['gia_khuyen_mai']): ?>
                                    <p class="card-text text-danger">Giá khuyến mãi: <?= number_format($sanPham['gia_khuyen_mai'], 0, ',', '.'); ?> VND</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</main>

<?php require_once 'layouts/miniCart.php' ?>
<?php require_once 'layouts/footer.php' ?>