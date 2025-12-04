<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.quizportal.model.*" %>
 
<html>
<head><title>Quiz Detail</title></head>
<body>
 
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
 
<h2>Quiz: <%= quiz.getTitle() %></h2>
<p>Category: <%= quiz.getCategory() %></p>
<p>Published: <%= quiz.isPublished() %></p>
 
<h3>Questions</h3>
 
<% for (Question q : questions) { %>
    <p><b><%= q.getQuestionText() %></b></p>
    <ul>
        <li><%= q.getOption1() %></li>
        <li><%= q.getOption2() %></li>
        <li><%= q.getOption3() %></li>
        <li><%= q.getOption4() %></li>
    </ul>
<% } %>
 
</body>
</html>