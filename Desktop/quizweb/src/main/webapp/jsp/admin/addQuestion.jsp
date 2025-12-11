<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*" %>
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
<title>Add Question - Quiz App</title>
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
    overflow-y: auto;
}

/* Header */
.header h1 {
    font-size: 32px;
    font-weight: 700;
    color: #1f3a63;
    margin-bottom: 30px;
}

/* =========================
   Form Container
========================= */
.form-container {
    background: #fff;
    padding: 30px 35px;
    border-radius: 18px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.05);
    max-width: 900px;
    margin: 0 auto;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
    font-size: 15px;
    color: #1f3a63;
}

input[type=text], textarea, select {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ccc;
    border-radius: 12px;
    font-size: 15px;
    background: #fdfdfd;
    transition: all 0.3s ease;
}

input[type=text]:focus, textarea:focus, select:focus {
    border-color: #1f3a63;
    box-shadow: 0 4px 15px rgba(31,58,99,0.2);
    outline: none;
}

textarea {
    resize: vertical;
    min-height: 100px;
    font-family: inherit;
}

/* =========================
   Buttons
========================= */
.btn {
    width: 100%;
    padding: 14px;
    font-size: 16px;
    font-weight: 700;
    background: linear-gradient(145deg, #3b82f6, #1f3a63);
    color: #fff;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn:hover {
    background: linear-gradient(145deg, #1f3a63, #3b82f6);
    box-shadow: 0 8px 20px rgba(31,58,99,0.3);
}

/* =========================
   Alerts
========================= */
.success, .error {
    padding: 15px 20px;
    border-radius: 12px;
    margin-bottom: 20px;
    font-weight: 600;
    font-size: 14px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
}

.success { background: #e6ffed; color: #276749; border-left: 5px solid #38a169; }
.error { background: #ffe6e6; color: #9b2c2c; border-left: 5px solid #e53e3e; }

/* =========================
   Responsive
========================= */
@media(max-width:1024px){
    .main-content{ padding:25px 30px; }
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

<aside class="sidebar">
    <div>
        <div class="logo">QUIZ APP</div>
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/quizManager">Quiz Manager</a>
        <a href="${pageContext.request.contextPath}/admin/questionList">Question Manager</a>
        <a href="${pageContext.request.contextPath}/admin/addQuestion" class="active">Add Question</a>
        <a href="${pageContext.request.contextPath}/admin/createQuiz">Create Quiz</a>
    </div>
    <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
</aside>

<main class="main-content">
    <div class="header">
        <h1>Add New Question</h1>
    </div>

    <% if(request.getAttribute("success") != null){ %>
        <div class="success"><%= request.getAttribute("success") %></div>
    <% } %>
    <% if(request.getAttribute("error") != null){ %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/admin/addQuestion" method="post">
            <div class="form-group">
                <label for="questionText">Question</label>
                <textarea id="questionText" name="questionText" required></textarea>
            </div>
            <div class="form-group">
                <label for="option1">Option 1</label>
                <input type="text" id="option1" name="option1" required>
            </div>
            <div class="form-group">
                <label for="option2">Option 2</label>
                <input type="text" id="option2" name="option2" required>
            </div>
            <div class="form-group">
                <label for="option3">Option 3</label>
                <input type="text" id="option3" name="option3" required>
            </div>
            <div class="form-group">
                <label for="option4">Option 4</label>
                <input type="text" id="option4" name="option4" required>
            </div>
            <div class="form-group">
                <label for="correctOption">Correct Option</label>
                <select id="correctOption" name="correctOption" required>
                    <option value="">Select Correct Option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                    <option value="4">Option 4</option>
                </select>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" placeholder="e.g., SCIENCE" required>
            </div>
            <button type="submit" class="btn">Add Question</button>
        </form>
    </div>
</main>

</body>
</html>
