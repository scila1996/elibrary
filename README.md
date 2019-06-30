## Phần mềm quản lý thư viện - eLibrary (Project 01)

**Chức năng**
 - Quản lý thông tin lưu trữ đầu sách, danh mục, số lượng.
 - Quản lý Users
   mượn sách và trạng thái, ngày giờ, tính tiền mượn.

**Cài đặt**

 - [ ] **Apache2**: *v2.2 - 2.4 hoặc cao hơn*.
 - [ ] **MySQL**: *v5.5 hoặc cao hơn*.
 - [ ] **PHP**: *v5.6 hoặc cao hơn*

 - Clone và đẩy lên Server Apache2 và MySQL
 - Cấu hình
  Tạo một file "config.db.php" đặt trong thư mục "config" như sau:
  

        <?php
        $host = "Host";
        $user = "User";
        $pass = "Pass";
        $dbname = "elibrary";
        $charset = "utf8";
