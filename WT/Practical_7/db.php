<?php
// Database Connection File - db.php
// Simple MySQLi connection for beginners

// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = "student_db";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Set charset to UTF-8
mysqli_set_charset($conn, "utf8");
?>
