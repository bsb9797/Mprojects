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
<title>Question Manager - Quiz App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
/* =========================
   Reset & Base
========================= */
* { margin:0; padding:0; box-sizing:border-box; font-family: 'Inter', sans-serif; }
body { display:flex; min-height:100vh; background:#f0f4f8; color:#1a1a1a; }

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
    font-size:26px; font-weight:800; margin-bottom:40px; text-align:center; letter-spacing:1px;
}
.sidebar a {
    display:block; text-decoration:none; color:#cfd8e6; padding:12px 18px; margin-bottom:12px;
    border-radius:8px; font-size:16px; transition: all 0.3s ease;
}
.sidebar a.active,
.sidebar a:hover { background: rgba(255,255,255,0.2); color:#fff; }
.sidebar .logout-btn {
    background: #ff5e57; text-align:center; font-weight:600; font-size:16px;
    padding:12px; border-radius:8px; margin-top:auto; transition: all 0.3s ease;
}
.sidebar .logout-btn:hover { background: #e04c47; }

/* =========================
   Main Content
========================= */
.main-content { flex:1; padding:40px 50px; overflow-x:auto; }
.header { display:flex; justify-content:space-between; align-items:center; margin-bottom:40px; }
.header h1 { font-size:32px; font-weight:700; color:#1f3a63; }
.header .welcome { font-size:16px; font-weight:500; color:#4b5c70; }

/* =========================
   Table Container
========================= */
.table-container {
    background: #fff; padding:30px; border-radius:18px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.05);
}
.table-container h2 { font-size:22px; font-weight:700; margin-bottom:15px; color:#1f3a63; }
.table-container table { width:100%; border-collapse: separate; border-spacing:0 12px; font-size:16px; }
.table-container thead th {
    text-align:left; padding:14px 20px; background:#f1f1f1; color:#1f3a63; font-weight:700; border-radius:8px 8px 0 0;
}
.table-container tbody td {
    padding:12px 18px; vertical-align:middle; color:#333; background:#fff; border-radius:8px;
}
.table-container tbody tr:hover { background:#f1f5fb; }

/* =========================
   Action Buttons
========================= */
.action-buttons { display:flex; gap:8px; flex-wrap:wrap; }
.btn { padding:10px 16px; border-radius:10px; font-weight:700; font-size:15px; border:none; cursor:pointer; transition:0.3s; }
.btn-delete { background-color:#d9534f; color:#fff; }
.btn-delete:hover { background-color:#c0392b; }

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

<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo">QUIZ APP</div>
    <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/quizManager">Quiz Manager</a>
    <a href="${pageContext.request.contextPath}/admin/questionList" class="active">Question Manager</a>
    <a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a>
    <a href="${pageContext.request.contextPath}/admin/createQuiz">Create Quiz</a>
    <a href="${pageContext.request.contextPath}/jsp/user/home.jsp" class="logout-btn">Logout</a>
</aside>

<!-- Main Content -->
<main class="main-content">
    <div class="header">
        <h1>Question Manager</h1>
        <div class="welcome">
            Welcome, <%=admin.getFullName() != null ? admin.getFullName() : admin.getUsername()%>!
        </div>
    </div>

    <section class="table-container">
        <h2>All Questions</h2>
        <table>
            <thead>
                <tr>
                    <th>Sr No.</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Correct</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% if (questions != null && !questions.isEmpty()) {
                int srNo = 1;
                for (Question q : questions) { %>
                <tr>
                    <td><%= srNo++ %></td>
                    <td><%= q.getQuestionText() %></td>
                    <td><%= q.getOption1() %></td>
                    <td><%= q.getOption2() %></td>
                    <td><%= q.getOption3() %></td>
                    <td><%= q.getOption4() %></td>
                    <td><%= q.getCorrectOption() %></td>
                    <td><%= q.getCategory() %></td>
                    <td>
                        <div class="action-buttons">
                            <form action="${pageContext.request.contextPath}/admin/questionList" method="post" onsubmit="return confirm('Are you sure?');">
                                <input type="hidden" name="questionId" value="<%= q.getQuestionId() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            <% } } else { %>
                <tr><td colspan="9" style="text-align:center;">No questions found</td></tr>
            <% } %>
            </tbody>
        </table>
    </section>
</main>

</body>
</html>
