<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Register - Quiz Portal</title>
<style>
/* Reset & Base */
* { margin: 0; padding: 0; box-sizing: border-box; font-family:'Poppins', sans-serif; }
html, body { height: 100%; background:#0d0d0d; overflow:hidden; }
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center; /* horizontal center */
    align-items: center;     /* vertical center */
    background: #0d0d0d;
    overflow: hidden;
}

/* Register container */
.register-container {
    width: 500px; max-width: 90%;
    background: rgba(255,255,255,0.05);
    border-radius: 25px;
    padding: 40px 30px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    text-align: center;
    backdrop-filter: blur(20px);
    position: relative;
    z-index: 1;
    border: 1px solid rgba(255,255,255,0.15);
    animation: fadeInUp 1.2s ease;
    /* Center fix */
    display: flex;
    flex-direction: column;
    justify-content: center;
}


/* Animated gradient background */
body::before {
    content:"";
    position:fixed; top:0; left:0;
    width:200%; height:200%;
    background: conic-gradient(from 180deg at 50% 50%, #00c6ff, #0072ff, #00ffcc, #ff6a00, #ee0979, #00c6ff);
    animation: rotateBg 30s linear infinite;
    z-index:-3; opacity:0.15;
}
@keyframes rotateBg { from {transform:rotate(0deg);} to {transform:rotate(360deg);} }

/* Floating neon particles */
.particles { position:fixed; width:100%; height:100%; z-index:-2; pointer-events:none; }
.particles span {
    position:absolute; width:6px; height:6px;
    border-radius:50%; background: #00c6ff;
    animation: float 15s linear infinite;
}
.particles span:nth-child(odd){background:#ff6a00;}
.particles span:nth-child(even){background:#ee0979;}
@keyframes float { from {transform:translateY(100vh) scale(0);} to {transform:translateY(-10vh) scale(1);} }

/* Register container - Glassmorphism */
.register-container {
    width: 500px; max-width:90%;
    background: rgba(255,255,255,0.05);
    border-radius: 25px; padding: 40px 30px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    text-align:center; backdrop-filter: blur(20px);
    position:relative; z-index:1;
    border:1px solid rgba(255,255,255,0.15);
    animation: fadeInUp 1.2s ease;
}
@keyframes fadeInUp { from {opacity:0; transform:translateY(50px);} to {opacity:1; transform:translateY(0);} }

/* Heading */
h2 {
    font-size: 36px; margin-bottom: 20px;
    background: linear-gradient(90deg,#00ffcc,#00c6ff,#ff00c8,#ff6a00);
    -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    text-shadow:0 0 20px rgba(0,255,255,0.4);
    animation: glowText 3s infinite alternate;
}
@keyframes glowText { from {text-shadow:0 0 10px #00c6ff;} to {text-shadow:0 0 35px #ff6a00;} }

/* Paragraph */
p { margin-bottom:20px; font-size:15px; color:#ddd; }

/* Form fields */
.form-group { margin-bottom:18px; text-align:left; }
label { display:block; margin-bottom:6px; font-weight:600; color:#eee; }
input[type="text"], input[type="email"], input[type="password"] {
    width:100%; padding:12px 14px;
    border:none; border-radius:12px;
    font-size:15px; background: rgba(255,255,255,0.1);
    color:#fff; outline:none; transition: all 0.3s ease;
    box-shadow: inset 0 0 5px rgba(0,0,0,0.3);
}
input:focus {
    background: rgba(255,255,255,0.25);
    box-shadow: 0 0 15px #00c6ff, 0 0 10px #ff6a00 inset;
}

/* Button - Neon Glass */
button {
    width:100%; padding:14px;
    font-size:16px; font-weight:bold;
    background: linear-gradient(135deg,#ff6a00,#ee0979);
    color:#fff; border:none; border-radius:50px;
    cursor:pointer; transition:all 0.4s ease;
    position:relative; overflow:hidden;
    box-shadow: 0 0 15px rgba(255,0,128,0.5);
}
button::before {
    content:""; position:absolute; top:0; left:-100%; width:100%; height:100%;
    background: rgba(255,255,255,0.2); transform:skewX(-20deg); transition:left 0.5s;
}
button:hover::before { left:100%; }
button:hover { transform:translateY(-3px) scale(1.05); box-shadow:0 0 35px rgba(255,0,128,0.7),0 0 20px rgba(0,198,255,0.6); }

/* Login link */
.login-link { margin-top:18px; font-size:14px; }
.login-link a { color:#00c6ff; text-decoration:none; transition:color 0.3s ease; }
.login-link a:hover { color:#ffcc00; text-decoration:underline; }

/* Alerts */
.error, .success {
    padding:12px; border-radius:12px; margin-bottom:18px;
    text-align:center; font-weight:600; font-size:14px;
    animation: fadeIn 0.6s ease;
}
.error { background: rgba(255,75,92,0.8); color:#fff; }
.success { background: rgba(56,178,172,0.8); color:#fff; }
@keyframes fadeIn { from {opacity:0;} to {opacity:1;} }

/* Responsive */
@media(max-width:600px){
    .register-container{ padding:30px 20px; }
    h2{ font-size:28px; }
    button{ font-size:15px; }
}
</style>
</head>
<body>
    <!-- Floating particles -->
    <div class="particles">
        <span style="left:5%; animation-duration:12s;"></span>
        <span style="left:25%; animation-duration:18s;"></span>
        <span style="left:50%; animation-duration:20s;"></span>
        <span style="left:75%; animation-duration:22s;"></span>
        <span style="left:90%; animation-duration:28s;"></span>
    </div>

    <div class="register-container">
        <h2>Create Account</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%=request.getAttribute("error")%></div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="success"><%=request.getAttribute("success")%></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/user/register" method="post">
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
            <button type="submit">Register</button>
        </form>

        <div class="login-link">
            <h3><a href="<%= request.getContextPath() %>/jsp/user/login.jsp">Login here!</a></h3>
        </div>
    </div>
</body>
</html>
