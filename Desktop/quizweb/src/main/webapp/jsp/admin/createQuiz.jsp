<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%@ page isELIgnored="false"%>
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
<meta charset="UTF-8">
<title>Create Quiz - Quiz App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">
<style>
/* =========================
   Base Reset
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

h2 {
    font-size: 32px;
    font-weight: 700;
    color: #1f3a63;
    margin-bottom: 30px;
    border-bottom: 2px solid #e0e0e0;
    padding-bottom: 8px;
}

/* Alerts */
.success, .error {
    padding: 15px 20px;
    border-radius: 12px;
    margin-bottom: 20px;
    font-weight: 600;
    font-size: 14px;
}

.success { background: #e6ffed; color: #276749; border-left: 5px solid #38a169; }
.error { background: #ffe6e6; color: #9b2c2c; border-left: 5px solid #e53e3e; }

/* Form container */
.form-container {
    background: #fff;
    padding: 30px 35px;
    border-radius: 18px;
    max-width: 900px;
    margin: 0 auto;
    box-shadow: 0 12px 25px rgba(0,0,0,0.05);
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
    font-size: 15px;
    color: #1f3a63;
}

input[type=text], select {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ccc;
    border-radius: 12px;
    font-size: 15px;
    transition: all 0.3s ease;
    background: #fdfdfd;
}

input[type=text]:focus, select:focus {
    border-color: #1f3a63;
    box-shadow: 0 4px 15px rgba(31,58,99,0.2);
    outline: none;
}

/* Question list */
.question-list {
    max-height: 400px;
    overflow-y: auto;
    border: 1px solid #ccc;
    padding: 15px;
    border-radius: 12px;
    background: #f9f9f9;
}

.question-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px 12px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    margin-bottom: 8px;
    transition: 0.3s;
}

.question-item:hover {
    background: #f1f5fb;
}

/* Button */
.btn {
    width: 100%;
    padding: 14px;
    font-size: 16px;
    font-weight: 700;
    background: linear-gradient(135deg, #1f3a63, #345a8a);
    color: #fff;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn:hover {
    background: linear-gradient(135deg, #345a8a, #1f3a63);
    box-shadow: 0 8px 20px rgba(31,58,99,0.3);
}

/* Responsive */
@media(max-width:1024px){
    .sidebar{ width:200px; padding:25px 15px; }
    .main-content{ padding:35px 25px; }
}

@media(max-width:768px){
    body { flex-direction: column; }
    .sidebar{ width:100%; flex-direction: row; overflow-x:auto; padding:15px; }
    .sidebar a { flex:1; margin:0 5px 0 0; white-space:nowrap; }
    .main-content{ padding:25px 15px; }
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
        <a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a>
        <a href="${pageContext.request.contextPath}/admin/createQuiz" class="active">Create Quiz</a>
    </div>
 <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
</aside>

<main class="main-content">
    <h2>Create New Quiz</h2>

    <% if(request.getAttribute("success")!=null){ %>
        <div class="success"><%= request.getAttribute("success") %></div>
    <% } %>
    <% if(request.getAttribute("error")!=null){ %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/admin/createQuiz" method="post">
            <div class="form-group">
                <label>Quiz Title</label>
                <input type="text" name="quizTitle" placeholder="Enter quiz title" required />
            </div>

            <div class="form-group">
                <label>Category</label>
                <input type="text" name="category" placeholder="Enter quiz category" required />
            </div>

            <div class="form-group">
                <label>Select Questions</label>
                <div class="question-list">
                    <% if(questions==null || questions.isEmpty()){ %>
                        <div>No questions available.</div>
                    <% } else { 
                        for(Question q : questions){ %>
                            <div class="question-item">
                                <input type="checkbox" name="questions" value="<%=q.getQuestionId()%>"/>
                                <label><%=q.getQuestionText()%></label>
                            </div>
                    <% } } %>
                </div>
            </div>

            <button type="submit" class="btn">Create Quiz</button>
        </form>
    </div>
</main>

</body>
</html>
