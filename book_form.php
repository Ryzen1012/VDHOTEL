<?php
session_start();

$mysqli = new mysqli('localhost', 'root', '', 'hotel');

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $fullName = $_POST['fullName'];
    $email = $_POST['email'];
    $checkIn = $_POST['checkIn'] ?? '';
    $checkOut = $_POST['checkOut'] ?? '';
    $age = $_POST['age'];
    $paymentMethod = $_POST['paymentMethod'];
    
     if ($age < 18) {
        echo '<script>alert("You must be 18 years or older to book a room."); window.location.href="rooms.php";</script>';
        exit();
    }

    date_default_timezone_set('Asia/Manila');
    $currentDate = date('Y-m-d');
    if ($checkIn < $currentDate || $checkOut <= $checkIn) {
        echo '<script>alert("Invalid check-in/check-out dates."); window.location.href="rooms.php";</script>';
        exit();
    }


    $uploadFile = null;
    if (isset($_FILES['proofOfPayment']) && $_FILES['proofOfPayment']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = 'uploads/';
        $uploadFile = $uploadDir . basename($_FILES['proofOfPayment']['name']);
        move_uploaded_file($_FILES['proofOfPayment']['tmp_name'], $uploadFile);
    }

    if ($uploadFile !== null && !empty($checkIn) && !empty($checkOut)) {
        $stmt = $mysqli->prepare("INSERT INTO bookings (full_name, email, proof_of_payment, check_in, check_out, age, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssis", $fullName, $email, $uploadFile, $checkIn, $checkOut, $age, $paymentMethod);

        if ($stmt->execute()) {
            $_SESSION['booking_success'] = true;
        }

        $stmt->close();
    }
}

$mysqli->close();

header("Location: rooms.php");
exit;
?>
