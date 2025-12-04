<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quizportal.model.Question" %>
 
<html>
<head><title>Create Quiz</title></head>
<body>
 
<h2>Create New Quiz</h2>
 
<form action="<%= request.getContextPath() %>/admin/quiz/create" method="post">
 
    <label>Quiz Title:</label><br>
    <input type="text" name="title" required><br><br>
 
    <label>Category:</label><br>
    <input type="text" name="category"><br><br>
 
    <label>Publish?</label>
    <input type="checkbox" name="published"><br><br>
 
    <h3>Select Questions</h3>
 
    <%
        List<Question> qList = (List<Question>) request.getAttribute("questions");
        if (qList != null) {
            for (Question q : qList) {
    %>
        <input type="checkbox" name="questionId" value="<%= q.getId() %>">
            <%= q.getQuestionText() %> <br>
    <%
            }
        }
    %>
 
    <br>
    <button type="submit">Create Quiz</button>
 
</form>
 
</body>
</html>
