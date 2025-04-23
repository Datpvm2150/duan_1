<!-- header -->
<?php include './views/layouts/header.php'; ?>
  <!-- Navbar -->
  <?php include './views/layouts/navbar.php'; ?>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <?php include './views/layouts/siderbar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Báo cáo thống kê</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Thông báo -->
        <?php if (isset($_SESSION['success'])): ?>
            <div class="alert alert-success">
                <?= is_array($_SESSION['success']) ? htmlspecialchars(implode(', ', $_SESSION['success'])) : htmlspecialchars($_SESSION['success']) ?>
            </div>
            <?php unset($_SESSION['success']); ?>
        <?php endif; ?>
        <?php if (isset($_SESSION['error'])): ?>
            <div class="alert alert-danger">
                <?= is_array($_SESSION['error']) ? htmlspecialchars(implode(', ', $_SESSION['error'])) : htmlspecialchars($_SESSION['error']) ?>
            </div>
            <?php unset($_SESSION['error']); ?>
        <?php endif; ?>

        <!-- Tổng doanh thu -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Tổng quan</h3>
              </div>
              <div class="card-body">
                <h4>Tổng doanh thu (Đơn hàng thành công): <?= number_format($tongDoanhThu, 0, ',', '.') ?> VNĐ</h4>
              </div>
            </div>
          </div>
        </div>

        <!-- Đơn hàng theo trạng thái -->
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Thống kê đơn hàng theo trạng thái</h3>
              </div>
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Trạng thái</th>
                      <th>Số lượng đơn hàng</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($donHangTheoTrangThai as $item): ?>
                      <tr>
                        <td><?= htmlspecialchars($item['ten_trang_thai']) ?></td>
                        <td><?= $item['so_luong'] ?></td>
                      </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
                <canvas id="donHangChart" height="150" style="margin-top: 20px;"></canvas>
              </div>
            </div>
          </div>

          <!-- Thống kê tài khoản -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Thống kê tài khoản theo vai trò</h3>
              </div>
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Vai trò</th>
                      <th>Số lượng tài khoản</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($thongKeTaiKhoan as $item): ?>
                      <tr>
                        <td><?= htmlspecialchars($item['ten_chuc_vu']) ?></td>
                        <td><?= $item['so_luong'] ?></td>
                      </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
                <canvas id="taiKhoanChart" height="150" style="margin-top: 20px;"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Thống kê sản phẩm theo danh mục -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Thống kê sản phẩm theo danh mục</h3>
              </div>
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Danh mục</th>
                      <th>Số lượng sản phẩm</th>
                      <th>Số lượng bán ra</th>
                      <th>Doanh thu</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($thongKeDanhMuc as $item): ?>
                      <tr>
                        <td><?= htmlspecialchars($item['ten_danh_muc']) ?></td>
                        <td><?= $item['so_luong_san_pham'] ?></td>
                        <td><?= $item['so_luong_ban'] ?></td>
                        <td><?= number_format($item['doanh_thu'], 0, ',', '.') ?> VNĐ</td>
                      </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<!-- Footer -->
<?php include './views/layouts/footer.php'; ?>
<!-- End Footer -->

<!-- Page specific script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Biểu đồ đơn hàng theo trạng thái
    const ctxDonHang = document.getElementById('donHangChart').getContext('2d');
    const donHangChart = new Chart(ctxDonHang, {
        type: 'bar',
        data: {
            labels: [
                <?php 
                foreach ($donHangTheoTrangThai as $item) {
                    $label = is_array($item['ten_trang_thai']) ? 'Dữ liệu lỗi' : htmlspecialchars($item['ten_trang_thai']);
                    echo "'$label',";
                } 
                ?>
            ],
            datasets: [{
                label: 'Số lượng đơn hàng',
                data: [<?php foreach ($donHangTheoTrangThai as $item) echo $item['so_luong'] . ","; ?>],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Biểu đồ tài khoản theo vai trò
    const ctxTaiKhoan = document.getElementById('taiKhoanChart').getContext('2d');
    const taiKhoanChart = new Chart(ctxTaiKhoan, {
        type: 'pie',
        data: {
            labels: [
                <?php 
                foreach ($thongKeTaiKhoan as $item) {
                    $label = is_array($item['ten_chuc_vu']) ? 'Dữ liệu lỗi' : htmlspecialchars($item['ten_chuc_vu']);
                    echo "'$label',";
                } 
                ?>
            ],
            datasets: [{
                label: 'Số lượng tài khoản',
                data: [<?php foreach ($thongKeTaiKhoan as $item) echo $item['so_luong'] . ","; ?>],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
</script>
</body>
</html>