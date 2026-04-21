-- Create Database
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

-- Create Students Table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    course VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Data
INSERT INTO students (name, email, phone, course) VALUES 
('Raj Kumar', 'raj@example.com', '9876543210', 'B.Tech CS'),
('Priya Sharma', 'priya@example.com', '9876543211', 'B.Tech IT'),
('Aditya Patel', 'aditya@example.com', '9876543212', 'B.Tech ECE');
