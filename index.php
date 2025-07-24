<?php
include 'config.php';
include 'header.php';
?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Login Form -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Login</h4>
                </div>
                <div class="card-body">
                    <form id="loginForm" action="process_login.php" method="POST">
                        <div class="mb-3">
                            <label for="loginEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="loginEmail" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="loginPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="loginPassword" name="passcode" required>
                        </div>
                        <div id="loginError" class="text-danger mb-3" style="display: none;"></div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Registration Form -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0">Register</h4>
                </div>
                <div class="card-body">
                    <form id="registerForm" action="process_register.php" method="POST">
                        <div class="mb-3">
                            <label for="registerName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="registerName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="registerEmail" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="registerPassword" name="passcode" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerConfirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="registerConfirmPassword" name="confirm_passcode" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerPhone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="registerPhone" name="phoneNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerAddress" class="form-label">Address</label>
                            <textarea class="form-control" id="registerAddress" name="address" rows="4" required></textarea>
                        </div>
                        <div id="registerError" class="text-danger mb-3" style="display: none;"></div>
                        <button type="submit" class="btn btn-success w-100">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    // Login form validation
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        var email = $('#loginEmail').val();
        var password = $('#loginPassword').val();
        var error = '';

        if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            error = 'Please enter a valid email address.';
        } else if (!password) {
            error = 'Please enter a password.';
        }

        if (error) {
            $('#loginError').text(error).show();
        } else {
            $('#loginError').hide();
            this.submit(); // Submit the form if validation passes
        }
    });

    // Registration form validation
    $('#registerForm').submit(function(e) {
        e.preventDefault();
        var name = $('#registerName').val();
        var email = $('#registerEmail').val();
        var password = $('#registerPassword').val();
        var confirmPassword = $('#registerConfirmPassword').val();
        var phone = $('#registerPhone').val();
        var address = $('#registerAddress').val();
        var error = '';

        if (!name || name.length < 2) {
            error = 'Please enter a valid full name (minimum 2 characters).';
        } else if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            error = 'Please enter a valid email address.';
        } else if (!password || password.length < 6) {
            error = 'Password must be at least 6 characters long.';
        } else if (password !== confirmPassword) {
            error = 'Passwords do not match.';
        } else if (!phone || !/^\d{10}$/.test(phone)) {
            error = 'Please enter a valid 10-digit phone number.';
        } else if (!address || address.length < 10) {
            error = 'Please enter a valid address (minimum 10 characters).';
        }

        if (error) {
            $('#registerError').text(error).show();
        } else {
            $('#registerError').hide();
            this.submit(); // Submit the form if validation passes
        }
    });
});
</script>

<?php include 'footer.php'; ?>