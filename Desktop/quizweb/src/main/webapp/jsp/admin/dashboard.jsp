<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*"%>
<%@ page isELIgnored="false"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Dashboard - Quiz App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">
<style>
/* =========================
   Reset & Base
========================= */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    display: flex;
    min-height: 100vh;
    background: #f0f4f8;
    color: #1a1a1a;
}

/* =========================
   Sidebar
========================= */
.sidebar {
    width: 220px;
    background: linear-gradient(180deg, #1f3a63, #345a8a);
    color: #fff;
    display: flex;
    flex-direction: column;
    padding: 30px 20px;
    transition: width 0.3s;
}

.sidebar .logo {
    font-size: 26px;
    font-weight: 800;
    margin-bottom: 40px;
    text-align: center;
    letter-spacing: 1px;
}

.sidebar a {
    display: block;
    text-decoration: none;
    color: #cfd8e6;
    padding: 12px 18px;
    margin-bottom: 12px;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s ease;
}

.sidebar a.active,
.sidebar a:hover {
    background: rgba(255,255,255,0.2);
    color: #fff;
}

.sidebar .logout-btn {
    background: #ff5e57;
    text-align: center;
    font-weight: 600;
    font-size: 16px;
    padding: 12px;
    border-radius: 8px;
    margin-top: auto;
    transition: all 0.3s ease;
}
.sidebar .logout-btn:hover {
    background: #e04c47;
}

/* =========================
   Main Content
========================= */
.main-content {
    flex: 1;
    padding: 40px 50px;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
}

.header h1 {
    font-size: 32px;
    font-weight: 700;
    color: #1f3a63;
}

.header .welcome {
    font-size: 16px;
    font-weight: 500;
    color: #4b5c70;
}

/* =========================
   Stats Cards
========================= */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 25px;
    margin-bottom: 40px;
}

.stat-card {
    background: linear-gradient(145deg, #3b82f6, #1f3a63);
    color: #fff;
    padding: 25px;
    border-radius: 18px;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 0 12px 30px rgba(31,58,99,0.15);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 16px 40px rgba(31,58,99,0.2);
}

.stat-card h3 {
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.stat-card .number {
    font-size: 36px;
    font-weight: 700;
}

/* =========================
   Table Section
========================= */
.table-container {
    background: #fff;
    padding: 30px;
    border-radius: 18px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.05);
}

.table-container h2 {
    font-size: 22px;
    font-weight: 700;
    margin-bottom: 15px;
    color: #1f3a63;
}

.table-container p {
    font-size: 16px;
    color: #5a6a81;
}

/* =========================
   Responsive Design
========================= */
@media(max-width:1024px){
    .main-content{ padding:25px 30px; }
    .stats-grid{ grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); }
}

@media(max-width:768px){
    body{ flex-direction: column; }
    .sidebar{ width:100%; flex-direction: row; overflow-x:auto; padding:15px; justify-content: space-around; }
    .sidebar a{ margin:0 8px; }
    .main-content{ padding:20px; }
}
</style>
</head>
<body>

<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo">QUIZ APP</div>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/quizManager">Quiz Manager</a>
    <a href="${pageContext.request.contextPath}/admin/questionList">Question Manager</a>
    <a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a>
    <a href="${pageContext.request.contextPath}/admin/createQuiz">Create Quiz</a>
    <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
</aside>

<!-- Main Content -->
<main class="main-content">

    <!-- Header -->
    <div class="header">
        <h1>Dashboard</h1>
        <div class="welcome">
            Welcome, <%=admin.getFullName() != null ? admin.getFullName() : admin.getUsername()%>!
        </div>
    </div>

    <!-- Stats Cards -->
    <section class="stats-grid">
        <div class="stat-card">
            <h3>Total Quiz</h3>
            <div class="number"><%=request.getAttribute("totalQuiz") != null ? request.getAttribute("totalQuiz") : "0"%></div>
        </div>
        <div class="stat-card">
            <h3>Total Questions</h3>
            <div class="number"><%=request.getAttribute("totalQuestions") != null ? request.getAttribute("totalQuestions") : "0"%></div>
        </div>
        <div class="stat-card">
            <h3>Total Users</h3>
            <div class="number"><%=request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "0"%></div>
        </div>
    </section>

    <!-- Table Section -->
    <section class="table-container">
        <h2>Tables & Reports</h2>
        <p>Navigate to Quiz Manager or Question Manager to view detailed tables and reports.</p>
    </section>

</main>

</body>
</html>
