<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List" %>
<%@ page isELIgnored="false"%>

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
    * { margin:0; padding:0; box-sizing:border-box; font-family:'Poppins', sans-serif; }

    body, html {
        height:100%;
        background: #0d0d0d;
        color:#fff;
        overflow-x:hidden;
        padding-bottom:40px;
    }

    /* Animated gradient background */
    body::before {
        content:"";
        position:fixed;
        top:0; left:0;
        width:200%; height:200%;
        background: conic-gradient(from 180deg at 50% 50%, #00c6ff, #0072ff, #00ffcc, #ff6a00, #ee0979, #00c6ff);
        animation: rotateBg 40s linear infinite;
        z-index:-2;
        opacity:0.15;
    }
    @keyframes rotateBg {
        from { transform:rotate(0deg); }
        to { transform:rotate(360deg); }
    }

    /* Navbar */
    .navbar {
        background: rgba(255,255,255,0.05);
        backdrop-filter: blur(15px);
        padding: 15px 40px;
        display:flex;
        justify-content:flex-end;
        border-radius:15px;
        margin: 20px 40px 40px 40px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }
    .navbar a {
        color: #00c6ff;
        font-weight:600;
        text-decoration:none;
        margin-left:20px;
        transition:0.3s;
    }
    .navbar a:hover { color:#ffcc00; }

    /* Page Title */
    h1 {
        text-align:center;
        font-size:36px;
        margin-bottom:30px;
        background: linear-gradient(90deg,#00ffcc,#00c6ff,#0072ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-shadow: 0 0 20px rgba(0,198,255,0.6);
        animation: glowText 3s infinite alternate;
    }
    @keyframes glowText {
        from { text-shadow:0 0 10px #00c6ff; }
        to { text-shadow:0 0 30px #00ffcc; }
    }

    /* Container grid */
    .container { max-width: 1200px; margin:0 auto; padding:0 20px; display:grid; grid-template-columns: repeat(auto-fill, minmax(280px,1fr)); gap:25px; }

    /* Glass Quiz Cards */
    .quiz-card {
        background: rgba(255,255,255,0.05);
        border-radius: 20px;
        padding:25px;
        backdrop-filter: blur(20px);
        border:1px solid rgba(255,255,255,0.1);
        box-shadow:0 10px 25px rgba(0,0,0,0.5);
        display:flex;
        flex-direction:column;
        transition:0.4s ease;
        position:relative;
        overflow:hidden;
    }
    .quiz-card:hover {
        transform:translateY(-5px);
        box-shadow:0 0 35px rgba(0,198,255,0.6);
    }

    .quiz-category {
        background: linear-gradient(135deg,#00c6ff,#0072ff);
        color: #0d0d0d;
        font-weight:700;
        font-size:12px;
        padding:6px 14px;
        border-radius:20px;
        width: fit-content;
        margin-bottom:15px;
        text-transform: uppercase;
    }

    .quiz-card h3 {
        font-size:20px;
        font-weight:600;
        margin-bottom:20px;
        color:#fff;
    }

    .btn-start {
        margin-top:auto;
        text-decoration:none;
        background: linear-gradient(135deg,#ff6a00,#ee0979);
        color:#fff;
        font-weight:bold;
        padding:12px 25px;
        border-radius:30px;
        text-align:center;
        box-shadow:0 0 15px rgba(255,50,100,0.5);
        transition:0.3s;
    }
    .btn-start:hover {
        transform: scale(1.05);
        box-shadow:0 0 30px rgba(255,50,100,0.7);
    }

    /* No quizzes text */
    .no-quizzes {
        text-align:center;
        font-size:20px;
        color:#ddd;
        margin-top:60px;
        grid-column:1/-1;
    }
</style>

</head>

<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/jsp/user/home.jsp">Logout</a>
    </nav>

    <!-- CONTENT -->
    <div class="container">
        <h1>Available Quizzes</h1>

        <% if (quizzes != null && !quizzes.isEmpty()) { %>

            <div class="quiz-grid">
                <% for (Quiz quiz : quizzes) { %>
                    <div class="quiz-card">
                        <span class="quiz-category"><%= quiz.getCategory() %></span>

                        <h3><%= quiz.getQuizTitle() %></h3>

                        <a href="${pageContext.request.contextPath}/user/attemptQuiz?quizId=<%= quiz.getQuizId() %>"
                           class="btn-start">Start Quiz</a>
                    </div>
                <% } %>
            </div>

        <% } else { %>

            <p class="no-quizzes">No quizzes available at the moment.</p>

        <% } %>

    </div>

</body>
</html>
