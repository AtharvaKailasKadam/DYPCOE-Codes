-- ============================================================================
-- MySQL Database Setup Script for Ebook Shop Application
-- ============================================================================
-- This script creates the 'ebookstore' database with 'ebookshop' table
-- and inserts sample records.
--
-- Database: ebookstore
-- Table: ebookshop
-- ============================================================================

-- Drop the database if it already exists (optional - remove the next line if you want to keep existing data)
-- DROP DATABASE IF EXISTS ebookstore;

-- Create the database
CREATE DATABASE IF NOT EXISTS ebookstore;

-- Select the database
USE ebookstore;

-- ============================================================================
-- Create the ebookshop table
-- ============================================================================
-- Table structure:
--   book_id: Unique identifier (Primary Key, Auto-increment)
--   book_title: Title of the book (VARCHAR)
--   book_author: Author's name (VARCHAR)
--   book_price: Price of the book (DOUBLE)
--   quantity: Number of books in stock (INT)

CREATE TABLE IF NOT EXISTS ebookshop (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(50) NOT NULL,
    book_price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Insert Sample Data
-- ============================================================================
-- Insert at least 5 sample records to demonstrate the application

INSERT INTO ebookshop (book_title, book_author, book_price, quantity) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 299.99, 15),
('To Kill a Mockingbird', 'Harper Lee', 349.99, 12),
('1984', 'George Orwell', 279.99, 8),
('Pride and Prejudice', 'Jane Austen', 259.99, 20),
('The Catcher in the Rye', 'J.D. Salinger', 289.99, 10),
('Wuthering Heights', 'Emily Brontë', 269.99, 7),
('The Lord of the Rings', 'J.R.R. Tolkien', 599.99, 5);

-- ============================================================================
-- Verify the data
-- ============================================================================
-- Display all records to verify insertion

SELECT * FROM ebookshop;

-- ============================================================================
-- Additional Useful Queries for Testing
-- ============================================================================

-- Count total books in the shop
-- SELECT COUNT(*) as total_books FROM ebookshop;

-- Find average book price
-- SELECT AVG(book_price) as average_price FROM ebookshop;

-- Find books with price less than 300
-- SELECT * FROM ebookshop WHERE book_price < 300;

-- Find books by a specific author
-- SELECT * FROM ebookshop WHERE book_author = 'Jane Austen';

-- ============================================================================
-- END OF SQL SCRIPT
-- ============================================================================
