<?php require_once 'layouts/header.php'; ?>
<?php require_once 'layouts/menu.php'; ?>


<style>
    .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    font-size: 16px;
    font-weight: bold;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #004085;
}

.btn-primary i {
    margin-right: 5px;
}
</style>

<main>
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= BASE_URL ?>"><i class="fa fa-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <!-- page main wrapper start -->
    <div class="shop-main-wrapper section-padding">
        <div class="container">
            <div class="row">
                <!-- sidebar area start -->
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="sidebar-wrapper">
                        <!-- single sidebar start -->
                        <div class="sidebar-single">
                            <h5 class="sidebar-title">Danh Mục</h5>
                            <div class="sidebar-body">
                                <ul class="shop-categories">
                                    <li><a href="<?= BASE_URL . '?act=san-pham' ?>" class="<?= !isset($_GET['danh_muc_id']) ? 'active' : '' ?>">Tất cả</a></li>
                                    <?php foreach ($listDanhMuc as $danhMuc): ?>
                                        <li>
                                            <a href="<?= BASE_URL . '?act=san-pham&danh_muc_id=' . $danhMuc['id'] ?>"
                                                class="<?= isset($_GET['danh_muc_id']) && $_GET['danh_muc_id'] == $danhMuc['id'] ? 'active' : '' ?>">
                                                <?= $danhMuc['ten_danh_muc'] ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                        <!-- single sidebar end -->

                        <!-- single sidebar start -->
                        <div class="sidebar-single">
                            <h5 class="sidebar-title">Khoảng Giá</h5>
                            <div class="sidebar-body">
                                <form action="<?= BASE_URL . '?act=san-pham' ?>" method="GET">
                                    <input type="hidden" name="act" value="san-pham">
                                    <?php if (isset($_GET['danh_muc_id'])): ?>
                                        <input type="hidden" name="danh_muc_id" value="<?= $_GET['danh_muc_id'] ?>">
                                    <?php endif; ?>
                                    <div class="price-filter">
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="0" id="all_prices"
                                                <?= !isset($_GET['min_price']) || $_GET['min_price'] == '0' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="all_prices">Tất cả</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="50000" id="price_50000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '50000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_50000">Trên 50.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="500000" id="price_500000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '500000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_500000">Trên 500.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="5000000" id="price_5000000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '5000000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_5000000">Trên 5.000.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="10000000" id="price_10000000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '10000000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_10000000">Trên 10.000.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="20000000" id="price_20000000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '20000000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_20000000">Trên 20.000.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="40000000" id="price_40000000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '40000000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_40000000">Trên 40.000.000đ</label>
                                        </div>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="min_price" value="50000000" id="price_50000000"
                                                <?= isset($_GET['min_price']) && $_GET['min_price'] == '50000000' ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="price_50000000">Trên 50.000.000đ</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-block mt-3 w-100" style="background-color: #007bff; border-color: #007bff; font-size: 16px; font-weight: bold;">
                                            <i class="fa fa-filter"></i> Lọc sản phẩm
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- single sidebar end -->
                    </aside>
                </div>
                <!-- sidebar area end -->

                <!-- shop main wrapper start -->
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="shop-product-wrapper">
                        <!-- shop product top wrap start -->
                        <div class="shop-top-bar">
                            <div class="row align-items-center">
                                <div class="col-lg-7 col-md-6 order-2 order-md-1">
                                    <div class="top-bar-left">
                                        <div class="product-view-mode">
                                            <a class="active" href="#" data-target="grid-view" data-bs-toggle="tooltip" title="Grid View"><i class="fa fa-th"></i></a>
                                            <a href="#" data-target="list-view" data-bs-toggle="tooltip" title="List View"><i class="fa fa-list"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- shop product top wrap start -->

                        <!-- product item list wrapper start -->
                        <div class="shop-product-wrap grid-view row mbn-30">
                            <?php if (empty($listSanPham)): ?>
                                <div class="col-12">
                                    <p>Không tìm thấy sản phẩm phù hợp.</p>
                                </div>
                            <?php else: ?>
                                <?php foreach ($listSanPham as $sanPham): ?>
                                    <div class="col-md-4 col-sm-6">
                                        <!-- product grid start -->
                                        <div class="product-item">
                                            <figure class="product-thumb">
                                                <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">
                                                    <img class="pri-img" width="200px" height="200px" src="<?= BASE_URL . $sanPham['hinh_anh'] ?>" alt="product">
                                                    <img class="sec-img" width="200px" height="200px" src="<?= BASE_URL . $sanPham['hinh_anh'] ?>" alt="product">
                                                </a>
                                                <div class="product-badge">
                                                    <?php
                                                    $ngayNhap = new DateTime($sanPham['ngay_nhap']);
                                                    $ngayHienTai = new DateTime();
                                                    $tinhNgay = $ngayHienTai->diff($ngayNhap);
                                                    if ($tinhNgay->days <= 7):
                                                    ?>
                                                        <div class="product-label new">
                                                            <span>Mới</span>
                                                        </div>
                                                    <?php endif; ?>
                                                    <?php if ($sanPham['gia_khuyen_mai']): ?>
                                                        <div class="product-label discount">
                                                            <span>Giảm giá</span>
                                                        </div>
                                                    <?php endif; ?>
                                                </div>
                                                <div class="cart-hover">
                                                    <button class="btn btn-cart">
                                                        <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">Xem chi tiết</a>
                                                    </button>
                                                </div>
                                            </figure>

                                            <div class="product-caption text-center">
                                                <div class="product-identity">
                                                    <p class="manufacturer-name"><?= $sanPham['ten_danh_muc'] ?></p>
                                                </div>
                                                <h6 class="product-name">
                                                    <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>"><?= $sanPham['ten_san_pham'] ?></a>
                                                </h6>
                                                <div class="price-box">
                                                    <?php if ($sanPham['gia_khuyen_mai']): ?>
                                                        <span class="price-regular"><?= formatPrice($sanPham['gia_khuyen_mai']) ?>đ</span>
                                                        <span class="price-old"><del><?= formatPrice($sanPham['gia_san_pham']) ?>đ</del></span>
                                                    <?php else: ?>
                                                        <span class="price-regular"><?= formatPrice($sanPham['gia_san_pham']) ?>đ</span>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- product grid end -->

                                        <!-- product list item start -->
                                        <div class="product-list-item">
                                            <figure class="product-thumb">
                                                <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">
                                                    <img class="pri-img" src="<?= BASE_URL . $sanPham['hinh_anh'] ?>" alt="product">
                                                    <img class="sec-img" src="<?= BASE_URL . $sanPham['hinh_anh'] ?>" alt="product">
                                                </a>
                                                <div class="product-badge">
                                                    <?php
                                                    $ngayNhap = new DateTime($sanPham['ngay_nhap']);
                                                    $ngayHienTai = new DateTime();
                                                    $tinhNgay = $ngayHienTai->diff($ngayNhap);
                                                    if ($tinhNgay->days <= 7):
                                                    ?>
                                                        <div class="product-label new">
                                                            <span>Mới</span>
                                                        </div>
                                                    <?php endif; ?>
                                                    <?php if ($sanPham['gia_khuyen_mai']): ?>
                                                        <div class="product-label discount">
                                                            <span>Giảm giá</span>
                                                        </div>
                                                    <?php endif; ?>
                                                </div>
                                                <div class="cart-hover">
                                                    <button class="btn btn-cart">
                                                        <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>">Xem chi tiết</a>
                                                    </button>
                                                </div>
                                            </figure>
                                            <div class="product-content-list">
                                                <div class="manufacturer-name">
                                                    <p class="manufacturer-name"><?= $sanPham['ten_danh_muc'] ?></p>
                                                </div>
                                                <h5 class="product-name">
                                                    <a href="<?= BASE_URL . '?act=chi-tiet-san-pham&id_san_pham=' . $sanPham['id'] ?>"><?= $sanPham['ten_san_pham'] ?></a>
                                                </h5>
                                                <div class="price-box">
                                                    <?php if ($sanPham['gia_khuyen_mai']): ?>
                                                        <span class="price-regular"><?= formatPrice($sanPham['gia_khuyen_mai']) ?>đ</span>
                                                        <span class="price-old"><del><?= formatPrice($sanPham['gia_san_pham']) ?>đ</del></span>
                                                    <?php else: ?>
                                                        <span class="price-regular"><?= formatPrice($sanPham['gia_san_pham']) ?>đ</span>
                                                    <?php endif; ?>
                                                </div>
                                                <p><?= $sanPham['mo_ta'] ?></p>
                                            </div>
                                        </div>
                                        <!-- product list item end -->
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                        <!-- product item list wrapper end -->
                    </div>
                </div>
                <!-- shop main wrapper end -->
            </div>
        </div>
    </div>
    <!-- page main wrapper end -->
</main>

<?php require_once 'layouts/miniCart.php' ?>
<?php require_once 'layouts/footer.php' ?>