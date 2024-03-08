<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>

<%
    session.removeAttribute("nickname");
    response.sendRedirect("index.jsp");
%>

</body>
</html>
