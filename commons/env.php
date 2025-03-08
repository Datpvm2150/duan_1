<?php 

// Biến môi trường, dùng chung toàn hệ thống
// Khai báo dưới dạng HẰNG SỐ để không phải dùng $GLOBALS

// Đường dẫn vào đến phần client
define('BASE_URL'   , 'http://localhost/duan1-nhom9/');
 
//Đường dẫn vào phần admin
define('BASE_URL_ADMIN'   , 'http://localhost/duan1-nhom9/admin/'); 

define('DB_HOST'    , 'localhost');
define('DB_PORT'    , 3306);
define('DB_NAME'    , 'xuong_thu_cung2');  // Tên database
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');

define('PATH_ROOT'    , __DIR__ . '/../');
