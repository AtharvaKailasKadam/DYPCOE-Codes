# Quick Reference Guide - Ebook Shop Application

## 🚀 5-Minute Setup

### 1. Database Setup
```bash
mysql -u root -p < database_setup.sql
# or copy-paste from file in MySQL Workbench
```

### 2. Get MySQL Driver
- Download: `mysql-connector-java-8.0.33.jar`
- From: https://dev.mysql.com/downloads/connector/j/

### 3. Copy Files to Tomcat
```
Tomcat/
├── lib/
│   └── mysql-connector-java-8.0.33.jar
└── webapps/
    └── Practical5/
        ├── index.html (optional)
        └── WEB-INF/
            ├── web.xml
            ├── classes/
            │   └── EbookServlet.class
            └── lib/
                └── mysql-connector-java-8.0.33.jar
```

### 4. Start & Access
```bash
# Terminal 1: Start Tomcat
C:\Tomcat\bin\startup.bat

# Terminal 2: Start MySQL (if needed)
mysql.server start

# Browser
http://localhost:8080/Practical5/ebooks
```

---

## 📝 Key Code Snippets

### JDBC Connection Steps
```java
// 1. Load Driver
Class.forName("com.mysql.cj.jdbc.Driver");

// 2. Get Connection
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/ebookstore", 
    "root", 
    "root"
);

// 3. Create Statement
Statement stmt = con.createStatement();

// 4. Execute Query
ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop");

// 5. Process Results
while(rs.next()) {
    int id = rs.getInt("book_id");
    String title = rs.getString("book_title");
}

// 6. Close Resources (in finally block)
rs.close();
stmt.close();
con.close();
```

### HTML Table Generation
```java
out.println("<table border='1'>");
out.println("<tr>");
out.println("<th>Book ID</th>");
out.println("<th>Title</th>");
out.println("<th>Author</th>");
out.println("<th>Price</th>");
out.println("<th>Quantity</th>");
out.println("</tr>");

while(rs.next()) {
    out.println("<tr>");
    out.println("<td>" + rs.getInt("book_id") + "</td>");
    out.println("<td>" + rs.getString("book_title") + "</td>");
    out.println("<td>" + rs.getString("book_author") + "</td>");
    out.println("<td>" + rs.getDouble("book_price") + "</td>");
    out.println("<td>" + rs.getInt("quantity") + "</td>");
    out.println("</tr>");
}
out.println("</table>");
```

---

## 🔧 Configuration

### Database Credentials
```
Host: localhost:3306
Database: ebookstore
Username: root
Password: root
Table: ebookshop
```

### Tomcat Configuration
```
Port: 8080
Application: Practical5
URL: http://localhost:8080/Practical5/ebooks
```

### Servlet Mapping
```xml
<!-- web.xml -->
<servlet>
    <servlet-name>EbookServlet</servlet-name>
    <servlet-class>EbookServlet</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>EbookServlet</servlet-name>
    <url-pattern>/ebooks</url-pattern>
</servlet-mapping>
```

---

## ❌ Common Errors & Fixes

### Error: JDBC Driver not found
**Fix:**
```bash
# Copy driver to two locations:
1. Tomcat\lib\mysql-connector-java-8.0.33.jar
2. Practical5\WEB-INF\lib\mysql-connector-java-8.0.33.jar
# Restart Tomcat
```

### Error: Connection refused
**Fix:**
```bash
# Check MySQL is running
mysql -u root -p

# If not running, start it
mysql.server start  # Mac/Linux
net start MySQL80   # Windows
```

### Error: Unknown database 'ebookstore'
**Fix:**
```bash
# Create database
mysql -u root -p < database_setup.sql

# Verify
mysql -u root -p -e "SHOW DATABASES;"
```

### Error: 404 Not Found
**Fix:**
- Check URL: `http://localhost:8080/Practical5/ebooks`
- Verify folder: `Tomcat\webapps\Practical5` exists
- Restart Tomcat

### Error: Tomcat port 8080 already in use
**Fix:**
1. Find process: `netstat -ano | findstr :8080`
2. Kill process: `taskkill /PID <PID> /F`
3. Or change port in `Tomcat\conf\server.xml`

---

## 📊 Database Schema

```sql
CREATE DATABASE ebookstore;
USE ebookstore;

CREATE TABLE ebookshop (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(50) NOT NULL,
    book_price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data (7 records)
INSERT INTO ebookshop (book_title, book_author, book_price, quantity) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 299.99, 15),
('To Kill a Mockingbird', 'Harper Lee', 349.99, 12),
('1984', 'George Orwell', 279.99, 8),
('Pride and Prejudice', 'Jane Austen', 259.99, 20),
('The Catcher in the Rye', 'J.D. Salinger', 289.99, 10),
('Wuthering Heights', 'Emily Brontë', 269.99, 7),
('The Lord of the Rings', 'J.R.R. Tolkien', 599.99, 5);
```

---

## 📂 File Structure

```
Practical_5/
├── README.md                  # Project overview
├── SETUP_INSTRUCTIONS.md      # Detailed guide (400+ lines)
├── QUICK_REFERENCE.md         # This file
├── database_setup.sql         # SQL script
└── HttpServlet/
    ├── EbookServlet.java     # Servlet code (143 lines)
    └── Web.xml               # Configuration (25 lines)
```

---

## ✅ Deployment Checklist

- [ ] MySQL running on localhost:3306
- [ ] Database `ebookstore` created
- [ ] Table `ebookshop` created
- [ ] Sample data inserted (7 records)
- [ ] MySQL JDBC JAR in `Tomcat\lib\`
- [ ] `Practical5` folder in `Tomcat\webapps\`
- [ ] `EbookServlet.class` in `Practical5\WEB-INF\classes\`
- [ ] `web.xml` in `Practical5\WEB-INF\`
- [ ] MySQL JAR in `Practical5\WEB-INF\lib\`
- [ ] Tomcat started successfully
- [ ] URL works: `http://localhost:8080/Practical5/ebooks`

---

## 🔍 Testing Queries

Verify database setup by running in MySQL:

```sql
-- Check database exists
SHOW DATABASES;

-- Check table exists
USE ebookstore;
SHOW TABLES;

-- Check data exists
SELECT * FROM ebookshop;

-- Count records
SELECT COUNT(*) FROM ebookshop;

-- Check specific columns
SELECT book_id, book_title, book_price FROM ebookshop;
```

---

## 🐛 Debugging

### Enable Verbose Logging
Add to EbookServlet:
```java
System.out.println("Driver loaded successfully");
System.out.println("Connection established successfully");
System.out.println("Query executed successfully");
```

### Check Tomcat Logs
```bash
# Windows
C:\Tomcat\logs\catalina.out

# Linux/Mac
/opt/tomcat/logs/catalina.out
```

### Check MySQL Logs
```bash
# Windows
C:\ProgramData\MySQL\MySQL Server 8.0\Data\*.err

# Linux/Mac
/var/log/mysql/error.log
```

---

## 📚 Useful Commands

```bash
# Compile Java
javac -cp mysql-connector-java-8.0.33.jar EbookServlet.java

# Create WAR file
jar -cvf Practical5.war -C WebContent/ .

# Start Tomcat
C:\Tomcat\bin\startup.bat

# Stop Tomcat
C:\Tomcat\bin\shutdown.bat

# Access MySQL
mysql -u root -p

# View MySQL version
mysql --version

# View Java version
java -version

# Find process on port
netstat -ano | findstr :8080
```

---

## 🎯 Quick Links

- MySQL Download: https://dev.mysql.com/downloads/
- MySQL Connector/J: https://dev.mysql.com/downloads/connector/j/
- Apache Tomcat: https://tomcat.apache.org/
- Java Documentation: https://docs.oracle.com/javase/
- Servlet API: https://docs.oracle.com/javaee/7/api/javax/servlet/

---

**Last Updated:** 2026  
**Version:** 1.0

Need more help? See `SETUP_INSTRUCTIONS.md` for detailed explanations.
