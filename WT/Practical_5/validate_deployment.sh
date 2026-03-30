#!/bin/bash
# Deployment Validation Script for Ebook Shop Application
# This script verifies that all components are properly set up

echo "================================"
echo "Ebook Shop - Deployment Validator"
echo "================================"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counter for checks
PASSED=0
FAILED=0

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print result
print_result() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓ PASS${NC}: $2"
        ((PASSED++))
    else
        echo -e "${RED}✗ FAIL${NC}: $2"
        ((FAILED++))
    fi
}

echo "=== System Requirements Check ==="
echo ""

# Check Java Installation
echo -n "Checking Java Installation... "
if command_exists java; then
    JAVA_VERSION=$(java -version 2>&1 | head -1)
    echo -e "${GREEN}✓ Found${NC}: $JAVA_VERSION"
    print_result 0 "Java is installed"
else
    echo -e "${RED}✗ Not Found${NC}"
    print_result 1 "Java is installed"
fi
echo ""

# Check MySQL Installation
echo -n "Checking MySQL Installation... "
if command_exists mysql; then
    MYSQL_VERSION=$(mysql --version)
    echo -e "${GREEN}✓ Found${NC}: $MYSQL_VERSION"
    print_result 0 "MySQL is installed"
else
    echo -e "${YELLOW}⚠ Not found in PATH${NC}"
    echo "  (MySQL might still be installed but not in PATH)"
fi
echo ""

# Check MySQL Server Status
echo -n "Checking MySQL Server Status... "
if mysql -u root -proot -e "SELECT 1" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Running${NC}"
    print_result 0 "MySQL server is running with default credentials (root/root)"
else
    echo -e "${RED}✗ Not running or wrong credentials${NC}"
    print_result 1 "MySQL server is running with default credentials (root/root)"
fi
echo ""

echo "=== Database Setup Check ==="
echo ""

# Check if database exists
echo -n "Checking if 'ebookstore' database exists... "
if mysql -u root -proot -e "USE ebookstore" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Found${NC}"
    print_result 0 "ebookstore database exists"
else
    echo -e "${RED}✗ Not found${NC}"
    print_result 1 "ebookstore database exists"
fi
echo ""

# Check if table exists
echo -n "Checking if 'ebookshop' table exists... "
if mysql -u root -proot -e "USE ebookstore; SELECT COUNT(*) FROM ebookshop" >/dev/null 2>&1; then
    RECORD_COUNT=$(mysql -u root -proot -e "USE ebookstore; SELECT COUNT(*) FROM ebookshop" | tail -1)
    echo -e "${GREEN}✓ Found${NC} with $RECORD_COUNT records"
    print_result 0 "ebookshop table exists"
else
    echo -e "${RED}✗ Not found${NC}"
    print_result 1 "ebookshop table exists"
fi
echo ""

# Check table structure
echo -n "Checking table structure... "
COLUMNS=$(mysql -u root -proot -e "USE ebookstore; DESCRIBE ebookshop" 2>/dev/null | wc -l)
if [ $COLUMNS -ge 5 ]; then
    echo -e "${GREEN}✓ Valid${NC} with columns"
    mysql -u root -proot -e "USE ebookstore; DESCRIBE ebookshop" | sed 's/^/  /'
    print_result 0 "Table has correct structure"
else
    echo -e "${RED}✗ Invalid${NC}"
    print_result 1 "Table has correct structure"
fi
echo ""

echo "=== Application Files Check ==="
echo ""

# Check for Java source file
echo -n "Checking EbookServlet.java exists... "
if [ -f "HttpServlet/EbookServlet.java" ]; then
    echo -e "${GREEN}✓ Found${NC}"
    print_result 0 "EbookServlet.java exists"
    LINES=$(wc -l < HttpServlet/EbookServlet.java)
    echo "  Lines of code: $LINES"
else
    echo -e "${RED}✗ Not found${NC}"
    print_result 1 "EbookServlet.java exists"
fi
echo ""

# Check for web.xml
echo -n "Checking web.xml exists... "
if [ -f "HttpServlet/Web.xml" ] || [ -f "HttpServlet/web.xml" ]; then
    echo -e "${GREEN}✓ Found${NC}"
    print_result 0 "web.xml exists"
else
    echo -e "${RED}✗ Not found${NC}"
    print_result 1 "web.xml exists"
fi
echo ""

# Check for database setup script
echo -n "Checking database_setup.sql exists... "
if [ -f "database_setup.sql" ]; then
    echo -e "${GREEN}✓ Found${NC}"
    print_result 0 "database_setup.sql exists"
else
    echo -e "${RED}✗ Not found${NC}"
    print_result 1 "database_setup.sql exists"
fi
echo ""

# Check for documentation
echo -n "Checking documentation files... "
DOCS_COUNT=0
[ -f "README.md" ] && ((DOCS_COUNT++))
[ -f "SETUP_INSTRUCTIONS.md" ] && ((DOCS_COUNT++))
[ -f "QUICK_REFERENCE.md" ] && ((DOCS_COUNT++))
[ -f "CODE_DOCUMENTATION.md" ] && ((DOCS_COUNT++))

if [ $DOCS_COUNT -ge 2 ]; then
    echo -e "${GREEN}✓ Found${NC} $DOCS_COUNT documentation files"
    print_result 0 "Documentation exists"
else
    echo -e "${YELLOW}⚠ Found${NC} only $DOCS_COUNT documentation files"
fi
echo ""

echo "=== Apache Tomcat Check ==="
echo ""

# Check Tomcat status (if running on default port)
echo -n "Checking Apache Tomcat (localhost:8080)... "
if curl -s http://localhost:8080/ >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Running${NC}"
    print_result 0 "Tomcat is running"
else
    echo -e "${YELLOW}⚠ Not accessible${NC}"
    echo "  (May not be running yet - this is OK)"
fi
echo ""

echo "=== Database Connectivity Check ==="
echo ""

# Test JDBC connectivity simulation
echo "Testing connection parameters:"
echo "  Host: localhost:3306"
echo "  Database: ebookstore"
echo "  Username: root"
echo "  Password: root"
echo "  Driver: com.mysql.cj.jdbc.Driver"
echo ""

if mysql -u root -proot -e "USE ebookstore; SELECT * FROM ebookshop LIMIT 1" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Connection parameters are valid${NC}"
    print_result 0 "Database is accessible with configured credentials"
else
    echo -e "${RED}✗ Cannot connect${NC}"
    print_result 1 "Database is accessible"
fi
echo ""

echo "=== Sample Data Verification ==="
echo ""

echo "Database Contents:"
mysql -u root -proot -e "USE ebookstore; SELECT book_id, book_title, book_author, book_price, quantity FROM ebookshop" | head -10

echo ""
echo "=== Deployment Checklist ==="
echo ""

echo "Before Deploying to Tomcat:"
echo " [ ] 1. MySQL JDBC driver (mysql-connector-java-8.0.*.jar)"
echo "        Location 1: Tomcat/lib/"
echo "        Location 2: Practical5/WEB-INF/lib/"
echo " [ ] 2. EbookServlet.java compiled to EbookServlet.class"
echo "        Location: Practical5/WEB-INF/classes/"
echo " [ ] 3. web.xml in correct location"
echo "        Location: Practical5/WEB-INF/web.xml"
echo " [ ] 4. Tomcat started successfully"
echo "        Command: C:\\Tomcat\\bin\\startup.bat (Windows)"
echo "        Command: sh /opt/tomcat/bin/startup.sh (Linux/Mac)"
echo ""

echo "=== Test the Application ==="
echo ""
echo "Once deployed, access the application at:"
echo "  http://localhost:8080/Practical5/ebooks"
echo ""

echo "================================"
echo "Validation Summary"
echo "================================"
echo -e "${GREEN}Passed: $PASSED${NC}"
echo -e "${RED}Failed: $FAILED${NC}"

if [ $FAILED -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✓ All checks passed! Ready for deployment.${NC}"
    exit 0
else
    echo ""
    echo -e "${YELLOW}⚠ Some checks failed. Please review above.${NC}"
    exit 1
fi
