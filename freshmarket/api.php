<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
mysqli_report(MYSQLI_REPORT_OFF); 

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$servername = "sql301.infinityfree.com";
$username = "if0_41515479"; 
$password = "67051208INF";     
$dbname = "if0_41515479_freshmarket";

$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8mb4");
if ($conn->connect_error) { die(json_encode(["error" => "Connection failed"])); }

$action = isset($_GET['action']) ? $_GET['action'] : '';
$data = json_decode(file_get_contents("php://input"), true);

// =====================================
// 1. ระบบสมัครสมาชิกใหม่ (Register)
// =====================================
if ($action == 'register') {
    // รับค่าที่ส่งมาจากหน้าเว็บ
    $fname = $conn->real_escape_string($data['Firstname']);
    $lname = $conn->real_escape_string($data['Lastname']);
    $uname = $conn->real_escape_string($data['Users_name']);
    $phone = $conn->real_escape_string($data['Phone_number']);

    // --- STEP 1: เช็กก่อนว่า "ชื่อ-นามสกุล" นี้เคยสมัครไว้แล้วหรือยัง? ---
    $checkSql = "SELECT Users_ID FROM users WHERE Firstname = '$fname' AND Lastname = '$lname'";
    $checkResult = $conn->query($checkSql);

    if ($checkResult->num_rows > 0) {
        // ถ้าเจอว่ามีข้อมูลอยู่แล้ว -> ดึงรหัสเดิมมาโชว์ และหยุดการทำงานทันที
        $row = $checkResult->fetch_assoc();
        $existingId = $row['Users_ID'];
        echo json_encode(["status" => "error", "message" => "คุณมีบัญชีอยู่แล้ว! ไอดีของคุณคือ: " . $existingId]);
        exit(); // สั่งเบรก ไม่ให้รันโค้ดสมัครสมาชิกต่อ
    }

    // --- STEP 2: ถ้ารอดจาก STEP 1 มาได้ (เป็นคนใหม่จริง) -> หารหัสล่าสุดเพื่อรันเลขต่อ ---
    $sqlLastId = "SELECT Users_ID FROM users ORDER BY LENGTH(Users_ID) DESC, Users_ID DESC LIMIT 1";
    $resultId = $conn->query($sqlLastId);

    if ($resultId->num_rows > 0) {
        $rowId = $resultId->fetch_assoc();
        $lastId = $rowId['Users_ID']; // เช่น ได้ค่า "user-102" มา
        
        // สกัดเอาเฉพาะตัวเลขออกมา แล้วบวกเพิ่ม 1
        $numberOnly = (int) preg_replace('/[^0-9]/', '', $lastId);
        $nextNumber = $numberOnly + 1;
        $uid = "user-" . $nextNumber; // ประกอบร่างใหม่เป็น "user-103"
    } else {
        // ถ้าตาราง users ว่างเปล่า (คนแรกของเว็บ)
        $uid = "user-101"; 
    }

    // --- STEP 3: บันทึกคนใหม่ลงฐานข้อมูล ---
    $sqlReg = "INSERT INTO users (Users_ID, Firstname, Lastname, Users_name, Phone_number)
               VALUES ('$uid', '$fname', '$lname', '$uname', '$phone')";

    if ($conn->query($sqlReg) === TRUE) {
        echo json_encode(["status" => "success", "message" => "สมัครสมาชิกสำเร็จ! ไอดีของคุณคือ: " . $uid]);
    } else {
        echo json_encode(["status" => "error", "message" => "เกิดข้อผิดพลาด: " . $conn->error]);
    }
}
// =====================================
// 2. ระบบสั่งซื้อสินค้า (Checkout)
// =====================================
elseif ($action == 'checkout') {
    $uid = $data['order']['Users_ID'];
    $type = $data['order']['Oder_type'];
    $date = $data['order']['Oder_date'];
    $total = $data['order']['Users_total'];

    // บันทึก Order
    $sqlOrder = "INSERT INTO orders (Users_ID, Oder_type, Oder_date, Users_total) VALUES ('$uid', '$type', '$date', $total)";
    if ($conn->query($sqlOrder) === TRUE) {
        $order_id = $conn->insert_id;

        // บันทึก Order_Process และ Inventory
        foreach ($data['items'] as $item) {
            $pid = $item['Product_ID'];
            $qty = $item['Quantity'];
            
            $sqlItems = "INSERT INTO order_process (Oder_ID, Product_ID, Quantity) VALUES ($order_id, $pid, $qty)";
            $conn->query($sqlItems);

            // จำลองการตัดสต๊อกลงตาราง Inventory (บันทึกเป็นยอดติดลบ และสถานะ Sold)
            $sqlInv = "INSERT INTO inventory (Product_ID, Inventory_qty, Inventory_status, Inventory_DateReceived) 
                       VALUES ($pid, -$qty, 'Sold', '$date')";
            $conn->query($sqlInv);
        }

        // บันทึก Payment
        $pay_method = $data['payment']['Payment_method'];
        $sqlPayment = "INSERT INTO payment (Oder_ID, Payment_date, Total_amount, Payment_method, Payment_status)
                       VALUES ($order_id, '$date', $total, '$pay_method', 'Paid')";
        $conn->query($sqlPayment);

        // บันทึก Address และ Delivery
        if (isset($data['address'])) {
            $desc = $conn->real_escape_string($data['address']['Address_description']);
            $subd = $conn->real_escape_string($data['address']['Subdistrict']);
            $dist = $conn->real_escape_string($data['address']['District']);
            $prov = $conn->real_escape_string($data['address']['Province']);
            $zip = $conn->real_escape_string($data['address']['Zip_code']);
            $tel = $conn->real_escape_string($data['address']['Tel']);

            $sqlAddr = "INSERT INTO address (Users_ID, Address_description, Subdistrict, District, Province, Zip_code, Tel) 
                        VALUES ('$uid', '$desc', '$subd', '$dist', '$prov', '$zip', '$tel')";
            $conn->query($sqlAddr);
            $address_id = $conn->insert_id; 

            $track_num = 'TRACK-' . rand(1000, 9999);
            $sqlDelivery = "INSERT INTO delivery (Address_ID, Oder_ID, Tracking_Number, Shipping_status, Delivery_date)
                            VALUES ($address_id, $order_id, '$track_num', 'Pending', '$date')";
            $conn->query($sqlDelivery);
        }

        echo json_encode(["status" => "success", "order_id" => $order_id]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
}
// =====================================
// 3. ระบบรีวิวสินค้า (Review)
// =====================================
elseif ($action == 'save_review') {
    $uid = $data['Users_ID'];
    $pid = $data['Product_ID'];
    $date = $data['Review_date'];
    $text = $conn->real_escape_string($data['Review_text']);
    $rating = $data['Review_rating'];

    $sql = "INSERT INTO review (Users_ID, Product_ID, Review_date, Review_text, Review_rating) 
            VALUES ('$uid', $pid, '$date', '$text', $rating)";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
}
// =====================================
// 4. ระบบเข้าสู่ระบบ (Login)
// =====================================
elseif ($action == 'login') {
    $uid = $conn->real_escape_string($data['Users_ID']);
    $sql = "SELECT * FROM users WHERE Users_ID = '$uid'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // ถ้าเจอผู้ใช้นี้ในระบบ
        $user = $result->fetch_assoc();
        echo json_encode(["status" => "success", "user" => $user]);
    } else {
        // ถ้าไม่เจอ
        echo json_encode(["status" => "error", "message" => "ไม่พบ Users_ID นี้ในระบบฐานข้อมูล หรือคุณอาจจะกรอกไอดีผิดครับ"]);
    }
} 
else {
    echo json_encode(["status" => "error", "message" => "Invalid Action"]);
}

$conn->close();
?>
