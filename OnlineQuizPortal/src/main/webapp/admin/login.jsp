<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
<h2>Admin Login</h2>

<%-- Show error message if present --%>
<% 
    String error = (String) request.getAttribute("error");
    if (error != null) { 
%>
    <p style="color:red;"><%= error %></p>
<% 
    } 
%>

<form action="<%= request.getContextPath() %>/admin-login" method="post">
    <label>Email:</label><br>
    <input type="email" name="email" required><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>
</body>
</html>
