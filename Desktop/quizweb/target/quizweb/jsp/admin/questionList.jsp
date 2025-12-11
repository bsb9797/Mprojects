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
<html>
<head>
    <meta charset="UTF-8" />
    <title>Question List - Quiz App</title>
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
            background: #064635; /* dark teal */
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
            border-bottom: 3px solid #1f7a5a;
            padding-bottom: 10px;
        }
        .btn-add {
            background: #28a745;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            transition: background 0.3s ease;
        }
        .btn-add:hover {
            background: #218838;
            cursor: pointer;
        }
        .header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            font-size: 16px;
            min-width: 900px;
        }
        thead th {
            text-align: left;
            padding: 14px 20px;
            background: #e0f2f1;
            color: #004d40;
            font-weight: 700;
            border-radius: 10px 10px 0 0;
            user-select: none;
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
            user-select: none;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s ease;
        }
        .btn-delete:hover {
            background: #c82333;
        }
        @media (max-width: 900px) {
            .main-content {
                padding: 20px 15px;
                border-radius: 0;
                box-shadow: none;
                overflow-x: scroll;
            }
            table {
                min-width: 700px;
                font-size: 14px;
            }
            thead th, tbody td {
                padding: 12px 10px;
            }
            .btn-add {
                padding: 10px 18px;
                font-size: 14px;
            }
            h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }
            .header-flex {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">🎯 QUIZ APP</div>
        <a href="${pageContext.request.contextPath}/jsp/admin/dashboard" class="menu-item">📊 Dashboard</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/quizManager" class="menu-item">📝 Quiz Manager</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/questionList" class="menu-item active">❓ Question Manager</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/addQuestion" class="menu-item">➕ Add New Question</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/createQuiz" class="menu-item">🆕 Create Quiz</a>
    </div>
    <div class="main-content">
        <div class="header-flex">
            <h2>Question List</h2>
            <a href="${pageContext.request.contextPath}/jsp/admin/addQuestion" class="btn-add">Add New Question</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Sr No.</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Correct Option</th>
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
                                <form action="${pageContext.request.contextPath}/jsp/admin/questionList" method="post" style="display:inline;">
                                    <input type="hidden" name="questionId" value="<%= q.getQuestionId() %>" />
                                    <input type="hidden" name="action" value="delete" />
                                    <button type="submit" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                <% }
                } else { %>
                    <tr>
                        <td colspan="9" style="text-align:center; padding: 30px 0; color: #555;">No questions found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
