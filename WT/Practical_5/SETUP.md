# 📚 Ebook Shop Servlet - Setup Instructions

## Files Provided
- `EbookServlet.java` - Main Servlet (displays ebook data)
- `web.xml` - Servlet configuration
- `database_setup.sql` - Database and table creation
- `index.html` - Welcome page with link to servlet

---

## Quick Setup (5 steps)

### Step 1: Create Database
```bash
mysql -u root -p root < database_setup.sql
```
This creates:
- Database: `ebookstore`
- Table: `ebookshop` with 3 sample books

### Step 2: Download MySQL JDBC Driver
Download `mysql-connector-java-8.0.33.jar` from:
https://dev.mysql.com/downloads/connector/j/

### Step 3: Copy Driver to Tomcat
```
C:\Tomcat\lib\mysql-connector-java-8.0.33.jar
```

### Step 4: Compile and Deploy Servlet
Place these files in Tomcat web application:
```
C:\Tomcat\webapps\Practical5\
├── WEB-INF/
│   ├── classes/
│   │   └── EbookServlet.class (compiled from .java)
│   ├── web.xml
│   └── lib/
│       └── mysql-connector-java-8.0.33.jar
├── index.html
```

**To compile:**
```bash
javac -cp mysql-connector-java-8.0.33.jar EbookServlet.java
```

### Step 5: Access the Application
1. Start Tomcat: `C:\Tomcat\bin\startup.bat`
2. Open browser: `http://localhost:8080/Practical5/`
3. Click "View Ebooks" button
4. See the database table displayed!

---

## Database Schema

**Table:** `ebookshop`

| Column | Type | Notes |
|--------|------|-------|
| book_id | INT | Primary Key, Auto-increment |
| book_title | VARCHAR | Book name |
| book_author | VARCHAR | Author name |
| book_price | DOUBLE | Price in rupees |
| quantity | INT | Stock quantity |

**Sample Data:**
- The Great Gatsby by F. Scott Fitzgerald (₹299.99, qty: 15)
- To Kill a Mockingbird by Harper Lee (₹349.99, qty: 12)
- 1984 by George Orwell (₹279.99, qty: 8)

---

## Troubleshooting

**Issue: 404 Not Found**
→ Check URL: `http://localhost:8080/Practical5/ebooks`

**Issue: JDBC Driver not found**
→ Copy JAR to `Tomcat\lib\` and restart Tomcat

**Issue: Connection refused**
→ Start MySQL: `net start MySQL80` (Windows)

**Issue: No data displays**
→ Run `database_setup.sql` to create database and insert data

---

**Done! Your servlet should now display the ebook table.** 📖
