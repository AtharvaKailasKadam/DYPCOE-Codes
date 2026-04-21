<?php
// Display Students - index.php
// Shows all students and handles delete operation

session_start();
require_once 'db.php';

// Handle Delete
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $sql = "DELETE FROM students WHERE id=$id";
    
    if (mysqli_query($conn, $sql)) {
        $_SESSION['message'] = "Student deleted successfully!";
        $_SESSION['msg_type'] = "success";
    } else {
        $_SESSION['message'] = "Error deleting student!";
        $_SESSION['msg_type'] = "error";
    }
    header("Location: index.php");
    exit();
}

// Fetch all students
$sql = "SELECT * FROM students";
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>📚 Student Management System</h1>
        
        <!-- Display Messages -->
        <?php 
        if (isset($_SESSION['message'])): 
        ?>
            <div class="message <?php echo $_SESSION['msg_type']; ?>">
                <?php echo $_SESSION['message']; ?>
            </div>
        <?php 
        unset($_SESSION['message']);
        unset($_SESSION['msg_type']);
        endif; 
        ?>
        
        <!-- Add Button -->
        <div class="button-container">
            <a href="add.php" class="btn btn-add">+ Add Student</a>
        </div>
        
        <!-- Students Table -->
        <table class="students-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['id'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['email'] . "</td>";
                        echo "<td>" . $row['phone'] . "</td>";
                        echo "<td>" . $row['course'] . "</td>";
                        echo "<td>";
                        echo "<a href='edit.php?id=" . $row['id'] . "' class='btn-edit'>Edit</a> | ";
                        echo "<a href='index.php?delete=" . $row['id'] . "' class='btn-delete' onclick='return confirm(\"Delete?\")'>Delete</a>";
                        echo "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='6' class='no-data'>No students found. <a href='add.php'>Add one</a></td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
