<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bank Application - EJB Demo</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h1 { color: #333; text-align: center; margin-bottom: 30px; }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
        }
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        button {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-primary {
            background: #28a745;
            color: white;
        }
        .btn-primary:hover {
            background: #218838;
        }
        .message {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏦 Bank Application (EJB Demo)</h1>
        
        <%
        String action = request.getParameter("action");
        String message = "";
        
        try {
            InitialContext ctx = new InitialContext();
            BankService bankService = (BankService) ctx.lookup("java:global/BankApp/BankServiceBean!BankService");
            
            if ("create".equals(action)) {
                String accountId = request.getParameter("accountId");
                double balance = Double.parseDouble(request.getParameter("balance"));
                bankService.createAccount(accountId, balance);
                message = "<div class='message success'>✓ Account created: " + accountId + " with balance: " + balance + "</div>";
            }
            else if ("deposit".equals(action)) {
                String accountId = request.getParameter("accountId");
                double amount = Double.parseDouble(request.getParameter("amount"));
                double newBalance = bankService.deposit(accountId, amount);
                message = "<div class='message success'>✓ Deposited: " + amount + " | New Balance: " + newBalance + "</div>";
            }
            else if ("withdraw".equals(action)) {
                String accountId = request.getParameter("accountId");
                double amount = Double.parseDouble(request.getParameter("amount"));
                double newBalance = bankService.withdraw(accountId, amount);
                message = "<div class='message success'>✓ Withdrawn: " + amount + " | New Balance: " + newBalance + "</div>";
            }
            else if ("balance".equals(action)) {
                String accountId = request.getParameter("accountId");
                double balance = bankService.getBalance(accountId);
                message = "<div class='message success'>✓ Account: " + accountId + " | Balance: " + balance + "</div>";
            }
        } catch (Exception e) {
            message = "<div class='message error'>✗ Error: " + e.getMessage() + "</div>";
        }
        
        if (!message.isEmpty()) {
            out.print(message);
        }
        %>
        
        <!-- Create Account -->
        <h3>Create Account</h3>
        <form method="post">
            <div class="form-group">
                <label>Account ID:</label>
                <input type="text" name="accountId" placeholder="E.g., ACC001" required>
            </div>
            <div class="form-group">
                <label>Initial Balance:</label>
                <input type="number" name="balance" placeholder="5000" required>
            </div>
            <button type="submit" name="action" value="create" class="btn-primary">Create Account</button>
        </form>
        
        <hr style="margin: 30px 0; border: 1px solid #ddd;">
        
        <!-- Bank Operations -->
        <h3>Bank Operations</h3>
        <form method="post">
            <div class="form-group">
                <label>Account ID:</label>
                <input type="text" name="accountId" placeholder="ACC001" required>
            </div>
            <div class="form-group">
                <label>Amount:</label>
                <input type="number" name="amount" placeholder="1000" required>
            </div>
            <div class="button-group">
                <button type="submit" name="action" value="deposit" class="btn-primary">Deposit</button>
                <button type="submit" name="action" value="withdraw" class="btn-primary">Withdraw</button>
                <button type="submit" name="action" value="balance" class="btn-primary">Check Balance</button>
            </div>
        </form>
    </div>
</body>
</html>
