<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Struts</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            max-width: 450px;
            width: 100%;
        }
        h1 { color: #333; text-align: center; margin-bottom: 30px; }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }
        .error-message {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .form-buttons {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }
        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-submit {
            background: #28a745;
            color: white;
        }
        .btn-submit:hover {
            background: #218838;
        }
        .btn-reset {
            background: #6c757d;
            color: white;
        }
        .btn-reset:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔐 Login Form</h1>
        
        <!-- Show Errors -->
        <s:if test="hasFieldErrors()">
            <div class="alert-error">
                <strong>Please fix the errors below:</strong>
                <s:fielderror theme="xhtml"/>
            </div>
        </s:if>
        
        <!-- Login Form -->
        <s:form action="login" method="post" theme="simple">
            
            <div class="form-group">
                <label>Name:</label>
                <s:textfield name="name" placeholder="Enter your name"/>
                <s:fielderror fieldName="name">
                    <s:param><div class="error-message"><s:property/></div></s:param>
                </s:fielderror>
                <small style="color: #666;">Alphabets and spaces only</small>
            </div>
            
            <div class="form-group">
                <label>Mobile Number:</label>
                <s:textfield name="mobileNumber" placeholder="10-digit number" maxlength="10"/>
                <s:fielderror fieldName="mobileNumber">
                    <s:param><div class="error-message"><s:property/></div></s:param>
                </s:fielderror>
                <small style="color: #666;">Exactly 10 digits</small>
            </div>
            
            <div class="form-group">
                <label>Email ID:</label>
                <s:textfield name="emailId" placeholder="your@email.com"/>
                <s:fielderror fieldName="emailId">
                    <s:param><div class="error-message"><s:property/></div></s:param>
                </s:fielderror>
                <small style="color: #666;">Valid email format</small>
            </div>
            
            <div class="form-buttons">
                <s:submit value="Login" cssClass="btn btn-submit"/>
                <s:reset value="Clear" cssClass="btn btn-reset"/>
            </div>
        </s:form>
    </div>
</body>
</html>
