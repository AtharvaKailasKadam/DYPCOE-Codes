# 📚 Java Servlet Ebook Shop Application - Complete Setup Guide

## Table of Contents
1. [Project Overview](#project-overview)
2. [System Requirements](#system-requirements)
3. [Database Setup](#database-setup)
4. [Project Structure](#project-structure)
5. [Step-by-Step Installation & Deployment](#step-by-step-installation--deployment)
6. [Testing the Application](#testing-the-application)
7. [Troubleshooting](#troubleshooting)
8. [Code Explanation](#code-explanation)

---

## Project Overview

This is a beginner-friendly Java Servlet-based web application that:
- Connects to a MySQL database
- Retrieves ebook data from the `ebookshop` table
- Displays the data in a formatted HTML table in the browser
- Uses JDBC for database connectivity (no frameworks like Spring)

**Key Features:**
- ✓ Pure Java Servlets (no external frameworks)
- ✓ JDBC database connection
- ✓ Styled HTML output with CSS
- ✓ Error handling and debugging messages
- ✓ Beginner-friendly, well-commented code

---

## System Requirements

- **Java Development Kit (JDK):** Version 8 or higher
- **Apache Tomcat:** Version 9.x or 10.x
- **MySQL Server:** Version 5.7 or higher
- **MySQL JDBC Driver:** mysql-connector-java-8.0.x or later
- **Operating System:** Windows, Linux, or macOS

---

## Database Setup

### Step 1: Verify MySQL Installation

1. Open Command Prompt (Windows) or Terminal (Linux/Mac)
2. Check if MySQL is installed and running:
   ```bash
   mysql --version
   ```
3. If MySQL is not running, start it:
   - **Windows:** Open Services and start MySQL
   - **Linux:** `sudo systemctl start mysql`
   - **Mac:** `brew services start mysql`

### Step 2: Login to MySQL

```bash
mysql -u root -p
```
Enter password: `root`

### Step 3: Create Database and Table

Execute the SQL script provided:

**Option A: Using MySQL Command Line**
1. Save the script as `database_setup.sql`
2. Run: `mysql -u root -p < C:\path\to\database_setup.sql`
3. Enter password: `root`

**Option B: Using MySQL Workbench**
1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open the `database_setup.sql` file
4. Click "Execute" (Ctrl+Shift+Enter)

**Option C: Manual Execution**
Copy and paste the following SQL commands in MySQL Command Line or Workbench:

```sql
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

SELECT * FROM ebookshop;
```

### Step 4: Verify Database Creation

```sql
USE ebookstore;
SHOW TABLES;
SELECT * FROM ebookshop;
```

---

## Project Structure

```
Practical_5/
│
├── HttpServlet/
│   ├── EbookServlet.java        # Main Servlet class
│   ├── Web.xml                   # Servlet configuration
│   └── (compiled classes will go here during build)
│
├── database_setup.sql            # Database initialization script
├── SETUP_INSTRUCTIONS.md         # This file
└── README.md                     # Project documentation
```

**Web Application Structure (After Deployment):**
```
Tomcat/
└── webapps/
    └── Practical5/               # Application root
        ├── ebooks                # Servlet mapping URL
        └── WEB-INF/
            ├── web.xml           # Deployment descriptor
            ├── classes/
            │   └── EbookServlet.class
            └── lib/
                └── mysql-connector-java-8.0.*.jar
```

---

## Step-by-Step Installation & Deployment

### Prerequisites Checklist

- [ ] Java Development Kit (JDK) installed
- [ ] Apache Tomcat installed
- [ ] MySQL Server running
- [ ] MySQL JDBC Driver downloaded
- [ ] Database created with sample data

---

### Step 1: Download MySQL JDBC Driver

1. Visit: [MySQL Connector/J Downloads](https://dev.mysql.com/downloads/connector/j/)
2. Download: `mysql-connector-java-8.0.33.jar` (or latest version)
3. Save to a known location (e.g., `C:\mysql-driver\`)

---

### Step 2: Set Up Tomcat Project

#### Option A: Using Eclipse IDE

1. **Open Eclipse IDE**
   - File → New → Dynamic Web Project
   - Project name: `Practical5`
   - Target runtime: Apache Tomcat v10.0

2. **Create Servlet Package**
   - Right-click Project → New → Package
   - Package name: (leave default or use `com.ebookshop`)

3. **Add Servlet Class**
   - Right-click src → New → Class
   - Class name: `EbookServlet`
   - Paste the `EbookServlet.java` code

4. **Add MySQL JDBC Driver to Build Path**
   - Right-click Project → Properties
   - Java Build Path → Add External JARs
   - Select `mysql-connector-java-8.0.*.jar`
   - Apply and Close

5. **Update web.xml**
   - Right-click `WebContent/WEB-INF/web.xml`
   - Edit with Text Editor
   - Replace content with the provided `web.xml` configuration

6. **Export WAR File**
   - Right-click Project → Export → WAR file
   - Destination: `C:\Tomcat\webapps\Practical5.war`

#### Option B: Manual Folder Structure

1. **Create Project Directory:**
   ```bash
   mkdir C:\Practical5
   cd C:\Practical5
   ```

2. **Create WEB-INF Structure:**
   ```bash
   mkdir WebContent\WEB-INF\classes
   mkdir WebContent\WEB-INF\lib
   ```

3. **Add Files:**
   - Copy `EbookServlet.java` to `src/` folder
   - Copy `Web.xml` to `WebContent/WEB-INF/` (rename to `web.xml`)
   - Copy `mysql-connector-java-8.0.*.jar` to `WebContent/WEB-INF/lib/`

4. **Compile Java:**
   ```bash
   javac -d WebContent/WEB-INF/classes -cp WebContent/WEB-INF/lib/*:. src/EbookServlet.java
   ```

---

### Step 3: Deploy to Tomcat

#### Option A: Using Eclipse

1. Right-click Project → Run On Server
2. Select Apache Tomcat v10.0
3. Click Finish

#### Option B: Manual Deployment

1. **Copy to Tomcat webapps:**
   ```bash
   xcopy C:\Practical5\WebContent C:\Tomcat\webapps\Practical5 /E /I
   ```

2. **Create WAR File (Optional):**
   ```bash
   jar -cvf Practical5.war -C WebContent/ .
   # Copy to C:\Tomcat\webapps\Practical5.war
   ```

3. **Restart Tomcat:**
   - Stop: `C:\Tomcat\bin\shutdown.bat`
   - Start: `C:\Tomcat\bin\startup.bat`

---

### Step 4: Configure MySQL Driver in Tomcat

1. **Copy JDBC Driver to Tomcat:**
   ```bash
   Copy \mysql-connector-java-8.0.*.jar C:\Tomcat\lib\
   ```

2. **Restart Tomcat** (if already running)

---

## Testing the Application

### Step 1: Start All Services

1. **Start MySQL Server**
   ```bash
   MySQL is running on localhost:3306
   ```

2. **Start Tomcat**
   - Run: `C:\Tomcat\bin\startup.bat` (Windows)
   - Or: `sh /opt/tomcat/bin/startup.sh` (Linux/Mac)

3. **Verify Tomcat is Running**
   - Open browser: `http://localhost:8080`
   - You should see Tomcat welcome page

### Step 2: Access the Application

1. **Open Browser**
2. **Enter URL:** `http://localhost:8080/Practical5/ebooks`
3. **Expected Output:**
   - A formatted HTML table showing all ebook records
   - Columns: Book ID, Book Title, Author, Price, Quantity in Stock
   - Green success message if database connection is successful

### Step 3: Verify Results

You should see a table with records:
| Book ID | Book Title | Author | Price (₹) | Quantity in Stock |
|---------|------------|--------|-----------|-----------------|
| 1 | The Great Gatsby | F. Scott Fitzgerald | 299.99 | 15 |
| 2 | To Kill a Mockingbird | Harper Lee | 349.99 | 12 |
| ... | ... | ... | ... | ... |

---

## Troubleshooting

### Issue 1: 404 Error - Page Not Found

**Cause:** Incorrect URL or application not deployed

**Solution:**
- Verify URL: `http://localhost:8080/Practical5/ebooks`
- Ensure Practical5 folder exists in `C:\Tomcat\webapps\`
- Restart Tomcat
- Check Tomcat logs: `C:\Tomcat\logs\catalina.out`

### Issue 2: "JDBC Driver not found" Error

**Cause:** MySQL JDBC JAR not in classpath

**Solution:**
1. Copy `mysql-connector-java-8.0.*.jar` to `Tomcat\lib\`
2. Also copy to `Practical5\WEB-INF\lib\`
3. Restart Tomcat

### Issue 3: "Connection refused" Error

**Cause:** MySQL server not running or incorrect credentials

**Solution:**
1. Start MySQL: Check Services or use `mysql.server start`
2. Verify credentials in code: username `root`, password `root`
3. Test connection: `mysql -u root -p` (enter password: `root`)
4. Verify database exists: `SHOW DATABASES;`

### Issue 4: "Unknown database 'ebookstore'" Error

**Cause:** Database not created

**Solution:**
1. Run the SQL script: `database_setup.sql`
2. Verify: `mysql -u root -p -e "SHOW DATABASES;"`
3. Should see `ebookstore` in the list

### Issue 5: "No records found" Message

**Cause:** Table created but no data inserted

**Solution:**
1. Check table: `USE ebookstore; SELECT * FROM ebookshop;`
2. Insert sample data from `database_setup.sql`
3. Refresh browser

### Issue 6: Tomcat Won't Start

**Cause:** Port 8080 already in use or JAVA_HOME not set

**Solution:**
1. Set JAVA_HOME: 
   - Windows: `set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_*`
   - Linux/Mac: `export JAVA_HOME=/usr/libexec/java_home`
2. Change Tomcat port in `conf/server.xml` (line with `8080`)
3. Restart Tomcat

### Issue 7: "ClassNotFoundException: com.mysql.cj.jdbc.Driver"

**Cause:** MySQL driver not loaded

**Solution:**
1. Verify JAR filename: Should be `mysql-connector-java-8.0.*.jar`
2. Ensure JAR is in both:
   - `Tomcat\lib\`
   - `Practical5\WEB-INF\lib\`
3. Restart Tomcat
4. Check for typo in servlet code: `com.mysql.cj.jdbc.Driver`

---

## Code Explanation

### EbookServlet.java

**Key Components:**

1. **Database Constants:**
   ```java
   private static final String DB_URL = "jdbc:mysql://localhost:3306/ebookstore";
   private static final String DB_USER = "root";
   private static final String DB_PASSWORD = "root";
   private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
   ```
   - Connection parameters for MySQL database

2. **doGet() Method:**
   - Handles HTTP GET requests
   - Sets response content type to HTML
   - Uses try-catch-finally for resource management

3. **JDBC Connection Steps:**
   ```
   Step 1: Load JDBC Driver → Class.forName(DB_DRIVER)
   Step 2: Get Connection → DriverManager.getConnection()
   Step 3: Create Statement → con.createStatement()
   Step 4: Execute Query → stmt.executeQuery(sql)
   Step 5: Process ResultSet → while(rs.next())
   Step 6: Close Resources → finally block
   ```

4. **HTML Output:**
   - DOCTYPE declaration for HTML5
   - Embedded CSS for styling
   - Bootstrap-like table formatting
   - Responsive and beginner-friendly design

5. **Error Handling:**
   - ClassNotFoundException: JDBC driver not found
   - SQLException: Database connection issues
   - General Exception: Unexpected errors
   - Finally block: Always closes resources

### web.xml

**Configuration Elements:**

1. **Servlet Declaration:**
   ```xml
   <servlet>
       <servlet-name>EbookServlet</servlet-name>
       <servlet-class>EbookServlet</servlet-class>
   </servlet>
   ```
   - Declares the servlet class

2. **URL Mapping:**
   ```xml
   <servlet-mapping>
       <servlet-name>EbookServlet</servlet-name>
       <url-pattern>/ebooks</url-pattern>
   </servlet-mapping>
   ```
   - Maps `/ebooks` URL to the servlet

3. **Welcome File List:**
   - Specifies default files when accessing root

4. **Session Configuration:**
   - Sets session timeout to 30 minutes

---

## Database Schema

### Table: ebookshop

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| book_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique book identifier |
| book_title | VARCHAR(100) | NOT NULL | Title of the book |
| book_author | VARCHAR(50) | NOT NULL | Author's name |
| book_price | DOUBLE | NOT NULL | Price in rupees |
| quantity | INT | NOT NULL | Stock quantity |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record creation time |

---

## Summary Checklist

- [ ] MySQL database `ebookstore` created
- [ ] Table `ebookshop` created with sample data (7 records)
- [ ] `EbookServlet.java` compiled and placed in WEB-INF/classes
- [ ] `web.xml` properly configured
- [ ] MySQL JDBC driver JAR in Tomcat/lib and WEB-INF/lib
- [ ] Tomcat started and running on port 8080
- [ ] MySQL server running on localhost:3306
- [ ] Application accessible at `http://localhost:8080/Practical5/ebooks`
- [ ] HTML table displays all ebook records correctly

---

## Additional Notes

- **Port Management:** If Tomcat is already using port 8080, change it in `conf/server.xml`
- **Database Credentials:** Ensure username is `root` and password is `root`
- **JDBC Version:** Use MySQL Connector/J 8.0.x for Java 8+
- **Charset:** Code uses UTF-8 encoding for international character support
- **Performance:** For production, implement connection pooling

---

## Further Enhancements

1. Add INSERT, UPDATE, DELETE operations
2. Implement PreparedStatement for security (SQL injection prevention)
3. Add search/filter functionality
4. Implement pagination for large datasets
5. Add connection pooling (HikariCP, DBCP)
6. Create JSP pages for better separation of concerns
7. Add login/authentication
8. Implement session management

---

## References

- [Java Servlet API Documentation](https://docs.oracle.com/javaee/7/api/javax/servlet/package-summary.html)
- [MySQL JDBC Driver Documentation](https://dev.mysql.com/doc/connector-j/8.0/en/)
- [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-10.0-doc/)
- [JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/)

---

**Document Version:** 1.0  
**Last Updated:** 2026  
**Author:** Database and Web Development Course

**Happy Coding! 🎉**
