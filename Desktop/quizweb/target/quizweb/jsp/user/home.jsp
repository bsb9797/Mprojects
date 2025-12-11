<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Quiz Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #fdfbfb, #ebedee); /* soft gradient */
            color: #1a1a1a;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background: #000000;
            padding: 18px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.85);
        }
        .logo {
            color: #f5f3e7;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 2px;
            cursor: default;
        }
        .nav-links a {
            color: #f5f3e7;
            text-decoration: none;
            margin-left: 40px;
            font-size: 17px;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .nav-links a:hover {
            color: #ff6f61;
        }
        .hero {
            flex: 1;
            background: rgba(0, 0, 0, 0.05); /* subtle overlay */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 60px 20px;
        }
        .hero h1 {
            font-size: 52px;
            font-weight: 900;
            margin-bottom: 20px;
            color: #1a1a1a;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.05);
        }
        .hero p {
            font-size: 22px;
            margin-bottom: 40px;
            font-weight: 600;
            color: #444;
            max-width: 600px;
        }
        .btn-login-hero {
            background: #5c6bc0; /* soft indigo */
            color: white;
            padding: 16px 42px;
            border-radius: 40px;
            font-size: 18px;
            font-weight: 700;
            text-decoration: none;
            box-shadow: 0 8px 25px rgba(92, 107, 192, 0.4);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-login-hero:hover {
            background: #3f51b5;
            box-shadow: 0 10px 30px rgba(63, 81, 181, 0.6);
        }
        @media (max-width: 700px) {
            .navbar {
                padding: 15px 25px;
                flex-direction: column;
                align-items: flex-start;
            }
            .nav-links {
                margin-top: 10px;
            }
            .nav-links a {
                margin-left: 0;
                margin-right: 20px;
                font-size: 15px;
            }
            .hero h1 {
                font-size: 38px;
            }
            .hero p {
                font-size: 18px;
                max-width: 90%;
            }
            .btn-login-hero {
                padding: 14px 36px;
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">ONLINE QUIZ</div>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/jsp/admin/login">Admin Login</a>
            <a href="${pageContext.request.contextPath}/jsp/user/login">Login/Signup</a>
        </div>
    </nav>

    <div class="hero">
        <h1>Welcome to Online Quiz Portal</h1>
        <p>Test your knowledge with our interactive quizzes and challenge yourself every day!</p>
        <a href="${pageContext.request.contextPath}/jsp/user/login" class="btn-login-hero">Start</a>
    </div>
</body>
</html>
