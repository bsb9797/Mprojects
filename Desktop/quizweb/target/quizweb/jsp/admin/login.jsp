<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Login - Quiz Portal</title>
    <style>
        /* Reset and basics */
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body, html {
            height: 100%;
            background: linear-gradient(135deg, #204051 0%, #3b6978 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #f0f0f0;
        }

        .login-container {
            background: #ffffff;
            color: #204051;
            border-radius: 24px;
            box-shadow: 0 12px 40px rgba(32, 64, 81, 0.3);
            max-width: 900px;
            width: 90%;
            display: flex;
            overflow: hidden;
            min-height: 400px;
        }

        .login-image {
            flex: 1;
            background: linear-gradient(135deg, #3b6978 0%, #204051 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .login-image img {
            width: 220px;
            height: 220px;
            border-radius: 50%;
            object-fit: cover;
            filter: drop-shadow(0 2px 6px rgba(0,0,0,0.3));
        }

        .login-form {
            flex: 1;
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 40px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #204051;
            user-select: none;
        }

        .form-group {
            margin-bottom: 28px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #486581;
            font-size: 15px;
            user-select: none;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #3b6978;
            border-radius: 12px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #204051;
            outline: none;
            box-shadow: 0 0 8px #3b6978aa;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #3b6978 0%, #204051 100%);
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            color: #f0f0f0;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(32, 64, 81, 0.3);
            transition: background 0.3s ease, transform 0.2s ease;
            user-select: none;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #204051 0%, #16313d 100%);
            transform: translateY(-3px);
        }

        .error {
            background: #ffccd5;
            color: #a81d24;
            padding: 14px 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(168, 29, 36, 0.3);
            user-select: none;
        }

        @media (max-width: 720px) {
            .login-container {
                flex-direction: column;
                border-radius: 24px;
                min-height: auto;
            }
            .login-image, .login-form {
                flex: none;
                width: 100%;
                padding: 40px 30px;
            }
            .login-image {
                border-radius: 24px 24px 0 0;
            }
            .login-form {
                border-radius: 0 0 24px 24px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-image">
            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'%3E%3Ccircle cx='100' cy='100' r='90' fill='%23fff'/%3E%3Cpath d='M100 50c-27.6 0-50 22.4-50 50s22.4 50 50 50 50-22.4 50-50-22.4-50-50-50zm0 90c-22.1 0-40-17.9-40-40s17.9-40 40-40 40 17.9 40 40-17.9 40-40 40z' fill='%233b6978'/%3E%3Ccircle cx='85' cy='90' r='5' fill='%233b6978'/%3E%3Ccircle cx='115' cy='90' r='5' fill='%233b6978'/%3E%3Cpath d='M80 115c0-11 9-20 20-20s20 9 20 20' stroke='%233b6978' stroke-width='3' fill='none'/%3E%3C/svg%3E" alt="Admin" />
        </div>
        <div class="login-form">
            <h2>Welcome Back!</h2>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>
            <form action="${pageContext.request.contextPath}/admin/login" method="post" autocomplete="off">
                <div class="form-group">
                    <label for="username">Enter Email Address...</label>
                    <input type="text" id="username" name="username" required autofocus />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <button type="submit" class="btn-login">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
