<?php include "includes/db.php"; ?>
<?php include "includes/header.php"; ?>

<div class="container mt-5">
  <h2 class="text-center mb-4">Register</h2>
  <form action="register.php" method="post" class="mx-auto" style="max-width: 400px;">
    <div class="mb-3">
      <label>Name</label>
      <input type="text" name="name" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button type="submit" name="register" class="btn btn-primary w-100">Register</button>
  </form>
</div>

<?php
if (isset($_POST['register'])) {
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$password')";
    if ($conn->query($sql)) {
        echo "<script>alert('Registered successfully!'); window.location='login.php';</script>";
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<?php include "includes/footer.php"; ?>
