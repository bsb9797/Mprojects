<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Create Quiz - Quiz App</title>
    <style>
        /* Reset & base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
        /* Sidebar */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            user-select: none;
        }
        .logo {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 36px;
        }
        .menu-item {
            padding: 14px 18px;
            margin-bottom: 10px;
            border-radius: 8px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.25s ease;
            display: block;
        }
        .menu-item:hover {
            background: rgba(255, 255, 255, 0.15);
        }
        .menu-item.active {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: inset 3px 0 0 #f1f1f1;
        }
        /* Main content */
        .main-content {
            flex: 1;
            padding: 40px 50px;
            background: #fff;
            box-shadow: inset 0 0 20px #f0f0f0;
            overflow-y: auto;
        }
        /* Form container */
        .form-container {
            max-width: 900px;
            background: #f9fafc;
            padding: 32px 36px;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(46, 61, 73, 0.1);
        }
        h2 {
            font-weight: 700;
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 30px;
            user-select: none;
        }
        /* Alerts */
        .success, .error {
            padding: 14px 18px;
            border-radius: 8px;
            margin-bottom: 24px;
            font-weight: 600;
            user-select: none;
        }
        .success {
            background: #d4edda;
            color: #155724;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
        }
        /* Form groups */
        .form-group {
            margin-bottom: 28px;
        }
        label {
            display: block;
            font-weight: 700;
            margin-bottom: 10px;
            color: #5a636d;
            user-select: none;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 14px 18px;
            border: 1.5px solid #ddd;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.25s ease;
        }
        input[type="text"]:focus,
        select:focus {
            border-color: #4e73df;
            outline: none;
        }
        /* Question list */
        .question-list {
            max-height: 400px;
            overflow-y: auto;
            border: 1.5px solid #ddd;
            padding: 20px 18px;
            border-radius: 10px;
            background: white;
            user-select: none;
        }
        .question-item {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            padding: 12px 10px;
            margin-bottom: 14px;
            border-radius: 8px;
            border: 1px solid #e0e6f0;
            transition: background-color 0.2s ease;
        }
        .question-item:hover {
            background-color: #f0f4ff;
        }
        .question-item input[type="checkbox"] {
            margin-top: 6px;
            cursor: pointer;
            width: 18px;
            height: 18px;
        }
        .question-item label {
            font-weight: 500;
            color: #34495e;
            cursor: pointer;
            flex: 1;
            user-select: text;
        }
        .question-item small {
            color: #95a5a6;
            margin-left: 8px;
            font-weight: 400;
            font-size: 13px;
        }
        /* Button */
        .btn {
            padding: 14px 36px;
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.15s ease;
            user-select: none;
        }
        .btn:hover {
            background: linear-gradient(135deg, #667eea 0%, #3b55d6 100%);
            transform: translateY(-2px);
        }
        /* No questions fallback */
        .no-questions {
            padding: 16px;
            color: #999;
            font-style: italic;
            user-select: none;
        }
    </style>
</head>
<body>
    <div class="layout">
        <aside class="sidebar">
            <div class="logo">🎯 QUIZ APP</div>
            <a href="${pageContext.request.contextPath}/jsp/admin/dashboard" class="menu-item">📊 Dashboard</a>
            <a href="${pageContext.request.contextPath}/jsp/admin/quizManager" class="menu-item">📝 Quiz Manager</a>
            <a href="${pageContext.request.contextPath}/jsp/admin/questionList" class="menu-item">❓ Question Manager</a>
            <a href="${pageContext.request.contextPath}/jsp/admin/addQuestion" class="menu-
