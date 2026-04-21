<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
    <title>Home - Struts Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 500px;
        }
        h1 { color: #333; margin-bottom: 20px; }
        p { color: #666; margin: 15px 0; }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        .btn:hover { background: #5568d3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔐 Apache Struts Login Practical</h1>
        <p>A simple login application demonstrating form validation with Apache Struts.</p>
        <ul style="text-align: left; display: inline-block; margin: 20px 0;">
            <li>✓ Name validation (alphabets only)</li>
            <li>✓ Mobile validation (10 digits)</li>
            <li>✓ Email validation</li>
            <li>✓ Error messages</li>
            <li>✓ Session management</li>
        </ul>
        <s:url action="home" var="loginUrl"/>
        <a href="${loginUrl}" class="btn">Start Login</a>
    </div>
</body>
</html>
