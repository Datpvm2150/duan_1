<?php include './views/layouts/header.php'; ?>
<?php include './views/layouts/navbar.php'; ?>
<?php include './views/layouts/siderbar.php'; ?>

<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-11">
                    <h1>Chi tiết tài khoản: <?= htmlspecialchars($khachHang['ho_ten'] ?? '') ?></h1>
                </div>
                <div class="col-1">
                    <a href="<?= BASE_URL_ADMIN . '?act=tai-khoan-khach-hang' ?>" class="btn btn-secondary">Quay lại</a>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="card card-solid">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 col-sm-4">
                        <div class="text-center">
                            <!-- Trong phần hiển thị ảnh -->
                            <img src="<?= !empty($khachHang['anh_dai_dien']) ? BASE_URL . '/' . ltrim($khachHang['anh_dai_dien'], '/') : 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png' ?>"
                                style="width:500px; height:500px; object-fit:cover;"
                                alt="Avatar"
                                onerror="this.onerror=null; this.src='https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'">
                        </div>
                    </div>
                    <div class="col-12 col-sm-8">
                        <h3 class="my-3"><?= htmlspecialchars($khachHang['ho_ten'] ?? '') ?></h3>
                        <hr>
                        <h4>Email: <small><?= htmlspecialchars($khachHang['email'] ?? '') ?></small></h4>
                        <h4>Số điện thoại: <small><?= htmlspecialchars($khachHang['so_dien_thoai'] ?? '') ?></small></h4>
                        <h4>Ngày sinh: <small><?= htmlspecialchars($khachHang['ngay_sinh'] ?? '') ?></small></h4>
                        <h4>Giới tính: <small><?= ($khachHang['gioi_tinh'] ?? '') == 1 ? 'Nam' : 'Nữ' ?></small></h4>
                        <h4>Địa chỉ: <small><?= htmlspecialchars($khachHang['dia_chi'] ?? '') ?></small></h4>
                        <h4>Trạng thái: <small><?= ($khachHang['trang_thai'] ?? '') == 1 ? 'Active' : 'Inactive' ?></small></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php include './views/layouts/footer.php'; ?>
</body>

</html>