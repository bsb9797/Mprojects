<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quizportal.model.*" %>
 
<html>
<head><title>Attempt Quiz</title></head>
<body>
 
<%
    Quiz quiz = (Quiz) request.getAttribute("quiz");
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
 
<h2>Quiz: <%= quiz != null ? quiz.getTitle() : "Untitled Quiz" %></h2>
 
<form action="<%= request.getContextPath() %>/user/quiz/submit" method="post">
 
    <% if (quiz != null) { %>
        <input type="hidden" name="quizId" value="<%= quiz.getId() %>">
    <% } %>
 
    <%
        if (questions != null) {
            int i = 1;
            for (Question q : questions) {
    %>
        <p><b><%= i++ %>. <%= q.getQuestionText() %></b></p>
 
        <input type="radio" name="q_<%= q.getId() %>" value="1"> <%= q.getOption1() %><br>
        <input type="radio" name="q_<%= q.getId() %>" value="2"> <%= q.getOption2() %><br>
        <input type="radio" name="q_<%= q.getId() %>" value="3"> <%= q.getOption3() %><br>
        <input type="radio" name="q_<%= q.getId() %>" value="4"> <%= q.getOption4() %><br><br>
    <%
            }
        }
    %>
 
    <button type="submit">Submit Quiz</button>
 
</form>
 
</body>
</html>
