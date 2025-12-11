<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
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
<html>
<head>
    <meta charset="UTF-8" />
    <title>Quiz Detail - Quiz App</title>
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background: #e9f1f7;
            color: #333;
            min-height: 100vh;
            display: flex;
        }
        .sidebar {
            width: 280px;
            background: #064635; /* dark green */
            color: #d4f1e4;
            display: flex;
            flex-direction: column;
            padding: 30px 25px;
            box-shadow: 3px 0 8px rgba(0,0,0,0.1);
        }
        .logo {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 40px;
            letter-spacing: 2px;
            text-align: center;
            color: #a8d5ba;
            user-select: none;
        }
        .menu-item {
            padding: 14px 20px;
            margin-bottom: 12px;
            border-radius: 8px;
            color: #d4f1e4;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            transition: background 0.3s, color 0.3s;
            display: block;
        }
        .menu-item:hover {
            background: #a8d5ba;
            color: #064635;
            cursor: pointer;
        }
        .menu-item.active {
            background: #1f7a5a;
            color: #e9f1f7;
            font-weight: 700;
        }
        .main-content {
            flex: 1;
            padding: 40px 50px;
            background: #ffffff;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
            border-radius: 20px 0 0 20px;
            overflow-x: auto;
        }
        .quiz-header h2 {
            font-weight: 700;
            color: #064635;
            margin-bottom: 25px;
            font-size: 32px;
            border-bottom: 3px solid #1f7a5a;
            padding-bottom: 10px;
        }
        p {
            font-size: 18px;
            color: #054a3d;
            margin-bottom: 15px;
            font-weight: 600;
        }
        h3 {
            margin-top: 40px;
            margin-bottom: 20px;
            color: #1f7a5a;
            font-size: 26px;
            font-weight: 700;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            font-size: 16px;
        }
        thead th {
            text-align: left;
            padding: 14px 20px;
            background: #e0f2f1;
            color: #004d40;
            font-weight: 700;
            border-radius: 10px 10px 0 0;
        }
        tbody tr {
            background: #f8fdfa;
            box-shadow: 0 3px 8px rgba(0,0,0,0.05);
            border-radius: 10px;
            transition: transform 0.2s ease;
        }
        tbody tr:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }
        tbody td {
            padding: 16px 20px;
            vertical-align: middle;
            color: #054a3d;
        }
        tbody td:first-child {
            font-weight: 600;
            color: #037a50;
            width: 60px;
        }
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                border-radius: 0 0 20px 20px;
                padding: 15px 10px;
                flex-direction: row;
                overflow-x: auto;
            }
            .logo {
                flex: 0 0 auto;
                font-size: 20px;
                margin-bottom: 0;
                margin-right: 20px;
            }
            .menu-item {
                flex: 0 0 auto;
                margin-right: 10px;
                margin-bottom: 0;
                padding: 10px 14px;
                font-size: 14px;
            }
            .main-content {
                padding: 20px 15px;
                border-radius: 0;
                box-shadow: none;
                overflow-x: scroll;
            }
            table {
                font-size: 14px;
            }
            thead th, tbody td {
                padding: 12px 10px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">🎯 QUIZ APP</div>
        <a href="${pageContext.request.contextPath}/jsp/admin/dashboard" class="menu-item">📊 Dashboard</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/quizManager" class="menu-item active">📝 Quiz Manager</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/questionList" class="menu-item">❓ Question Manager</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/addQuestion" class="menu-item">➕ Add New Question</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/createQuiz" class="menu-item">🆕 Create Quiz</a>
    </div>
    <div class="main-content">
        <div class="quiz-header">
            <h2>Quiz Detail</h2>
        </div>
        <p><strong>Quiz Title:</strong> <%= quiz.getQuizTitle() %></p>
        <p><strong>Category:</strong> <%= quiz.getCategory() %></p>

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
                        <td colspan="7" style="text-align:center; padding: 30px 0; color: #555;">No questions found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
