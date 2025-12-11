<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ultimate Quiz Portal</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">

<style>

/* ------------------------------------------------ */
/* BASIC RESET */
/* ------------------------------------------------ */
*{
  margin:0;
  padding:0;
  box-sizing:border-box;
}

body{
  font-family:"Poppins", sans-serif;
  overflow-x:hidden;
  min-height:100vh;
  background:#0a0a0f;

  /* THE FIX */
  display:flex;
  flex-direction:column;
}

/* ------------------------------------------------ */
/* BACKGROUND LAYERS */
/* ------------------------------------------------ */

/* Main gradient background */
body::before{
  content:"";
  position:fixed;
  inset:0;
  background:linear-gradient(140deg,#0a0a0f,#1c1440,#090f33);
  background-size:250% 250%;
  animation:bgMove 14s infinite alternate;
  z-index:-3;
}

@keyframes bgMove{
  from{background-position:0 0;}
  to{background-position:100% 100%;}
}

/* Faint grid overlay */
body::after{
  content:"";
  position:fixed;
  inset:0;
  background:url("https://www.transparenttextures.com/patterns/cubes.png");
  opacity:0.05;
  z-index:-2;
}

/* ------------------------------------------------ */
/* FLOATING PARTICLES */
/* ------------------------------------------------ */
.particle{
  position:fixed;
  width:8px;
  height:8px;
  border-radius:50%;
  background:rgba(255,255,255,0.25);
  animation:floatUp 12s infinite ease-in-out;
  z-index:-1;
}

@keyframes floatUp{
  0%{transform:translateY(0); opacity:0.2;}
  50%{opacity:0.6;}
  100%{transform:translateY(-1200px); opacity:0;}
}

/* ------------------------------------------------ */
/* HEADER */
/* ------------------------------------------------ */

header{
  width:100%;
  padding:20px 50px;
  position:sticky;
  top:0;
  display:flex;
  justify-content:space-between;
  align-items:center;
  background:rgba(10,10,15,0.8);
  backdrop-filter:blur(20px);
  border-bottom:2px solid rgba(255,255,255,0.07);
  z-index:2000;
  box-shadow:0 5px 25px rgba(0,0,0,0.5);
}

.logo{
  font-size:32px;
  font-family:"Montserrat";
  font-weight:700;
  background:linear-gradient(90deg,#ff8f21,#ff0055);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  letter-spacing:2px;
  text-shadow:0 0 12px rgba(255,0,120,0.4);
}

.nav-links{
  display:flex;
  gap:30px;
}

.nav-links a{
  text-decoration:none;
  color:#ffffffd9;
  font-weight:600;
  font-size:17px;
  transition:0.3s;
  position:relative;
}

.nav-links a:hover{
  color:#ffd557;
}

.nav-links a::after{
  content:"";
  position:absolute;
  left:0;
  bottom:-6px;
  width:0%;
  height:3px;
  background:linear-gradient(90deg,#ff8f21,#ff0055);
  border-radius:5px;
  transition:width 0.35s;
}

.nav-links a:hover::after{
  width:100%;
}

/* ------------------------------------------------ */
/* HERO CONTENT */
/* ------------------------------------------------ */

.container{
  text-align:center;
  padding:130px 20px;
  flex:1;
}

.container h1{
  font-size:60px;
  font-family:"Montserrat";
  background:linear-gradient(90deg,#00d4ff,#006aff);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  margin-bottom:20px;
  animation:glow 3s infinite alternate;
}

@keyframes glow{
  from{text-shadow:0 0 15px #00d4ff;}
  to{text-shadow:0 0 38px #006aff;}
}

.container p{
  max-width:750px;
  margin:auto;
  color:#d6d6d6;
  font-size:20px;
  line-height:1.7;
  margin-bottom:50px;
}

/* ------------------------------------------------ */
/* BUTTON */
/* ------------------------------------------------ */

.btn-start{
  padding:18px 50px;
  font-size:22px;
  text-decoration:none;
  border-radius:60px;
  background:linear-gradient(135deg,#ff8f21,#ff0055);
  color:white;
  font-weight:700;
  box-shadow:0 0 18px rgba(255,0,120,0.6);
  transition:0.4s;
}

.btn-start:hover{
  transform:translateY(-5px) scale(1.05);
  box-shadow:0 0 30px rgba(255,0,120,0.9);
}

/* ------------------------------------------------ */
/* FOOTER */
/* ------------------------------------------------ */

footer{
  width:100%;
  padding:25px;
  background:rgba(8,8,15,0.95);
  text-align:center;
  color:#cfcfcf;
  font-size:14px;
  letter-spacing:1px;
  backdrop-filter:blur(15px);
  border-top:2px solid rgba(255,255,255,0.1);
  box-shadow:0 -5px 25px rgba(0,0,0,0.6);
  position:relative;
  bottom:0;
}

/* ------------------------------------------------ */
/* RESPONSIVE */
/* ------------------------------------------------ */

.hamburger{display:none;}
@media(max-width:768px){

  header{flex-direction:column; gap:15px;}

  .nav-links{
    flex-direction:column;
    gap:15px;
    padding:20px;
    border-radius:12px;
    background:rgba(0,0,0,0.6);
    backdrop-filter:blur(10px);
    display:none;
  }

  .hamburger{
    display:flex;
    flex-direction:column;
    cursor:pointer;
  }
  .hamburger div{
    width:28px;
    height:4px;
    background:white;
    margin:4px 0;
    border-radius:4px;
  }

  .container h1{font-size:40px;}
}
</style>

<script>
function toggleMenu(){
  const nav=document.querySelector(".nav-links");
  nav.style.display = nav.style.display==="flex" ? "none" : "flex";
}
</script>

</head>

<body>

<header>
  <div class="logo">QUIZ PORTAL</div>

  <div class="hamburger" onclick="toggleMenu()">
    <div></div><div></div><div></div>
  </div>

  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/jsp/admin/login.jsp">Admin Login</a>
    <a href="${pageContext.request.contextPath}/jsp/user/login.jsp">Login / Signup</a>
    <a href="${pageContext.request.contextPath}/jsp/user/home.jsp">Home</a>
  </div>
</header>

<div class="container">
  <h1>Welcome to the Ultimate Quiz Portal</h1>
  <p>Dive into exciting quizzes, sharpen your knowledge, and compete with the world. Each question pushes your limits!</p>
  <a href="${pageContext.request.contextPath}/jsp/user/login.jsp" class="btn-start">Start Quiz</a>
</div>

<footer>
  © 2025 Online Quiz Portal — Sharpen Your Mind Every Day
</footer>

<!-- Floating particles script fixed -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    for(let i=0;i<35;i++){
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

</body>
</html>
