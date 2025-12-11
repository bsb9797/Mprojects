<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.quizweb.model.*, java.util.List, java.util.Map" %>
<%@ page isELIgnored="false" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/user/login");
        return;
    }

    int score = (Integer) request.getAttribute("score");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    Map<Integer, Integer> userAnswers = (Map<Integer, Integer>) request.getAttribute("userAnswers");
    double percentage = (score * 100.0) / totalQuestions;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz Result - Quiz Portal</title>
<style>
/* Base & Reset */
* { margin:0; padding:0; box-sizing:border-box; font-family:'Poppins', sans-serif; }
html, body { height:100%; width:100%; overflow-x:hidden; background:#0d0d0d; color:#fff; }

/* Animated gradient background */
body::before {
    content:"";
    position:fixed;
    top:0; left:0;
    width:200%; height:200%;
    background: conic-gradient(from 180deg at 50% 50%, #00c6ff, #0072ff, #00ffcc, #ff6a00, #ee0979, #00c6ff);
    animation: rotateBg 40s linear infinite;
    z-index:-3;
    opacity:0.25;
}
@keyframes rotateBg { 0% { transform:rotate(0deg);} 100% { transform:rotate(360deg);} }

/* Floating particles */
.particles {
    position:fixed; top:0; left:0; width:100%; height:100%; z-index:-2; pointer-events:none;
}
.particles span {
    position:absolute; width:6px; height:6px; border-radius:50%; animation:float 15s linear infinite;
}
.particles span:nth-child(odd) { background:#ff6a00; }
.particles span:nth-child(even) { background:#00c6ff; }
@keyframes float { from { transform: translateY(100vh) scale(0); } to { transform: translateY(-10vh) scale(1); } }

/* Main container */
.container {
    max-width:900px;
    margin:40px auto;
    background: rgba(255,255,255,0.05);
    border-radius:25px;
    padding:40px 30px;
    backdrop-filter: blur(25px);
    box-shadow: 0 15px 50px rgba(0,0,0,0.6);
    position: relative;
    z-index:1;
    animation:fadeInUp 1s ease forwards;
}
@keyframes fadeInUp { from {opacity:0; transform:translateY(30px);} to {opacity:1; transform:translateY(0);} }

/* Result Header */
.result-main { text-align:center; margin-bottom:40px; }
.result-main h1 {
    font-size:38px;
    background: linear-gradient(90deg,#00ffcc,#00c6ff,#ff00c8);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow:0 0 20px rgba(0,198,255,0.6);
    animation: glowText 3s infinite alternate;
}
@keyframes glowText { from { text-shadow:0 0 15px #00ffe0; } to { text-shadow:0 0 35px #ff00c8; } }

.score {
    font-size:56px; font-weight:800; margin:10px 0;
    background: linear-gradient(135deg,#28a745,#00ffcc);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation:pulse 2s infinite alternate;
}
@keyframes pulse { from{ transform:scale(1);} to{transform:scale(1.1);} }

.percent { font-size:22px; color:#ddd; margin-bottom:20px; }

/* Buttons */
.btn {
    display:inline-block; padding:14px 30px; margin:10px;
    background:linear-gradient(135deg,#ff6a00,#ee0979);
    color:#fff; text-decoration:none;
    font-weight:bold; border-radius:50px;
    transition:all 0.3s ease;
    position:relative; overflow:hidden;
}
.btn::before {
    content:""; position:absolute; top:0; left:-100%; width:100%; height:100%;
    background:rgba(255,255,255,0.25); transform:skewX(-20deg); transition:left 0.5s;
}
.btn:hover::before { left:100%; }
.btn:hover { transform:scale(1.05); box-shadow:0 10px 25px rgba(255,0,128,0.5); }

/* Review Box */
.review-box { margin-top:30px; }
.review-box h2 { font-size:28px; text-align:center; color:#00c6ff; margin-bottom:20px; }

.question-item {
    background: rgba(255,255,255,0.08);
    border-left:5px solid #ccc;
    border-radius:15px;
    padding:15px 20px;
    margin-bottom:18px;
    backdrop-filter: blur(15px);
    transition: transform 0.3s, box-shadow 0.3s;
}
.question-item:hover { transform:translateY(-3px); box-shadow:0 15px 30px rgba(0,198,255,0.3); }
.question-item.correct { border-left-color:#28a745; }
.question-item.incorrect { border-left-color:#dc3545; }

.q-title { font-size:18px; font-weight:700; margin-bottom:6px; color:#fff; }
.q-info { font-size:15px; margin-bottom:5px; color:#ddd; }
.correct-text { color:#28a745; font-weight:bold; }
.wrong-text { color:#dc3545; font-weight:bold; }

/* Responsive */
@media(max-width:600px){
    .container { padding:25px 20px; margin:20px 10px; }
    .score { font-size:44px; }
    .result-main h1 { font-size:28px; }
    .review-box h2 { font-size:22px; }
}
</style>
</head>
<body>

<div class="particles">
    <span style="left:10%; animation-duration:12s;"></span>
    <span style="left:30%; animation-duration:18s;"></span>
    <span style="left:50%; animation-duration:20s;"></span>
    <span style="left:70%; animation-duration:25s;"></span>
    <span style="left:90%; animation-duration:30s;"></span>
</div>

<div class="container">
    <div class="result-main">
        <h1>Quiz Completed</h1>
        <div class="score"><%= score %> / <%= totalQuestions %></div>
        <div class="percent"><%= String.format("%.1f", percentage) %>%</div>

        <a href="${pageContext.request.contextPath}/user/leaderboard?quizId=<%= quiz.getQuizId() %>" class="btn">View Leaderboard</a>
        <a href="${pageContext.request.contextPath}/user/quizList" class="btn">Back to Quiz List</a>
    </div>

    <div class="review-box">
        <h2>Your Answers</h2>
        <%
            int i = 1;
            for (Question q : questions) {
                Integer userAns = userAnswers.get(q.getQuestionId());
                boolean correct = userAns != null && userAns == q.getCorrectOption();
                String[] opts = { q.getOption1(), q.getOption2(), q.getOption3(), q.getOption4() };
        %>
        <div class="question-item <%= correct ? "correct" : "incorrect" %>">
            <div class="q-title">Question <%= i++ %>: <%= q.getQuestionText() %></div>
            <div class="q-info">
                <strong>Your Answer:</strong>
                <span class="<%= correct ? "correct-text" : "wrong-text" %>">
                    <%= userAns != null ? opts[userAns - 1] : "Not answered" %>
                </span>
            </div>
            <% if (!correct) { %>
            <div class="q-info">
                <strong>Correct Answer:</strong>
                <span class="correct-text"><%= opts[q.getCorrectOption() - 1] %></span>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
