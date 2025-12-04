<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quizportal.model.Quiz" %>
 
<html>
<head><title>Available Quizzes</title></head>
<body>
 
<h2>Available Quizzes</h2>
 
<table border="1" cellpadding="5">
    <tr>
        <th>Title</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
 
    <%
        List<Quiz> list = (List<Quiz>) request.getAttribute("quizzes");
        if (list != null) {
            for (Quiz q : list) {
    %>
    <tr>
        <td><%= q.getTitle() %></td>
        <td><%= q.getCategory() %></td>
        <td>
            <a href="<%= request.getContextPath() %>/user/quiz/attempt?id=<%= q.getId() %>">
                Start Quiz
            </a>
        </td>
    </tr>
    <%
            }
        }
    %>
 
</table>
 
</body>
</html>
