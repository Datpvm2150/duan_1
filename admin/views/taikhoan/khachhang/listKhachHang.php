<?php include './views/layouts/header.php'; ?>
<?php include './views/layouts/navbar.php'; ?>
<?php include './views/layouts/siderbar.php'; ?>

<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Quản lý tài khoản khách hàng</h1>
        </div>
      </div>
    </div>
  </section>

  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>STT</th>
                    <th>Họ & Tên</th>
                    <th>Ảnh</th>
                    <th>Email</th>
                    <th>Sdt</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($listKhachHang as $key => $khachHang): ?>
                    <tr>
                      <td><?= $key + 1 ?></td>
                      <td><?= htmlspecialchars($khachHang['ho_ten'] ?? '') ?></td>
                      <td>
                        <!-- Trong phần hiển thị ảnh -->
                        <img src="<?= !empty($khachHang['anh_dai_dien']) ? BASE_URL . '/' . ltrim($khachHang['anh_dai_dien'], '/') : 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png' ?>"
                          style="width:100px; height:100px; object-fit:cover;"
                          alt="Avatar"
                          onerror="this.onerror=null; this.src='https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'">
                      </td>
                      <td><?= htmlspecialchars($khachHang['email'] ?? '') ?></td>
                      <td><?= htmlspecialchars($khachHang['so_dien_thoai'] ?? '') ?></td>
                      <td><?= $khachHang['trang_thai'] == 1 ? 'Active' : 'Inactive' ?></td>
                      <td>
                        <div class="btn-group">
                          <a href="<?= BASE_URL_ADMIN . '?act=chi-tiet-khach-hang&id_khach_hang=' . $khachHang['id'] ?>">
                            <button class="btn btn-outline-primary"><i class="far fa-eye"></i></button>
                          </a>
                          <a href="<?= BASE_URL_ADMIN . '?act=form-sua-khach-hang&id_khach_hang=' . $khachHang['id'] ?>">
                            <button class="btn btn-outline-warning"><i class="fas fa-cogs"></i></button>
                          </a>
                        </div>
                      </td>
                    </tr>
                  <?php endforeach ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th>STT</th>
                    <th>Họ & Tên</th>
                    <th>Ảnh</th>
                    <th>Email</th>
                    <th>Sdt</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<?php include './views/layouts/footer.php'; ?>

<script>
  $(function() {
    $("#example1").DataTable({
      "responsive": true,
      "lengthChange": false,
      "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>

</html>