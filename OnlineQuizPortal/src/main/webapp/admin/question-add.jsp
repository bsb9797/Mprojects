<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Add Question</title></head>
<body>
 
<h2>Add Question</h2>
 
<form action="<%= request.getContextPath() %>/admin/question/add" method="post">
 
    <label>Question:</label><br>
    <textarea name="questionText" rows="3" cols="40" required></textarea><br><br>
 
    <label>Option 1:</label><br>
    <input type="text" name="option1" required><br><br>
 
    <label>Option 2:</label><br>
    <input type="text" name="option2" required><br><br>
 
    <label>Option 3:</label><br>
    <input type="text" name="option3" required><br><br>
 
    <label>Option 4:</label><br>
    <input type="text" name="option4" required><br><br>
 
    <label>Correct Option (1 to 4):</label><br>
    <input type="number" name="correctOption" min="1" max="4" required><br><br>
 
    <label>Category:</label><br>
    <input type="text" name="category"><br><br>
 
    <button type="submit">Save Question</button>
</form>
 
</body>
</html>
