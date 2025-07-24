<?php
session_start();
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $passcode = password_hash($_POST['passcode'], PASSWORD_DEFAULT);
    $phoneNumber = filter_var($_POST['phoneNumber'], FILTER_SANITIZE_STRING);
    $address = filter_var($_POST['address'], FILTER_SANITIZE_STRING);
    $registrationDate = date('Y-m-d');
    $roleID = 2; // Default to 'customer' role (roleID = 2)

    // Check if email already exists
    $stmt = $conn->prepare("SELECT accountID FROM account WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    if ($stmt->get_result()->num_rows > 0) {
        $_SESSION['error'] = "Email already registered.";
        header("Location: index.php");
        exit();
    }
    $stmt->close();

    // Insert into account table
    $stmt = $conn->prepare("INSERT INTO account (name, email, passcode, phoneNumber, registrationDate, roleID) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssi", $name, $email, $passcode, $phoneNumber, $registrationDate, $roleID);
    if ($stmt->execute()) {
        $accountID = $stmt->insert_id;

        // Insert into address table
        $stmt = $conn->prepare("INSERT INTO address (address, accountID) VALUES (?, ?)");
        $stmt->bind_param("si", $address, $accountID);
        if ($stmt->execute()) {
            $_SESSION['success'] = "Registration successful! Please log in.";
            header("Location: index.php");
            exit();
        } else {
            $_SESSION['error'] = "Error saving address.";
        }
        $stmt->close();
    } else {
        $_SESSION['error'] = "Error creating account.";
    }
    $stmt->close();
    header("Location: index.php");
    exit();
}
$conn->close();
?>