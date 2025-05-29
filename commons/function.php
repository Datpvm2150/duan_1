<?php

// Kết nối CSDL qua PDO
function connectDB()
{
    // Kết nối CSDL
    $host = DB_HOST;
    $port = DB_PORT;
    $dbname = DB_NAME;

    try {
        $conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", DB_USERNAME, DB_PASSWORD);

        // cài đặt chế độ báo lỗi là xử lý ngoại lệ
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // cài đặt chế độ trả dữ liệu
        $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        return $conn;
    } catch (PDOException $e) {
        echo ("Connection failed: " . $e->getMessage());
    }
}


//Thêm file
function uploadFile($file, $folderUpload)
{
    $pathStorage = $folderUpload . time() . $file['name'];

    $from = $file['tmp_name'];
    $to = PATH_ROOT . $pathStorage;

    if (move_uploaded_file($from, $to)) {
        return $pathStorage;
    }
    return null;
}
//Xóa file
function deleteFile($file)
{
    $pathStorage = PATH_ROOT . $file;
    if (file_exists($pathStorage)) {
        unlink($pathStorage);
    }
}

//Xóa Session sau khi load trang
function deleteSessionError()
{
    if (isset($_SESSION['flash'])) {
        //Hủy Session sau khi đã tải trang
        unset($_SESSION['flash']);
        session_unset();
        session_destroy();
    }
}

//Upload- update album ảnh
function uploadFileAlbum($file, $folderUpload, $key)
{
    $pathStorage = $folderUpload . time() . $file['name'][$key];

    $from = $file['tmp_name'][$key];
    $to = PATH_ROOT . $pathStorage;

    if (move_uploaded_file($from, $to)) {
        return $pathStorage;
    }
    return null;
}
// format giá tiền
function formatPrice($price)
{
    return number_format($price, 0, ',', '.');
}

// format date
function formatDate($date)
{
    return $date = date("d-m-Y", strtotime($date));
}
//Debug

function uploadFile1($file, $folderUpload)
{
    if ($file['error'] !== UPLOAD_ERR_OK) {
        error_log("Upload error code: " . $file['error']);
        return null;
    }
    if ($file['size'] > 5 * 5024 * 5024) { // 5MB
        error_log("File size exceeds limit: " . $file['size'] . " bytes");
        return null;
    }

    // Loại bỏ './' ở đầu và đảm bảo đường dẫn sạch
    $folderUpload = ltrim($folderUpload, './');
    $pathStorage = $folderUpload . time() . $file['name'];
    $to = rtrim(PATH_ROOT, '/') . '/' . $pathStorage;

    error_log("Upload path: $to");

    // Tạo thư mục nếu chưa tồn tại
    $dir = dirname($to);
    if (!is_dir($dir)) {
        mkdir($dir, 0775, true);
        error_log("Created directory: $dir");
    }

    $from = $file['tmp_name'];
    if (!file_exists($from) || !is_readable($from)) {
        error_log("Temporary file not found or not readable: $from");
        return null;
    }

    if (move_uploaded_file($from, $to)) {
        return $pathStorage; // Trả về uploads/avatars/1234567890image.jpg
    } else {
        error_log("Failed to move uploaded file: from $from to $to");
        return null;
    }
}
