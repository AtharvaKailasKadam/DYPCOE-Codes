<?php
// Add New Student - add.php
// Form to insert new student record

session_start();
require_once 'db.php';

$errors = array();

// Handle Form Submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone']);
    $course = trim($_POST['course']);
    
    // Validation
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    if (empty($phone)) {
        $errors[] = "Phone is required";
    } elseif (!preg_match("/^[0-9]{10}$/", $phone)) {
        $errors[] = "Phone must be 10 digits";
    }
    
    if (empty($course)) {
        $errors[] = "Course is required";
    }
    
    // If no errors, insert into database
    if (empty($errors)) {
        $sql = "INSERT INTO students (name, email, phone, course) VALUES ('$name', '$email', '$phone', '$course')";
        
        if (mysqli_query($conn, $sql)) {
            $_SESSION['message'] = "Student added successfully!";
            $_SESSION['msg_type'] = "success";
            header("Location: index.php");
            exit();
        } else {
            $_SESSION['message'] = "Error: " . mysqli_error($conn);
            $_SESSION['msg_type'] = "error";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>➕ Add New Student</h1>
        
        <!-- Display Errors -->
        <?php 
        if (!empty($errors)) {
            echo "<div class='message error'>";
            foreach ($errors as $error) {
                echo "❌ " . $error . "<br>";
            }
            echo "</div>";
        }
        ?>
        
        <!-- Form -->
        <form method="POST" class="form">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" placeholder="Enter name" value="<?php echo isset($_POST['name']) ? $_POST['name'] : ''; ?>">
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" placeholder="Enter email" value="<?php echo isset($_POST['email']) ? $_POST['email'] : ''; ?>">
            </div>
            
            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" placeholder="10-digit phone" maxlength="10" value="<?php echo isset($_POST['phone']) ? $_POST['phone'] : ''; ?>">
            </div>
            
            <div class="form-group">
                <label>Course:</label>
                <select name="course">
                    <option value="">-- Select --</option>
                    <option value="B.Tech CS">B.Tech Computer Science</option>
                    <option value="B.Tech IT">B.Tech Information Technology</option>
                    <option value="B.Tech ECE">B.Tech Electronics</option>
                </select>
            </div>
            
            <div class="form-buttons">
                <button type="submit" class="btn btn-add">Add Student</button>
                <a href="index.php" class="btn btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
