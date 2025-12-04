<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quizportal.model.Quiz" %>
 
<html>
<head><title>All Quizzes</title></head>
<body>
 
<h2>All Quizzes</h2>
 
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Category</th>
        <th>Published</th>
        <th>View</th>
    </tr>
 
    <%
        List<Quiz> list = (List<Quiz>) request.getAttribute("quizzes");
        if (list != null) {
            for (Quiz q : list) {
    %>
    <tr>
        <td><%= q.getId() %></td>
        <td><%= q.getTitle() %></td>
        <td><%= q.getCategory() %></td>
        <td><%= q.isPublished() %></td>
        <td>
            <a href="<%= request.getContextPath() %>/admin/quiz/detail?id=<%= q.getId() %>">Details</a>
        </td>
    </tr>
    <%
            }
        }
    %>
 
</table>
 
</body>
</html>
