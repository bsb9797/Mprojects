<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>User Registration</title></head>
<body>
 
<h2>Create Account</h2>
 
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>
 
<form action="<%= request.getContextPath() %>/register" method="post">
 
    <label>Full Name:</label><br>
    <input type="text" name="fullName" required><br><br>
 
    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>
 
    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>
 
    <button type="submit">Register</button>
</form>
 
</body>
</html>
