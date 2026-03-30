import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * EbookServlet - Displays ebook data from MySQL database in HTML table
 * 
 * Connects to MySQL database 'ebookstore' and retrieves all records from 
 * 'ebookshop' table, displaying them in a formatted HTML table.
 */
public class EbookServlet extends HttpServlet {

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ebookstore";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response content type to HTML
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // HTML header
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Ebook Shop</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
        out.println("table { border-collapse: collapse; width: 70%; margin: 20px auto; }");
        out.println("th { background-color: #4CAF50; color: white; padding: 12px; text-align: left; border: 1px solid #ddd; }");
        out.println("td { padding: 10px; border: 1px solid #ddd; }");
        out.println("tr:nth-child(even) { background-color: #f9f9f9; }");
        out.println("tr:hover { background-color: #f5f5f5; }");
        out.println("h1 { text-align: center; color: #333; }");
        out.println(".error { color: red; text-align: center; margin: 20px; }");
        out.println(".success { color: green; text-align: center; margin: 10px; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Ebook Shop Database</h1>");

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Step 1: Load JDBC Driver
            Class.forName(DB_DRIVER);

            // Step 2: Establish Connection to Database
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Create Statement
            stmt = con.createStatement();

            // Step 4: Execute SELECT Query
            rs = stmt.executeQuery("SELECT * FROM ebookshop");

            // Step 5: Display results in HTML table
            out.println("<p class='success'>Database connection successful!</p>");
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Book ID</th>");
            out.println("<th>Book Title</th>");
            out.println("<th>Author</th>");
            out.println("<th>Price (₹)</th>");
            out.println("<th>Quantity</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
                out.println("<tr>");
                out.println("<td>" + rs.getInt("book_id") + "</td>");
                out.println("<td>" + rs.getString("book_title") + "</td>");
                out.println("<td>" + rs.getString("book_author") + "</td>");
                out.println("<td>" + String.format("%.2f", rs.getDouble("book_price")) + "</td>");
                out.println("<td>" + rs.getInt("quantity") + "</td>");
                out.println("</tr>");
            }

            if (!hasData) {
                out.println("<tr><td colspan='5' style='text-align:center;'>No books found</td></tr>");
            }

            out.println("</tbody>");
            out.println("</table>");

        } catch (ClassNotFoundException e) {
            out.println("<p class='error'><b>Error:</b> MySQL JDBC Driver not found!</p>");
            out.println("<p>Add mysql-connector-java JAR to classpath</p>");
            System.out.println("Error: " + e.getMessage());
            
        } catch (SQLException e) {
            out.println("<p class='error'><b>Database Error:</b> " + e.getMessage() + "</p>");
            out.println("<p>Check if MySQL is running and database 'ebookstore' exists</p>");
            System.out.println("Error: " + e.getMessage());
            
        } catch (Exception e) {
            out.println("<p class='error'><b>Error:</b> " + e.getMessage() + "</p>");
            System.out.println("Error: " + e.getMessage());
            
        } finally {
            // Step 6: Close database connections
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        out.println("</body>");
        out.println("</html>");
    }
}
