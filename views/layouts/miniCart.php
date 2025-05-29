<!-- offcanvas mini cart start -->
<div class="offcanvas-minicart-wrapper">
    <div class="minicart-inner">
        <div class="offcanvas-overlay"></div>
        <div class="minicart-inner-content">
            <div class="minicart-close">
                <i class="pe-7s-close"></i>
            </div>
            <div class="minicart-content-box">
                <div class="minicart-item-wrapper">
                    <?php if(isset($_SESSION['user_client'])){ ?>
                        <?php 
                            // Initialize $chiTietGioHang as an empty array if not set
                            $chiTietGioHang = isset($chiTietGioHang) && is_array($chiTietGioHang) ? $chiTietGioHang : [];
                            $tongGioHang = 0;
                        ?>
                        <ul>
                            <?php if (!empty($chiTietGioHang)): ?>
                                <?php foreach($chiTietGioHang as $key => $sanPham): ?>
                                    <li class="minicart-item">
                                        <div class="minicart-thumb">
                                            <a href="product-details.html">
                                                <img src="<?= BASE_URL . $sanPham['hinh_anh'] ?>" height="80px" width="80px" alt="product">
                                            </a>
                                        </div>
                                        <div class="minicart-content">
                                            <h3 class="product-name">
                                                <a href="product-details.html"><?= $sanPham['ten_san_pham'] ?></a>
                                            </h3>
                                            <p>
                                                <span class="cart-quantity"><?= $sanPham['so_luong'] ?> <strong>×</strong></span>
                                                <span class="cart-price"><?= formatPrice($sanPham['gia_san_pham']) ?>đ</span>
                                            </p>
                                        </div>
                                        <button class="minicart-remove"><i class="pe-7s-close"></i></button>
                                    </li>
                                    <?php 
                                        $tong_tien = $sanPham['gia_san_pham'] * $sanPham['so_luong'];
                                        $tongGioHang += $tong_tien;
                                    ?>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <li>Chưa có sản phẩm nào trong giỏ hàng.</li>
                            <?php endif; ?>
                        </ul>
                        <div class="minicart-pricing-box">
                            <ul>
                                <li>
                                    <span>Tổng đơn hàng</span>
                                    <span><strong><?= formatPrice($tongGioHang) ?>đ</strong></span>
                                </li>
                                <li>
                                    <span>Phí vận chuyển</span>
                                    <span><strong>20.000đ</strong></span>
                                </li>
                                <li class="total">
                                    <span>Tổng tiền</span>
                                    <span><strong><?= formatPrice($tongGioHang + 20000) ?>đ</strong></span>
                                </li>
                            </ul>
                        </div>
                        <div class="minicart-button">
                            <a href="<?= BASE_URL . '?act=gio-hang' ?>"><i class="fa fa-shopping-cart"></i> Xem giỏ hàng</a>
                            <a href="<?= BASE_URL . '?act=thanh-toan' ?>"><i class="fa fa-share"></i> Thanh toán</a>
                        </div>
                    <?php } else { ?>
                        <p>Chưa có sản phẩm nào trong giỏ hàng.</p>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- offcanvas mini cart end -->