<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Register - Quiz Portal</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            /* Pencil-like gradient background */
            background: linear-gradient(135deg, #c0c0c0 0%, #a0a0a0 50%, #808080 100%);
            color: #222; /* Dark text for contrast */
        }
        .register-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px 35px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            max-width: 420px;
            width: 100%;
            text-align: center;
            color: #222;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
            font-weight: 700;
            font-size: 28px;
        }
        .form-group {
            margin-bottom: 22px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #444;
            font-weight: 600;
            font-size: 15px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 13px 15px;
            border: 1.8px solid #bbb;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease, background 0.3s ease;
            background: #f8f8f8;
            color: #222;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #666;
            box-shadow: 0 0 8px rgba(102, 102, 102, 0.5);
            background: #fff;
        }
        .btn-register {
            width: 100%;
            padding: 15px 0;
            background: #555; /* dark grey button */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        .btn-register:hover {
            background: #333;
            transform: translateY(-3px);
            box-shadow: 0 12px 26px rgba(0,0,0,0.5);
        }
        .error, .success {
            padding: 14px 18px;
            border-radius: 8px;
            margin-bottom: 24px;
            font-weight: 600;
            font-size: 15px;
            text-align: center;
        }
        .error {
            background: #ffebee;
            color: #c62828;
            box-shadow: 0 4px 15px rgba(198, 40, 40, 0.3);
        }
        .success {
            background: #d4edda;
            color: #155724;
            box-shadow: 0 4px 15px rgba(21, 87, 36, 0.3);
        }
        .login-link {
            margin-top: 24px;
            font-size: 15px;
            color: #444;
        }
        .login-link a {
            color: #555;
            text-decoration: none;
            font-weight: 600;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create Account</h2>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="success"><%= request.getAttribute("success") %></div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/jsp/user/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required />
            </div>
            
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required />
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required />
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />
            </div>
            
            <button type="submit" class="btn-register">Register</button>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="${pageContext.request.contextPath}/jsp/user/login">Login here</a>
        </div>
    </div>
</body>
</html>
