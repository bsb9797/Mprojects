<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Admin Dashboard</title></head>
<body>
 
<h2>Admin Dashboard</h2>
 
<p>Total Quizzes: <%= request.getAttribute("totalQuizzes") %></p>
<p>Total Questions: <%= request.getAttribute("totalQuestions") %></p>
<p>Total Users: <%= request.getAttribute("totalUsers") %></p>
 
<h3>Actions</h3>
<ul>
    <li><a href="question/add">Add Question</a></li>
    <li><a href="question/list">View Questions</a></li>
    <li><a href="quiz/create">Create Quiz</a></li>
    <li><a href="quiz/list">View All Quizzes</a></li>
</ul>
 
</body>
</html>