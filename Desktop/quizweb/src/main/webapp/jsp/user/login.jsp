<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login - Quiz Portal</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">

<style>

/* ------------------ GLOBAL RESET ------------------ */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    background: #0a0a0f;
}

/* ------------------ BACKGROUND ANIMATION ------------------ */

body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: linear-gradient(140deg, #0a0a0f, #1c1440, #090f33);
    background-size: 250% 250%;
    animation: bgMove 12s infinite alternate;
    z-index: -3;
}
@keyframes bgMove {
    from { background-position: 0 0; }
    to { background-position: 100% 100%; }
}

/* Subtle grid overlay */
body::after {
    content: "";
    position: fixed;
    inset: 0;
    background: url("https://www.transparenttextures.com/patterns/cubes.png");
    opacity: 0.05;
    z-index: -2;
}

/* Floating particles */
.particle {
    position: fixed;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: rgba(255,255,255,0.25);
    animation: floatUp 12s infinite ease-in-out;
    z-index: -1;
}
@keyframes floatUp {
    0% { transform: translateY(0); opacity: 0.2; }
    50% { opacity: 0.6; }
    100% { transform: translateY(-1200px); opacity: 0; }
}

/* ------------------ LOGIN CARD ------------------ */

.login-card {
    width: 430px;
    max-width: 90%;
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(20px);
    padding: 45px 35px;
    border-radius: 20px;
    box-shadow: 0 15px 45px rgba(0,0,0,0.6);
    animation: fadeIn 1.2s ease;
    z-index: 10;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(40px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Title */
.login-card h2 {
    font-size: 34px;
    font-family: "Montserrat";
    background: linear-gradient(90deg, #00d4ff, #006aff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;
    margin-bottom: 10px;
    text-shadow: 0 0 30px rgba(0,198,255,0.7);
    animation: glowText 3s infinite alternate;
}
@keyframes glowText {
    from { text-shadow: 0 0 10px #00c6ff; }
    to { text-shadow: 0 0 30px #00ffcc; }
}

.login-card p {
    color: #ccc;
    font-size: 16px;
    text-align: center;
    margin-bottom: 25px;
}

/* Inputs */
.login-card input {
    width: 100%;
    padding: 14px;
    margin-bottom: 20px;
    background: rgba(255,255,255,0.18);
    border: none;
    border-radius: 12px;
    font-size: 16px;
    color: white;
    outline: none;
    transition: 0.3s;
}
.login-card input:focus {
    background: rgba(255,255,255,0.25);
    box-shadow: 0 0 12px #00c6ff;
}

/* Button */
.login-card button {
    width: 100%;
    padding: 15px;
    font-size: 18px;
    border: none;
    border-radius: 40px;
    background: linear-gradient(135deg, #ff8f21, #ff0055);
    color: white;
    font-weight: 700;
    cursor: pointer;
    transition: 0.35s;
}
.login-card button:hover {
    transform: translateY(-3px) scale(1.04);
    box-shadow: 0 0 20px rgba(255, 0, 120, 0.7);
}

/* Links */
.login-card .links {
    text-align: center;
    margin-top: 20px;
}

.login-card a {
    color: #00c6ff;
    text-decoration: none;
    font-weight: 600;
}
.login-card a:hover {
    color: #ffcc33;
    text-decoration: underline;
}

</style>

<!-- Corrected particles script -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    for (let i = 0; i < 35; i++) {
        const p = document.createElement("div");
        p.className = "particle";
        const size = (Math.random() * 6) + 4;
        p.style.width = size + "px";
        p.style.height = size + "px";
        p.style.left = Math.random() * window.innerWidth + "px";
        p.style.top = (Math.random() * window.innerHeight + 300) + "px";
        p.style.animationDuration = (10 + Math.random() * 10) + "s";
        document.body.appendChild(p);
    }
});
</script>

</head>

<body>

<div class="login-card">

    <h2>User Login</h2>
    <p>Welcome back! Please sign in to continue.</p>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:#ff5050;text-align:center;">
            <%= request.getAttribute("error") %>
        </p>
    <% } %>

    <form action="${pageContext.request.contextPath}/user/login" method="post">

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Sign In</button>
    </form>

    <div class="links">
        Not registered?  
        <a href="${pageContext.request.contextPath}/jsp/user/register.jsp">Create an account</a>
    </div>
</div>

</body>
</html>
