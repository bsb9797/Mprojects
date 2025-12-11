<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%@ page isELIgnored="false"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
    Quiz editQuiz = (Quiz) request.getAttribute("quiz"); // if editing
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz Manager - Quiz App</title>
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
.sidebar a.active, .sidebar a:hover {
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
    margin-bottom: 30px;
}
.header h1 {
    font-size: 32px;
    font-weight: 700;
    color: #1f3a63;
}

/* =========================
   Forms & Table
========================= */
.edit-form {
    background: #fff;
    padding: 25px;
    border-radius: 18px;
    margin-bottom: 30px;
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    align-items: center;
    box-shadow: 0 12px 25px rgba(31,58,99,0.15);
}
.edit-form input[type=text] {
    flex: 1 1 200px;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 16px;
}
.edit-form button {
    padding: 12px 20px;
    border-radius: 12px;
    border: none;
    background: #1f3a63;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}
.edit-form button:hover { background: #345a8a; }

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
    font-size: 16px;
}
thead th {
    text-align: left;
    padding: 12px 20px;
    background: #1f3a63;
    color: #fff;
    font-weight: 700;
    border-radius: 8px 8px 0 0;
}
tbody td {
    padding: 14px 20px;
    vertical-align: middle;
    color: #333;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 12px 25px rgba(31,58,99,0.05);
}
tbody tr:hover td { background: #f0f4f8; }

.action-buttons { display: flex; gap: 8px; flex-wrap: wrap; }
.btn { padding: 8px 14px; border-radius: 8px; font-weight: 600; font-size: 14px; border: none; cursor: pointer; text-decoration: none; white-space: nowrap; transition: all 0.3s; }
.btn-edit { background: #1f3a63; color: #fff; }
.btn-edit:hover { background: #345a8a; }
.btn-view { background: #5dade2; color: #fff; }
.btn-view:hover { background: #3498db; }
.btn-delete { background: #ff5e57; color: #fff; }
.btn-delete:hover { background: #e04c47; }

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
    .edit-form{ flex-direction: column; }
    .action-buttons{ flex-direction: column; gap:6px; }
}
</style>
</head>
<body>
    <aside class="sidebar">
        <div class="logo">QUIZ APP</div>
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/quizManager" class="active">Quiz Manager</a>
        <a href="${pageContext.request.contextPath}/admin/questionList">Question Manager</a>
        <a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a>
        <a href="${pageContext.request.contextPath}/admin/createQuiz">Create Quiz</a>
        <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
    </aside>

    <main class="main-content">
        <div class="header">
            <h1>Quiz Manager</h1>
        </div>

        <% if(editQuiz != null){ %>
        <div class="edit-form">
            <form action="${pageContext.request.contextPath}/admin/quizManager" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quizId" value="<%= editQuiz.getQuizId() %>">
                <input type="text" name="quizTitle" value="<%= editQuiz.getQuizTitle() %>" required placeholder="Quiz Title">
                <input type="text" name="category" value="<%= editQuiz.getCategory() %>" required placeholder="Category">
                <button type="submit">Update Quiz</button>
            </form>
        </div>
        <% } %>

        <table>
            <thead>
                <tr>
                    <th>Sr No.</th>
                    <th>Quiz Title</th>
                    <th>Category</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(quizzes != null && !quizzes.isEmpty()){
                    int srNo = 1;
                    for(Quiz quiz: quizzes){ %>
                        <tr>
                            <td><%= srNo++ %></td>
                            <td><%= quiz.getQuizTitle() %></td>
                            <td><%= quiz.getCategory() %></td>
                            <td><%= quiz.getCreatedAt() %></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/admin/quizManager?action=view&quizId=<%= quiz.getQuizId() %>" class="btn btn-view">View</a>
                                    <a href="${pageContext.request.contextPath}/admin/quizManager?action=edit&quizId=<%= quiz.getQuizId() %>" class="btn btn-edit">Edit</a>
                                    <form action="${pageContext.request.contextPath}/admin/quizManager" method="post" onsubmit="return confirm('Delete this quiz?');" style="display:inline;">
                                        <input type="hidden" name="quizId" value="<%= quiz.getQuizId() %>">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-delete">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                <% } } else { %>
                    <tr><td colspan="5" style="text-align:center; padding:20px; color:#555;">No quizzes found</td></tr>
                <% } %>
            </tbody>
        </table>
    </main>
</body>
</html>
