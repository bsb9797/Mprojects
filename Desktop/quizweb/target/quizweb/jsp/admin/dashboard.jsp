<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*" %>
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
    <style>
        /* Reset */
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background: #f5f7fa;
            color: #34495e;
            min-height: 100vh;
        }
        .layout {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* space between top menu and logout */
        }
        .sidebar-top {
            display: flex;
            flex-direction: column;
        }
        .logo {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 36px;
            user-select: none;
        }
        .menu-item {
            padding: 14px 18px;
            margin-bottom: 10px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-weight: 600;
            transition: background 0.25s ease;
            user-select: none;
            display: block;
        }
        .menu-item:hover {
            background: rgba(255, 255, 255, 0.15);
        }
        .menu-item.active {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: inset 3px 0 0 #f1f1f1;
        }
        .logout-btn {
            padding: 14px 18px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-weight: 700;
            text-align: center;
            background: #e74c3c; /* nice red color for logout */
            transition: background 0.3s ease;
            user-select: none;
            display: block;
            margin-top: auto;
        }
        .logout-btn:hover {
            background: #c0392b;
        }
        .main-content {
            flex: 1;
            padding: 40px 50px;
            background: #ffffff;
            box-shadow: inset 0 0 20px #f0f0f0;
            overflow-y: auto;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 36px;
            user-select: none;
        }
        h1 {
            font-size: 32px;
            font-weight: 700;
            color: #2c3e50;
        }
        .welcome {
            font-size: 18px;
            color: #7f8c8d;
            font-weight: 600;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 28px;
            margin-bottom: 40px;
        }
        .stat-card {
            background: #f9fafc;
            padding: 28px 32px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(46, 61, 73, 0.1);
            user-select: none;
            transition: box-shadow 0.3s ease;
        }
        .stat-card:hover {
            box-shadow: 0 6px 20px rgba(46, 61, 73, 0.15);
        }
        .stat-card h3 {
            font-size: 14px;
            color: #95a5a6;
            margin-bottom: 14px;
            letter-spacing: 1px;
        }
        .stat-card .number {
            font-size: 40px;
            font-weight: 700;
            color: #4e73df;
            line-height: 1;
        }
        .table-container {
            background: #ffffff;
            padding: 32px 36px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(46, 61, 73, 0.1);
            user-select: none;
        }
        .table-header {
            margin-bottom: 28px;
            user-select: none;
        }
        .table-header h2 {
            font-weight: 700;
            color: #2c3e50;
        }
        p {
            color: #7f8c8d;
            font-size: 15px;
            line-height: 1.5;
            margin-top: 0;
            user-select: none;
        }
    </style>
</head>
<body>
    <div class="layout">
        <aside class="sidebar">
            <div class="sidebar-top">
                <div class="logo">
                    🎯 QUIZ APP
                </div>
                <a href="${pageContext.request.contextPath}/jsp/admin/dashboard" class="menu-item active">📊 Dashboard</a>
                <a href="${pageContext.request.contextPath}/jsp/admin/quizManager" class="menu-item">📝 Quiz Manager</a>
                <a href="${pageContext.request.contextPath}/jsp/admin/questionList" class="menu-item">❓ Question Manager</a>
                <a href="${pageContext.request.contextPath}/jsp/admin/addQuestion" class="menu-item">➕ Add New Question</a>
                <a href="${pageContext.request.contextPath}/jsp/admin/createQuiz" class="menu-item">🆕 Create Quiz</a>
            </div>
            <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
        </aside>
        <main class="main-content">
            <div class="header">
                <h1>Dashboard</h1>
                <div class="welcome">Welcome, <%= admin.getFullName() != null ? admin.getFullName() : admin.getUsername() %>!</div>
            </div>
            
            <section class="stats-grid">
                <div class="stat-card">
                    <h3>TOTAL QUIZ</h3>
                    <div class="number"><%= request.getAttribute("totalQuiz") != null ? request.getAttribute("totalQuiz") : "0" %></div>
                </div>
                <div class="stat-card">
                    <h3>TOTAL QUESTIONS</h3>
                    <div class="number"><%= request.getAttribute("totalQuestions") != null ? request.getAttribute("totalQuestions") : "0" %></div>
                </div>
                <div class="stat-card">
                    <h3>TOTAL USERS</h3>
                    <div class="number"><%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "0" %></div>
                </div>
            </section>
            
            <section class="table-container">
                <div class="table-header">
                    <h2>Tables</h2>
                </div>
                <p>DataTables Example</p>
                <p style="margin-top: 20px; color: #95a5a6;">
                    Navigate to Quiz Manager or Question Manager to view detailed tables.
                </p>
            </section>
        </main>
    </div>
</body>
</html>
