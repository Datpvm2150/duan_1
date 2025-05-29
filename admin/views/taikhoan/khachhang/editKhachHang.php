<?php include './views/layouts/header.php'; ?>
<?php include './views/layouts/navbar.php'; ?>
<?php include './views/layouts/siderbar.php'; ?>

<div class="content-wrapper">
    <!-- Content Header -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2 align-items-center">
                <div class="col-sm-10">
                    <h1 class="m-0"><i class="fas fa-user-edit mr-2"></i>Sửa thông tin tài khoản: <?= htmlspecialchars($khachHang['ho_ten'] ?? '') ?></h1>
                </div>
                <div class="col-sm-2 text-right">
                    <a href="<?= BASE_URL_ADMIN . '?act=tai-khoan-khach-hang' ?>" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left mr-1"></i>Quay lại</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Form Column -->
                <div class="col-lg-8 col-md-12">
                    <div class="card card-primary shadow-sm">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-info-circle mr-1"></i>Thông tin tài khoản</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <form action="<?= BASE_URL_ADMIN . '?act=sua-khach-hang' ?>" method="post" enctype="multipart/form-data">
                            <div class="card-body">
                                <input type="hidden" name="khach_hang_id" value="<?= htmlspecialchars($khachHang['id'] ?? '') ?>">

                                <div class="form-group">
                                    <label for="ho_ten">Họ & Tên <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        </div>
                                        <input type="text" id="ho_ten" name="ho_ten" class="form-control" value="<?= htmlspecialchars($khachHang['ho_ten'] ?? '') ?>" placeholder="Nhập họ và tên">
                                    </div>
                                    <?php if (isset($_SESSION['error']['ho_ten'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['ho_ten'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                        </div>
                                        <input type="email" id="email" name="email" class="form-control" value="<?= htmlspecialchars($khachHang['email'] ?? '') ?>" placeholder="Nhập email">
                                    </div>
                                    <?php if (isset($_SESSION['error']['email'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['email'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="so_dien_thoai">Số điện thoại <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                        </div>
                                        <input type="text" id="so_dien_thoai" name="so_dien_thoai" class="form-control" value="<?= htmlspecialchars($khachHang['so_dien_thoai'] ?? '') ?>" placeholder="Nhập số điện thoại">
                                    </div>
                                    <?php if (isset($_SESSION['error']['so_dien_thoai'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['so_dien_thoai'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="ngay_sinh">Ngày sinh <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                        </div>
                                        <input type="date" id="ngay_sinh" name="ngay_sinh" class="form-control" value="<?= htmlspecialchars($khachHang['ngay_sinh'] ?? '') ?>">
                                    </div>
                                    <?php if (isset($_SESSION['error']['ngay_sinh'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['ngay_sinh'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="gioi_tinh">Giới tính <span class="text-danger">*</span></label>
                                    <select id="gioi_tinh" name="gioi_tinh" class="form-control custom-select">
                                        <option value="" disabled>Chọn giới tính</option>
                                        <option value="1" <?= ($khachHang['gioi_tinh'] ?? '') == 1 ? 'selected' : '' ?>>Nam</option>
                                        <option value="2" <?= ($khachHang['gioi_tinh'] ?? '') == 2 ? 'selected' : '' ?>>Nữ</option>
                                    </select>
                                    <?php if (isset($_SESSION['error']['gioi_tinh'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['gioi_tinh'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="dia_chi">Địa chỉ <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                        </div>
                                        <input type="text" id="dia_chi" name="dia_chi" class="form-control" value="<?= htmlspecialchars($khachHang['dia_chi'] ?? '') ?>" placeholder="Nhập địa chỉ">
                                    </div>
                                    <?php if (isset($_SESSION['error']['dia_chi'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['dia_chi'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="anh_dai_dien">Ảnh đại diện</label>
                                    <div class="mb-3 text-center">
                                        <img id="avatar-preview"
                                            src="<?= !empty($khachHang['anh_dai_dien']) ? BASE_URL . '/' . $khachHang['anh_dai_dien'] : 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png' ?>"
                                            class="img-fluid rounded-circle shadow-sm avatar-img"
                                            alt="Avatar"
                                            onerror="this.onerror=null; this.src='https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'">
                                    </div>
                                    <div class="custom-file">
                                        <input type="file" id="anh_dai_dien" name="anh_dai_dien" class="custom-file-input" accept="image/*">
                                        <label class="custom-file-label" for="anh_dai_dien">Chọn ảnh...</label>
                                    </div>
                                    <?php if (isset($_SESSION['error']['anh_dai_dien'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['anh_dai_dien'] ?></p>
                                    <?php endif; ?>
                                </div>

                                <div class="form-group">
                                    <label for="trang_thai">Trạng thái <span class="text-danger">*</span></label>
                                    <select id="trang_thai" name="trang_thai" class="form-control custom-select">
                                        <option value="" disabled>Chọn trạng thái</option>
                                        <option value="1" <?= ($khachHang['trang_thai'] ?? '') == 1 ? 'selected' : '' ?>>Active</option>
                                        <option value="0" <?= ($khachHang['trang_thai'] ?? '') == 0 ? 'selected' : '' ?>>Inactive</option>
                                    </select>
                                    <?php if (isset($_SESSION['error']['trang_thai'])): ?>
                                        <p class="text-danger mt-1"><i class="fas fa-exclamation-circle mr-1"></i><?= $_SESSION['error']['trang_thai'] ?></p>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-primary btn-lg mr-2"><i class="fas fa-save mr-1"></i>Cập nhật</button>
                                <a href="<?= BASE_URL_ADMIN . '?act=tai-khoan-khach-hang' ?>" class="btn btn-secondary btn-lg"><i class="fas fa-times mr-1"></i>Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Preview Column -->
                <div class="col-lg-4 col-md-12">
                    <div class="card card-info shadow-sm">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-user-circle mr-1"></i>Xem trước</h3>
                        </div>
                        <div class="card-body text-center">
                            <img id="avatar-preview-sidebar"
                                src="<?= !empty($khachHang['anh_dai_dien']) ? BASE_URL . '/' . $khachHang['anh_dai_dien'] : 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png' ?>"
                                class="img-fluid rounded-circle shadow avatar-img mb-3"
                                alt="Avatar"
                                onerror="this.onerror=null; this.src='https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'">
                            <h4><?= htmlspecialchars($khachHang['ho_ten'] ?? 'Không có tên') ?></h4>
                            <p class="text-muted"><?= htmlspecialchars($khachHang['email'] ?? 'Không có email') ?></p>
                            <p class="text-muted mb-0"><strong>Trạng thái:</strong> <?= ($khachHang['trang_thai'] ?? '') == 1 ? 'Active' : 'Inactive' ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php include './views/layouts/footer.php'; ?>

<!-- Custom CSS -->
<style>
    .avatar-img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .avatar-img:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .card {
        border-radius: 8px;
    }

    .card-header {
        background-color: #007bff;
        color: white;
    }

    .btn-primary,
    .btn-secondary {
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
    }

    .text-danger {
        font-size: 0.9em;
    }

    .custom-file-label::after {
        content: "Tìm kiếm";
    }

    @media (max-width: 767px) {
        .avatar-img {
            width: 100px;
            height: 100px;
        }

        .card-footer .btn {
            width: 100%;
            margin-bottom: 10px;
        }
    }
</style>

<!-- JavaScript for Image Preview -->
<script>
    document.getElementById('anh_dai_dien').addEventListener('change', function(event) {
        const [file] = event.target.files;
        if (file) {
            const preview = document.getElementById('avatar-preview');
            const previewSidebar = document.getElementById('avatar-preview-sidebar');
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                previewSidebar.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    // Update custom file input label
    document.getElementById('anh_dai_dien').addEventListener('change', function() {
        const fileName = this.files[0] ? this.files[0].name : 'Chọn ảnh...';
        this.nextElementSibling.innerText = fileName;
    });
</script>

</body>

</html>