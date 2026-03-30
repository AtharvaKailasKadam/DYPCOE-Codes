# 📚 Java Servlet Ebook Shop Application

A complete, beginner-friendly Java Servlet-based web application that connects to a MySQL database and displays ebook data in a formatted HTML table.

## 🎯 Project Highlights

- **Pure Java Servlets** - No frameworks like Spring
- **JDBC Database Connection** - Direct MySQL connectivity
- **Production-Ready Code** - Proper error handling and resource management
- **Beginner-Friendly** - Well-commented and structured
- **Complete Setup Guide** - Step-by-step deployment instructions

## 📑 Included Files

```
Practical_5/
├── database_setup.sql           # SQL script to create database & table
├── SETUP_INSTRUCTIONS.md        # Detailed deployment guide
├── README.md                    # This file
└── HttpServlet/
    ├── EbookServlet.java       # Main Servlet (143 lines, well-commented)
    └── Web.xml                 # Servlet configuration
```

## 🚀 Quick Start

### 1. Database Setup (5 minutes)

Run this SQL script in MySQL:
```sql
mysql -u root -p < database_setup.sql
```

Or copy-paste commands from `database_setup.sql` in MySQL Workbench.

### 2. Configure Tomcat (2 minutes)

1. Copy `mysql-connector-java-8.0.*.jar` to `Tomcat\lib\`
2. Create `Tomcat\webapps\Practical5\` folder
3. Copy HttpServlet files to appropriate locations

### 3. Deploy & Run (1 minute)

1. Start Tomcat: `C:\Tomcat\bin\startup.bat`
2. Open browser: `http://localhost:8080/Practical5/ebooks`
3. See your ebook database displayed!

## 📋 Requirements

- JDK 8+
- Apache Tomcat 9.x or 10.x
- MySQL 5.7+
- MySQL JDBC Driver 8.0.x

## 🗄️ Database Schema

**Database:** `ebookstore`

**Table:** `ebookshop`

| Column | Type | Key |
|--------|------|-----|
| book_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| book_title | VARCHAR(100) | - |
| book_author | VARCHAR(50) | - |
| book_price | DOUBLE | - |
| quantity | INT | - |

**Sample Data Included:** 7 books with prices and stock quantities

## 💻 Code Overview

### EbookServlet.java (143 lines)

```java
// JDBC Connection Constants
private static final String DB_URL = "jdbc:mysql://localhost:3306/ebookstore";
private static final String DB_USER = "root";
private static final String DB_PASSWORD = "root";
private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

// Connection Steps:
// 1. Load JDBC Driver
// 2. Establish Connection
// 3. Create Statement
// 4. Execute Query
// 5. Process ResultSet
// 6. Close Resources (in finally block)
```

### web.xml Configuration

Maps the Servlet to URL pattern:
- **URL:** `/ebooks`
- **Access:** `http://localhost:8080/Practical5/ebooks`

## 🔍 Features

✅ **Automatic HTML Table Generation** - Data formatted with CSS styling  
✅ **Error Handling** - Clear error messages for debugging  
✅ **Resource Management** - Proper connection closing in finally block  
✅ **Security-Aware** - Foundation for SQL injection prevention  
✅ **Logging** - System.out messages for troubleshooting  
✅ **Responsive Design** - Works on all screen sizes  

## 🔧 Default Credentials

```
MySQL Server: localhost:3306
Username: root
Password: root
Database: ebookstore
Table: ebookshop
```

> **⚠️ Note:** Change these credentials in production!

## 📖 Expected Output

When you access `http://localhost:8080/Practical5/ebooks`, you'll see:

```
✓ Successfully connected to database

📚 Ebook Shop Database Display

┌─────────────────────────────────────────────────────┐
│ ID │ Title           │ Author          │ Price │ Qty │
├─────────────────────────────────────────────────────┤
│ 1  │ Great Gatsby    │ F. Scott Fitzgerald │ 299.99 │ 15 │
│ 2  │ Mockingbird     │ Harper Lee        │ 349.99 │ 12 │
│ ... │ ...             │ ...               │ ...   │ ... │
└─────────────────────────────────────────────────────┘
```

## ⚡ Troubleshooting

| Issue | Solution |
|-------|----------|
| 404 Not Found | Check URL: `http://localhost:8080/Practical5/ebooks` |
| JDBC Driver not found | Copy JAR to `Tomcat\lib\` and `WEB-INF\lib\` |
| Connection refused | Start MySQL: `mysql.server start` or Services |
| No records displayed | Run `database_setup.sql` to insert sample data |
| Tomcat won't start | Set JAVA_HOME and check port 8080 availability |

For detailed troubleshooting, see `SETUP_INSTRUCTIONS.md` (Troubleshooting section).

## 📚 Learning Outcomes

After completing this project, students will understand:

1. **Servlet Lifecycle** - How servlets handle HTTP requests
2. **JDBC Basics** - Database connectivity using Java
3. **Connection Management** - Proper resource handling
4. **HTML Generation** - Dynamic content creation
5. **Error Handling** - Exception management in web apps
6. **Web Deployment** - Tomcat server setup
7. **SQL Basics** - Database operations

## 🔐 Security Notes

- **SQL Injection:** Current implementation is vulnerable. Use `PreparedStatement` for production
- **Credentials:** Never hardcode passwords in production code
- **Connection Pooling:** Use connection pools for better performance
- **Error Messages:** Don't expose sensitive database information to users

## 🚀 Next Steps (Enhancements)

1. **Add User Interface:**
   - Create JSP pages for input
   - Add search/filter functionality

2. **Enhance Security:**
   - Implement PreparedStatement
   - Add authentication

3. **Improve Performance:**
   - Implement connection pooling (HikariCP)
   - Add caching

4. **Add Features:**
   - Book insertion/update/delete
   - Pagination for large datasets
   - Advanced search filters

## 📞 Support

For issues or questions:
1. Check `SETUP_INSTRUCTIONS.md` (Troubleshooting section)
2. Review code comments in `EbookServlet.java`
3. Check Tomcat logs: `Tomcat\logs\catalina.out`
4. Verify MySQL logs: `MySQL\data\*.err`

## ✅ Checklist Before Submission

- [ ] Database created: `ebookstore`
- [ ] Table created: `ebookshop`
- [ ] Sample data inserted: 7 books
- [ ] EbookServlet.java compiled
- [ ] web.xml configured
- [ ] MySQL driver in Tomcat\lib
- [ ] Application running on localhost:8080
- [ ] Table displays all ebook records
- [ ] No errors in browser console
- [ ] Code is well-commented

## 📄 Files Included

| File | Purpose | Size |
|------|---------|------|
| EbookServlet.java | Main servlet code | ~143 lines |
| Web.xml | Servlet configuration | ~25 lines |
| database_setup.sql | Database initialization | ~70 lines |
| SETUP_INSTRUCTIONS.md | Detailed guide | ~400 lines |
| README.md | Project overview | This file |

## 🎓 Educational Value

This project is designed for:
- **B.Sc. / B.E. Students** - Learning servlet development
- **Database Courses** - JDBC connectivity practice
- **Web Development Beginners** - Understanding server-side Java
- **Lab Practitioners** - Hands-on experience with Tomcat

## 📊 Difficulty Level

- **Beginner:** ⭐⭐⭐☆☆ (Intermediate introductory project)
- **Time Required:** 30-60 minutes (including setup)
- **Prerequisites:** Basic Java, SQL, Tomcat knowledge

## 👨‍💻 Code Quality Standards

✅ **Well-Commented** - Every significant section explained  
✅ **Proper Naming** - Clear variable and method names  
✅ **Error Handling** - Try-catch-finally blocks  
✅ **Resource Management** - Proper connection closing  
✅ **HTML Standards** - Valid HTML5 with CSS  
✅ **UTF-8 Encoding** - Support for international characters  

---

**Version:** 1.0  
**Created:** 2026  
**Status:** Production-Ready for Educational Use  

**Happy Learning! 🎉**
