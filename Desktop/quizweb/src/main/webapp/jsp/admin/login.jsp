<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Admin Login - Quiz App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
/* =========================
   Base & Reset
========================= */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

html, body {
    height: 100%;
    width: 100%;
}

/* =========================
   Layout
========================= */
body {
    display: flex;
    justify-content: center;
    align-items: center;
    background: #f0f2f5;
}

.login-wrapper {
    display: flex;
    width: 900px;
    max-width: 95%;
    min-height: 500px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 12px 40px rgba(0,0,0,0.15);
}

/* =========================
   Left Illustration Panel
========================= */
.login-illustration {
    flex: 1;
    background: linear-gradient(135deg, #1f3a63, #345a8a);
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
}

.login-illustration h1 {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 15px;
}

.login-illustration p {
    font-size: 16px;
    max-width: 250px;
    text-align: center;
    line-height: 1.5;
}

/* Optional illustration placeholder */
.login-illustration img {
    width: 200px;
    margin-top: 20px;
}

/* =========================
   Right Login Form Panel
========================= */
.login-form-panel {
    flex: 1;
    padding: 60px 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.login-form-panel h2 {
    font-size: 28px;
    font-weight: 700;
    color: #1a1a1a;
    margin-bottom: 10px;
}

.login-form-panel p {
    font-size: 14px;
    color: #555;
    margin-bottom: 25px;
}

/* Error message */
.error {
    background: #fdecea;
    color: #d93025;
    padding: 12px;
    border-radius: 6px;
    margin-bottom: 20px;
    font-size: 13px;
    text-align: left;
    border-left: 4px solid #d93025;
}

/* Inputs */
input[type="text"], input[type="password"] {
    width: 100%;
    padding: 14px;
    margin-bottom: 20px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 14px;
    transition: all 0.2s ease;
}

input[type="text"]:focus, input[type="password"]:focus {
    border-color: #3b82f6;
    box-shadow: 0 0 6px rgba(59,130,246,0.3);
    outline: none;
}

/* Button */
button {
    width: 100%;
    padding: 14px;
    font-size: 16px;
    font-weight: 600;
    background-color: #3b82f6;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
}

button:hover {
    background-color: #2563eb;
    box-shadow: 0 6px 15px rgba(59,130,246,0.3);
}

/* Footer */
.login-footer {
    margin-top: 20px;
    font-size: 12px;
    color: #888;
    text-align: center;
}

/* =========================
   Responsive
========================= */
@media(max-width:768px){
    .login-wrapper {
        flex-direction: column;
        min-height: auto;
    }
    .login-illustration {
        display: none;
    }
    .login-form-panel {
        padding: 40px 30px;
    }
}
</style>
</head>
<body>

<div class="login-wrapper">
    <!-- Left illustration panel -->
    <div class="login-illustration">
        <h1>QUIZ APP</h1>
        <p>Securely manage quizzes and questions for your team with ease and efficiency.</p>
        <!-- Optional image/illustration -->
        <!-- <img src="your-logo-or-illustration.png" alt="Illustration"> -->
    </div>

    <!-- Right login form panel -->
    <div class="login-form-panel">
        <h2>Admin Login</h2>
        <p>Sign in to access your dashboard</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/admin/login" method="post" autocomplete="off">
            <input type="text" name="username" placeholder="Email" required autofocus />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Login</button>
        </form>

        <div class="login-footer">
            &copy; <%= java.time.Year.now() %> Quiz App. All rights reserved.
        </div>
    </div>
</div>

</body>
</html>
