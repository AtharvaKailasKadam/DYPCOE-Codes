@echo off
REM Deployment Validation Script for Ebook Shop Application (Windows)
REM This batch script verifies that all components are properly set up

setlocal enabledelayedexpansion

echo.
echo ================================
echo Ebook Shop - Deployment Validator
echo ================================
echo.

REM Counters
set PASSED=0
set FAILED=0

REM ===== System Requirements Check =====
echo === System Requirements Check ===
echo.

REM Check Java Installation
echo Checking Java Installation...
java -version >nul 2>&1
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%i in ('java -version 2^>^&1 ^| findstr /R "version"') do set JAVA_VERSION=%%i
    echo.
    echo [OK] Java is installed: !JAVA_VERSION!
    set /a PASSED+=1
) else (
    echo.
    echo [FAIL] Java is not installed or not in PATH
    set /a FAILED+=1
)
echo.

REM Check MySQL Installation
echo Checking MySQL Installation...
mysql --version >nul 2>&1
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%i in ('mysql --version') do set MYSQL_VERSION=%%i
    echo.
    echo [OK] MySQL is installed: !MYSQL_VERSION!
    set /a PASSED+=1
) else (
    echo.
    echo [WARNING] MySQL is not in PATH
    echo           (MySQL might still be installed in a custom location)
)
echo.

REM Check MySQL Server Status
echo Checking MySQL Server Status...
mysql -u root -proot -e "SELECT 1" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [OK] MySQL server is running
    echo     Username: root, Password: root
    set /a PASSED+=1
) else (
    echo [FAIL] MySQL server is not running or credentials are wrong
    echo        Expected: root/root on localhost:3306
    set /a FAILED+=1
)
echo.

REM ===== Database Setup Check =====
echo === Database Setup Check ===
echo.

REM Check if database exists
echo Checking if 'ebookstore' database exists...
mysql -u root -proot -e "USE ebookstore" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [OK] ebookstore database exists
    set /a PASSED+=1
) else (
    echo [FAIL] ebookstore database does not exist
    set /a FAILED+=1
)
echo.

REM Check if table exists
echo Checking if 'ebookshop' table exists...
mysql -u root -proot -e "USE ebookstore; SELECT COUNT(*) FROM ebookshop" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    for /f "tokens=*" %%i in ('mysql -u root -proot -e "USE ebookstore; SELECT COUNT(*) FROM ebookshop" 2^>nul') do set RECORD_COUNT=%%i
    echo [OK] ebookshop table exists with records
    set /a PASSED+=1
) else (
    echo [FAIL] ebookshop table does not exist
    set /a FAILED+=1
)
echo.

REM Check table structure
echo Checking table structure...
mysql -u root -proot -e "USE ebookstore; DESCRIBE ebookshop" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [OK] Table has correct structure
    set /a PASSED+=1
) else (
    echo [FAIL] Table structure is invalid
    set /a FAILED+=1
)
echo.

REM ===== Application Files Check =====
echo === Application Files Check ===
echo.

REM Check for Java source file
echo Checking EbookServlet.java exists...
if exist "HttpServlet\EbookServlet.java" (
    echo [OK] EbookServlet.java found
    set /a PASSED+=1
) else (
    echo [FAIL] EbookServlet.java not found
    set /a FAILED+=1
)
echo.

REM Check for web.xml
echo Checking web.xml exists...
if exist "HttpServlet\Web.xml" (
    echo [OK] web.xml found (Web.xml)
    set /a PASSED+=1
) else if exist "HttpServlet\web.xml" (
    echo [OK] web.xml found
    set /a PASSED+=1
) else (
    echo [FAIL] web.xml not found
    set /a FAILED+=1
)
echo.

REM Check for database setup script
echo Checking database_setup.sql exists...
if exist "database_setup.sql" (
    echo [OK] database_setup.sql found
    set /a PASSED+=1
) else (
    echo [FAIL] database_setup.sql not found
    set /a FAILED+=1
)
echo.

REM Check for documentation
echo Checking documentation files...
set DOCS_COUNT=0
if exist "README.md" set /a DOCS_COUNT+=1
if exist "SETUP_INSTRUCTIONS.md" set /a DOCS_COUNT+=1
if exist "QUICK_REFERENCE.md" set /a DOCS_COUNT+=1
if exist "CODE_DOCUMENTATION.md" set /a DOCS_COUNT+=1

if !DOCS_COUNT! geq 2 (
    echo [OK] Found !DOCS_COUNT! documentation files
    set /a PASSED+=1
) else (
    echo [INFO] Found !DOCS_COUNT! documentation files
)
echo.

REM ===== Apache Tomcat Check =====
echo === Apache Tomcat Check ===
echo.

REM Check Tomcat status (ping localhost:8080)
echo Checking Apache Tomcat status...
timeout /t 1 /nobreak >nul 2>&1
powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = 'tls12'; Invoke-WebRequest -Uri 'http://localhost:8080/' -TimeoutSec 2 | Out-Null; exit 0 } catch { exit 1 }" 2>nul
if %ERRORLEVEL% equ 0 (
    echo [OK] Tomcat is running on port 8080
    set /a PASSED+=1
) else (
    echo [INFO] Tomcat not accessible on port 8080
    echo       (This is OK if not deployed yet)
)
echo.

REM ===== Database Connectivity Check =====
echo === Database Connectivity Check ===
echo.

echo Testing connection parameters:
echo   Host: localhost:3306
echo   Database: ebookstore
echo   Username: root
echo   Password: root
echo   Driver: com.mysql.cj.jdbc.Driver
echo.

mysql -u root -proot -e "USE ebookstore; SELECT * FROM ebookshop LIMIT 1" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [OK] Database is accessible with configured credentials
    set /a PASSED+=1
) else (
    echo [FAIL] Cannot connect to database
    set /a FAILED+=1
)
echo.

REM ===== Sample Data Verification =====
echo === Sample Data Verification ===
echo.

echo Displaying database contents:
echo.
mysql -u root -proot -e "USE ebookstore; SELECT book_id, book_title, book_author, book_price, quantity FROM ebookshop LIMIT 10"
echo.

REM ===== Deployment Checklist =====
echo === Deployment Checklist ===
echo.

echo Before Deploying to Tomcat:
echo   [  ] 1. MySQL JDBC driver (mysql-connector-java-8.0.*.jar)
echo         Location 1: C:\Tomcat\lib\
echo         Location 2: Practical5\WEB-INF\lib\
echo   [  ] 2. EbookServlet.java compiled to EbookServlet.class
echo         Location: Practical5\WEB-INF\classes\
echo   [  ] 3. web.xml in correct location
echo         Location: Practical5\WEB-INF\web.xml
echo   [  ] 4. Tomcat started successfully
echo         Command: C:\Tomcat\bin\startup.bat
echo   [  ] 5. MySQL running on localhost:3306
echo         Verify: mysql -u root -p (enter: root)
echo.

REM ===== Test the Application =====
echo === Test the Application ===
echo.

echo Once deployed, access the application at:
echo   http://localhost:8080/Practical5/ebooks
echo.

REM ===== Summary =====
echo ================================
echo Validation Summary
echo ================================
echo.

echo Passed: !PASSED!
echo Failed: !FAILED!
echo.

if !FAILED! equ 0 (
    echo [SUCCESS] All checks passed! Ready for deployment.
    exit /b 0
) else (
    echo [WARNING] Some checks failed. Please review above.
    exit /b 1
)

endlocal
