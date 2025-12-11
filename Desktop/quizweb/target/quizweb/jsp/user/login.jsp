<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Quiz Portal</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            min-height: 100vh;
            /* Pencil-like grey gradient background */
            background: linear-gradient(135deg, #c0c0c0, #a0a0a0, #808080);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow: hidden;
            color: #222; /* Dark text for contrast */
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            width: 100%;
            max-width: 380px;
            color: #222; /* Dark text */
        }

        .glass-card h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #444;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #888;
            border-radius: 10px;
            background: #f9f9f9;
            color: #222;
            font-size: 15px;
            transition: border-color 0.3s ease, background 0.3s ease;
        }

        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: #aaa;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #555;
            background: #fff;
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #555;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            color: white;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }

        .btn-login:hover {
            background: #333;
        }

        .forgot-password {
            text-align: right;
            font-size: 13px;
            color: #666;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .forgot-password a {
            color: #444;
            text-decoration: underline;
        }

        .social-login {
            text-align: center;
            margin: 20px 0 10px;
            color: #333;
        }

        .social-buttons {
            display: flex;
            gap: 12px;
            justify-content: center;
        }

        .social-btn {
            background: #ddd;
            border: none;
            border-radius: 8px;
            padding: 10px 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .social-btn:hover {
            background: #bbb;
        }

        .social-btn img {
            width: 20px;
            height: 20px;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #444;
        }

        .register-link a {
            color: #333;
            font-weight: bold;
            text-decoration: underline;
        }

        .error, .success {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
        }
        .error {
            background: #ff4b5c;
            color: #fff;
        }
        .success {
            background: #38b2ac;
            color: #e6fffa;
        }
    </style>
</head>
<body>

    <div class="glass-card">
        <h2>Login</h2>

        <% if (request.getAttribute("success") != null) { %>
            <div class="success"><%= request.getAttribute("success") %></div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/jsp/user/login" method="post">
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="username@gmail.com" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="••••••••" required>
            </div>

            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="btn-login">Sign in</button>
        </form>

        <div class="social-login">
            <p>or continue with</p>
            <div class="social-buttons">
                <button type="button" class="social-btn">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg" alt="Google">
                </button>
                <button type="button" class="social-btn">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="GitHub">
                </button>
                <button type="button" class="social-btn">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg" alt="LinkedIn">
                </button>
            </div>
        </div>

        <div class="register-link">
            Don’t have an account? <a href="${pageContext.request.contextPath}/jsp/user/register">Register free</a>
        </div>
    </div>

</body>
</html>
