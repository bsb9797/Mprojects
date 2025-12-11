<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Manager - Quiz App</title>
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
            background: #064635; /* Dark green */
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
        h2 {
            font-weight: 700;
            color: #064635;
            margin-bottom: 30px;
            font-size: 32px;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            font-size: 16px;
        }
        thead th {
            text-align: left;
            padding: 12px 20px;
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
            padding: 18px 20px;
            vertical-align: middle;
            color: #054a3d;
        }
        tbody td:first-child {
            font-weight: 600;
            color: #037a50;
        }
        .btn {
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            transition: background 0.3s;
            user-select: none;
        }
        .btn-view {
            background-color: #1de9b6; /* teal */
            color: #004d40;
            border: none;
        }
        .btn-view:hover {
            background-color: #00bfa5;
            color: white;
            cursor: pointer;
        }
        .btn-edit {
            background-color: #64b5f6; /* light blue */
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            margin: 0 8px;
            text-decoration: none;
            transition: background 0.3s;
            user-select: none;
            display: inline-block;
        }
        .btn-edit:hover {
            background-color: #42a5f5;
            cursor: pointer;
        }
        .btn-delete {
            background-color: #ef5350; /* red */
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn-delete:hover {
            background-color: #d32f2f;
        }
        form {
            display: inline;
        }
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                border-radius: 0 0 20px 20px;
                padding: 15px 10px;
                display: flex;
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
        <h2>Quiz Manager</h2>
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
                <% if (quizzes != null && !quizzes.isEmpty()) {
                    int srNo = 1;
                    for (Quiz quiz : quizzes) { %>
                        <tr>
                            <td><%= srNo++ %></td>
                            <td><%= quiz.getQuizTitle() %></td>
                            <td><%= quiz.getCategory() %></td>
                            <td><%= quiz.getCreatedAt() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/jsp/admin/quizManager?action=view&quizId=<%= quiz.getQuizId() %>" class="btn btn-view">View</a>
                                <a href="${pageContext.request.contextPath}/jsp/admin/quizManager?action=edit&quizId=<%= quiz.getQuizId() %>" class="btn btn-edit">Edit</a>
                                <form action="${pageContext.request.contextPath}/jsp/admin/quizManager" method="post" onsubmit="return confirm('Are you sure you want to delete this quiz?');" style="display:inline;">
                                    <input type="hidden" name="quizId" value="<%= quiz.getQuizId() %>">
                                    <input type="hidden" name="action" value="delete">
                                    <button type="submit" class="btn btn-delete">Delete</button>
                                </form>
                            </td>
                        </tr>
                <% }
                } else { %>
                    <tr><td colspan="5" style="text-align: center; padding: 30px 0; color: #555;">No quizzes found</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
