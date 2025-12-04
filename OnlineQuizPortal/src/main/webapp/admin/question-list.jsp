<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.quizportal.model.Question" %>
 
<html>
<head><title>Questions</title></head>
<body>
 
<h2>All Questions</h2>
 
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Question</th>
        <th>Category</th>
    </tr>
 
    <%
        List<Question> list = (List<Question>) request.getAttribute("questions");
        for (Question q : list) {
    %>
    <tr>
        <td><%= q.getId() %></td>
        <td><%= q.getQuestionText() %></td>
        <td><%= q.getCategory() %></td>
    </tr>
    <% } %>
</table>
 
</body>
</html>