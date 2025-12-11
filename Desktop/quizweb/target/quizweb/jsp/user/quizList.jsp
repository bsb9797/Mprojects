<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/user/login");
        return;
    }
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz List - Quiz Portal</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #c0c0c0 0%, #a0a0a0 50%, #808080 100%);
            color: #222; /* Dark text for contrast */
        }
        .navbar {
            background: #3a3a3a;
            padding: 18px 60px;
            display: flex;
            justify-content: flex-end; /* Align items to right */
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
            gap: 30px; /* spacing between links */
        }
        .logo {
            color: #d75a4a; /* muted red */
            font-size: 28px;
            font-weight: 800;
            letter-spacing: 2px;
            cursor: default;
        }
        .nav-links a {
            color: #bbb;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: color 0.3s ease;
        }
        .nav-links a:hover {
            color: #d75a4a;
        }
        .nav-links span.welcome-text {
            color: #bbb;
            font-weight: 600;
            font-size: 15px;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 30px;
        }
        h1 {
            color: #333;
            margin-bottom: 40px;
            font-weight: 700;
            letter-spacing: 1.2px;
        }
        .quiz-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 28px;
        }
        .quiz-card {
            background: #f5f5f5;
            border-radius: 14px;
            padding: 30px 25px 35px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            border-left: 6px solid #6fc1d9;
            transition: transform 0.35s ease, box-shadow 0.35s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            color: #222;
        }
        .quiz-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 12px 30px rgba(111, 193, 217, 0.3);
        }
        .quiz-category {
            align-self: flex-start;
            background: #6fc1d9;
            color: #1b2c3d;
            padding: 6px 18px;
            border-radius: 25px;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 20px;
            letter-spacing: 0.8px;
            text-transform: uppercase;
        }
        .quiz-card h3 {
            color: #222;
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 25px;
            line-height: 1.2;
        }
        .btn-start {
            align-self: flex-start;
            background: #d75a4a;
            color: white;
            padding: 12px 32px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 700;
            font-size: 16px;
            box-shadow: 0 6px 14px rgba(215, 90, 74, 0.55);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-start:hover {
            background: #bf4a3f;
            box-shadow: 0 8px 22px rgba(191, 74, 63, 0.75);
        }
        p.no-quizzes {
            font-size: 18px;
            color: #555;
            text-align: center;
            margin-top: 80px;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-links">
                    <a href="${pageContext.request.contextPath}/jsp/user/home.jsp">Logout</a>
        
        
        
        
        </div>
    </nav>
    
    <div class="container">
        <h1>Quiz List</h1>
        
        <% if (quizzes != null && !quizzes.isEmpty()) { %>
            <div class="quiz-grid">
                <% for (Quiz quiz : quizzes) { %>
                    <div class="quiz-card">
                        <span class="quiz-category"><%= quiz.getCategory() %></span>
                        <h3><%= quiz.getQuizTitle() %></h3>
                        <a href="${pageContext.request.contextPath}/jsp/user/attemptQuiz?quizId=<%= quiz.getQuizId() %>" class="btn-start">Start Quiz</a>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <p class="no-quizzes">No quizzes available at the moment.</p>
        <% } %>
    </div>
</body>
</html>
