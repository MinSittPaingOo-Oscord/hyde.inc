<?php
include 'connectdb.php';
include 'includes/header.php';

// Redirect to login if not authenticated
if (!isset($_SESSION['user_id'])) {
    $_SESSION['error'] = "Please log in to view your profile.";
    header("Location: login.php");
    exit();
}

// Fetch user details
$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT a.name, a.email, a.phoneNumber, a.registrationDate, r.roleName, ad.address 
                        FROM account a 
                        JOIN role r ON a.roleID = r.roleID 
                        LEFT JOIN address ad ON a.accountID = ad.accountID 
                        WHERE a.accountID = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();
$stmt->close();

// Fetch order history
$stmt = $conn->prepare("SELECT o.orderID, o.orderStatus, o.totalCost, o.orderDate, o.paymentStatus, ad.address 
                        FROM `order` o 
                        JOIN address ad ON o.addressID = ad.addressID 
                        WHERE o.accountID = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$orders = $stmt->get_result();
$stmt->close();
?>

<div class="container mt-5">
    <div class="profile-card card shadow-sm">
        <div class="card-header profile-header">
            <h4 class="mb-0">My Profile</h4>
        </div>
        <div class="card-body">
            <?php if (isset($_SESSION['success'])): ?>
                <div class="alert alert-success"><?php echo $_SESSION['success']; unset($_SESSION['success']); ?></div>
            <?php endif; ?>
            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="https://via.placeholder.com/150" class="rounded-circle mb-3" alt="Profile Picture">
                    <h5><?php echo htmlspecialchars($user['name']); ?></h5>
                    <p class="text-muted"><?php echo htmlspecialchars($user['roleName']); ?></p>
                </div>
                <div class="col-md-8">
                    <h5>Account Details</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></li>
                        <li class="list-group-item"><strong>Phone:</strong> <?php echo htmlspecialchars($user['phoneNumber']); ?></li>
                        <li class="list-group-item"><strong>Address:</strong> <?php echo htmlspecialchars($user['address'] ?? 'Not provided'); ?></li>
                        <li class="list-group-item"><strong>Member Since:</strong> <?php echo date('F j, Y', strtotime($user['registrationDate'])); ?></li>
                    </ul>
                    <a href="edit_profile.php" class="btn btn-warning mt-3">Edit Profile</a>
                </div>
            </div>
            <hr>
            <h5>Order History</h5>
            <?php if ($orders->num_rows > 0): ?>
                <table class="table table-striped order-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total Cost</th>
                            <th>Status</th>
                            <th>Payment Status</th>
                            <th>Shipping Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($order = $orders->fetch_assoc()): ?>
                            <tr>
                                <td>#<?php echo htmlspecialchars($order['orderID']); ?></td>
                                <td><?php echo date('F j, Y', strtotime($order['orderDate'])); ?></td>
                                <td>$<?php echo number_format($order['totalCost'], 2); ?></td>
                                <td><?php echo htmlspecialchars($order['orderStatus'] ?? 'Pending'); ?></td>
                                <td><?php echo htmlspecialchars($order['paymentStatus'] ?? 'Unpaid'); ?></td>
                                <td><?php echo htmlspecialchars($order['address']); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p class="text-muted">No orders found.</p>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php
$conn->close();
include 'includes/footer.php';
?>