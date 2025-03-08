<?php include './views/layouts/header.php'; ?>

<?php include './views/layouts/navbar.php'; ?>



<?php include './views/layouts/siderbar.php'; ?>


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản lý tài khoản khách hàng</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-4">
                        <td>
                            <img src="<?= BASE_URL . $khachHang['anh_dai_dien'] ?>" style="width:100%" alt="" onerror="this.onerror=null; this.src='https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'">
                        </td>  
                </div>
                <div class="col-8">
                    <div class="container">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <th>Họ tên :</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Trạng Thái</th>
                                </tr>
                                <tr>
                                    <td><?= $khachHang['ho_ten'] ?></td>
                                    <td><?= $khachHang['email'] ?></td>
                                    <td><?= $khachHang['so_dien_thoai'] ?></td>
                                    <td><?= $khachHang['trang_thai'] ==1 ? 'Active':'Inactive' ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Footer -->
<?php include './views/layouts/footer.php'; ?>
<!-- End Footer -->

</body>

</html>