<?php
session_start();
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $passcode = $_POST['passcode'];

    // Prepare and execute query
    $stmt = $conn->prepare("SELECT accountID, name, passcode, roleID FROM account WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
        if (password_verify($passcode, $user['passcode'])) {
            // Successful login
            $_SESSION['user_id'] = $user['accountID'];
            $_SESSION['user_name'] = $user['name'];
            $_SESSION['role_id'] = $user['roleID'];
            header("Location: profile.php"); // Redirect to profile page
            exit();
        } else {
            $_SESSION['error'] = "Invalid password.";
        }
    } else {
        $_SESSION['error'] = "No account found with that email.";
    }
    $stmt->close();
    header("Location: index.php"); // Redirect back to login page with error
    exit();
}
$conn->close();
?>