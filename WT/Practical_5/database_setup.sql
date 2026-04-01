CREATE DATABASE IF NOT EXISTS ebookstore;

USE ebookstore;



CREATE TABLE IF NOT EXISTS ebookshop (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(50) NOT NULL,
    book_price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ebookshop (book_title, book_author, book_price, quantity) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 299.99, 15),
('To Kill a Mockingbird', 'Harper Lee', 349.99, 12),
('1984', 'George Orwell', 279.99, 8),
('Pride and Prejudice', 'Jane Austen', 259.99, 20),
('The Catcher in the Rye', 'J.D. Salinger', 289.99, 10),
('Wuthering Heights', 'Emily Brontë', 269.99, 7),
('The Lord of the Rings', 'J.R.R. Tolkien', 599.99, 5);

-- ============================================================================


SELECT * FROM ebookshop;

