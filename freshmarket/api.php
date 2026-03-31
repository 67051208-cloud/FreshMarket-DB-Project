<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
mysqli_report(MYSQLI_REPORT_OFF); 

// โค้ดเดิมของคุณต่อจากตรงนี้...
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
    // -----------------------------------------------------
        // ระบบรัน Auto-ID ไม่ให้ซ้ำกันแม้จะปิดเบราว์เซอร์
        // -----------------------------------------------------
        $sqlLastId = "SELECT Users_ID FROM users ORDER BY Users_ID DESC LIMIT 1";
        $resultId = $conn->query($sqlLastId);

        if ($resultId->num_rows > 0) {
            $rowId = $resultId->fetch_assoc();
            $lastId = $rowId['Users_ID']; // ดึง ID ล่าสุดมา เช่น "user-107"
            
            // สกัดเอาเฉพาะตัวเลขออกมา แล้วบวกเพิ่มไปอีก 1
            $numberOnly = (int) preg_replace('/[^0-9]/', '', $lastId);
            $nextNumber = $numberOnly + 1;
            
            $uid = "user-" . $nextNumber; // ประกอบร่างใหม่เป็น "user-108"
        } else {
            // ถ้ายังไม่มีสมาชิกในระบบเลย ให้เริ่มคนแรกที่ 101
            $uid = "user-101"; 
        }
        // -----------------------------------------------------
    $fname = $conn->real_escape_string($data['Firstname']);
    $lname = $conn->real_escape_string($data['Lastname']);
    $uname = $conn->real_escape_string($data['Users_name']);
    $phone = $conn->real_escape_string($data['Phone_number']);

    $sqlReg = "INSERT INTO users (Users_ID, Firstname, Lastname, Users_name, Phone_number) 
               VALUES ('$uid', '$fname', '$lname', '$uname', '$phone')";
    if ($conn->query($sqlReg) === TRUE) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
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
else {
    echo json_encode(["status" => "error", "message" => "Invalid Action"]);
}

$conn->close();
?>
