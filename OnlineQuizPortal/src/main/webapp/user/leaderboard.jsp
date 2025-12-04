<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.quizportal.model.*" %>
 
<html>
<head><title>Leaderboard</title></head>
<body>
 
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<QuizResult> results = (List<QuizResult>) request.getAttribute("results");
%>
 
<h2>Leaderboard - <%= quiz.getTitle() %></h2>
 
<table border="1" cellpadding="5">
    <tr>
        <th>User ID</th>
        <th>Score</th>
        <th>Total Questions</th>
    </tr>
 
    <% for (QuizResult r : results) { %>
    <tr>
        <td><%= r.getUserId() %></td>
        <td><%= r.getScore() %></td>
        <td><%= r.getTotalQuestions() %></td>
    </tr>
    <% } %>
 
</table>
 
</body>
</html>