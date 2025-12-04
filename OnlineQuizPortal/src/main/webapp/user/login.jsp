<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>User Login</title></head>
<body>
 
<h2>User Login</h2>
 
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>
 
<form action="<%= request.getContextPath() %>/login" method="post">
    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>
 
    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>
 
    <button type="submit">Login</button>
</form>
 
</body>
</html>
