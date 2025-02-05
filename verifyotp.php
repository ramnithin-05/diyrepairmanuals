<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $enteredOtp = $_POST['otp'];
    if ($enteredOtp == $_SESSION['otp']) {
        $tempUser = $_SESSION['temp_user'];
        $username = $tempUser['username'];
        $email = $tempUser['email'];
        $password = $tempUser['password'];

        $conn = new mysqli("localhost", "root", "", "diy_repair_manuals");

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $role = 'user';
        $insertSql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($insertSql);
        $stmt->bind_param("ssss", $username, $email, $password, $role);

        if ($stmt->execute()) {
            unset($_SESSION['otp']);
            unset($_SESSION['temp_user']);
            header("Location: login.php?status=success");
        } else {
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
        $conn->close();
    } else {
        $message = "Invalid OTP. Please try again.";
        header("Location: verifyotp.php?message=" . urlencode($message));
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP</title>
</head>
<body>
    <h2>Verify OTP</h2>
    <?php if (isset($_GET['message'])): ?>
        <p style="color: red;"><?php echo htmlspecialchars($_GET['message']); ?></p>
    <?php endif; ?>
    <form action="verifyotp.php" method="POST">
        <label for="otp">Enter OTP</label>
        <input type="text" id="otp" name="otp" required>
        <button type="submit">Verify</button>
    </form>
</body>
</html>
