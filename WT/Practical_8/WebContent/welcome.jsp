<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Login Success</title>
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
        .success-icon { font-size: 3em; margin-bottom: 20px; }
        h1 { color: #28a745; margin-bottom: 20px; }
        .details {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: left;
        }
        .detail-row {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .detail-label { font-weight: bold; color: #333; }
        .detail-value { color: #667eea; }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-logout {
            background: #dc3545;
        }
        .btn:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">✅</div>
        <h1>Login Successful!</h1>
        
        <s:if test="hasActionMessages()">
            <p style="color: #28a745; font-size: 1.1em;">
                <s:actionmessage theme="xhtml"/>
            </p>
        </s:if>
        
        <div class="details">
            <div class="detail-row">
                <span class="detail-label">Name:</span>
                <span class="detail-value"><s:property value="name"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Mobile:</span>
                <span class="detail-value"><s:property value="mobileNumber"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Email:</span>
                <span class="detail-value"><s:property value="emailId"/></span>
            </div>
        </div>
        
        <s:url action="logout" var="logoutUrl"/>
        <s:url action="home" var="homeUrl"/>
        <a href="${logoutUrl}" class="btn btn-logout">Logout</a>
        <a href="${homeUrl}" class="btn">Back to Login</a>
    </div>
</body>
</html>
