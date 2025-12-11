<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%@ page isELIgnored="false"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Question> questions = quiz.getQuestions();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz Detail - Quiz App</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">
<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Inter', sans-serif; }
body { display:flex; min-height:100vh; background:#f0f4f8; color:#1a1a1a; }

.sidebar {
    width:220px;
    background: linear-gradient(180deg,#1f3a63,#345a8a);
    color:#fff;
    display:flex;
    flex-direction:column;
    padding:30px 20px;
    transition:width 0.3s;
}
.sidebar .logo {
    font-size:26px;
    font-weight:800;
    margin-bottom:40px;
    text-align:center;
}
.sidebar a {
    display:block;
    text-decoration:none;
    color:#cfd8e6;
    padding:12px 18px;
    margin-bottom:12px;
    border-radius:8px;
    font-size:16px;
    transition:all 0.3s ease;
}
.sidebar a.active, .sidebar a:hover { background: rgba(255,255,255,0.2); color:#fff; }
.sidebar .logout-btn { background:#ff5e57; text-align:center; font-weight:600; font-size:16px; padding:12px; border-radius:8px; margin-top:auto; transition:all 0.3s ease; }
.sidebar .logout-btn:hover { background:#e04c47; }

.main-content { flex:1; padding:40px 50px; }

.header h1, .quiz-header h2 { font-size:32px; font-weight:700; color:#1f3a63; margin-bottom:20px; }

.quiz-info { display:flex; gap:20px; flex-wrap:wrap; margin-bottom:30px; }
.quiz-info p { background:#fff; padding:20px; border-radius:18px; box-shadow:0 12px 25px rgba(31,58,99,0.15); font-size:18px; flex:1 1 200px; }

table {
    width:100%;
    border-collapse: separate;
    border-spacing:0 12px;
    font-size:16px;
}
thead th {
    text-align:left;
    padding:12px 20px;
    background:#1f3a63;
    color:#fff;
    font-weight:700;
    border-radius:8px 8px 0 0;
}
tbody td {
    padding:14px 20px;
    vertical-align:middle;
    color:#333;
    background:#fff;
    border-radius:8px;
    box-shadow:0 12px 25px rgba(31,58,99,0.05);
}
tbody tr:hover td { background:#f0f4f8; }

@media(max-width:1024px){ .main-content{ padding:25px 30px; } }
@media(max-width:768px){
    body{ flex-direction:column; }
    .sidebar{ width:100%; flex-direction:row; overflow-x:auto; padding:15px; justify-content: space-around; }
    .sidebar a{ margin:0 8px; }
    .main-content{ padding:20px; }
    .quiz-info{ flex-direction:column; }
    table{ font-size:14px; }
    thead th, tbody td{ padding:10px 12px; }
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
    <div class="quiz-header">
        <h2>Quiz Detail</h2>
    </div>

    <div class="quiz-info">
        <p><strong>Quiz Title:</strong> <%= quiz.getQuizTitle() %></p>
        <p><strong>Category:</strong> <%= quiz.getCategory() %></p>
    </div>

    <h3>Question List</h3>
    <table>
        <thead>
            <tr>
                <th>Sr No.</th>
                <th>Question</th>
                <th>Option 1</th>
                <th>Option 2</th>
                <th>Option 3</th>
                <th>Option 4</th>
                <th>Answer</th>
            </tr>
        </thead>
        <tbody>
            <% if (questions != null && !questions.isEmpty()) {
                int srNo = 1;
                for (Question q : questions) {
                    String[] options = {q.getOption1(), q.getOption2(), q.getOption3(), q.getOption4()};
                    String answer = options[q.getCorrectOption() - 1];
            %>
            <tr>
                <td><%= srNo++ %></td>
                <td><%= q.getQuestionText() %></td>
                <td><%= q.getOption1() %></td>
                <td><%= q.getOption2() %></td>
                <td><%= q.getOption3() %></td>
                <td><%= q.getOption4() %></td>
                <td><%= answer %></td>
            </tr>
            <% } } else { %>
            <tr>
                <td colspan="7" style="text-align:center; padding: 30px 0; color:#555;">No questions found</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</main>
</body>
</html>
