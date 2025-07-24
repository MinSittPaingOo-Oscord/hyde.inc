<?php include "includes/db.php"; ?>
<?php include "includes/header.php"; ?>
<?php
session_start();
if (isset($_POST['login'])) {
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password'];

    $result = $conn->query("SELECT * FROM users WHERE email = '$email'");
    $user = $result->fetch_assoc();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user'] = $user;
        echo "<script>alert('Login successful!'); window.location='index.php';</script>";
    } else {
        echo "<div class='text-center text-danger'>Invalid email or password</div>";
    }
}
?>

<div class="container mt-5">
  <h2 class="text-center mb-4">Login</h2>
  <form action="login.php" method="post" class="mx-auto" style="max-width: 400px;">
    <div class="mb-3">
      <label>Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button type="submit" name="login" class="btn btn-success w-100">Login</button>
  </form>
</div>



<?php include "includes/footer.php"; ?>
