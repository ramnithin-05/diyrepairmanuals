<?php
// Database connection
$servername = "localhost";
$username = "root"; // Default XAMPP username
$password = ""; // Default XAMPP password is empty
$dbname = "diy_repair_manuals";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form data is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Default role is 'user'
    $role = 'user';

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL) || !preg_match("/^[a-zA-Z0-9._%+-]+@gmail\.com$/", $email)) {
        $message = "Invalid email address. Please use a valid @gmail.com email without special characters.";
        header("Location: register.php?message=" . urlencode($message));
        exit();
    }

    // Check if username or email already exists
    $checkSql = "SELECT * FROM users WHERE username = ? OR email = ?";
    $stmt = $conn->prepare($checkSql);
    $stmt->bind_param("ss", $username, $email);
    $stmt->execute();
    $checkResult = $stmt->get_result();

    if ($checkResult->num_rows > 0) {
        // Username or email already exists
        $message = "Username or email already exists. Please choose a different one.";
        header("Location: register.php?message=" . urlencode($message));
        exit();
    }

    // Prepare SQL query to insert data
    $insertSql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($insertSql);
    $stmt->bind_param("ssss", $username, $email, $password, $role);

    // Execute the query and check for errors
    if ($stmt->execute()) {
        // Redirect to login page with success message
        $message = "Registered successfully! Please log in.";
        header("Location: login.php?status=success");
    } else {
        $message = "Error: Could not register user. Please try again.";
        header("Location: register.php?message=" . urlencode($message));
    }

    // Close the statement
    $stmt->close();
}

// Close the connection
$conn->close();
?>
