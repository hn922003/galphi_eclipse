<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>

<%
    session.removeAttribute("nickname");
    //response.sendRedirect("history.go(-1)");
    out.println("<script>");
    out.println("location.href='index.jsp'");
    out.println("</script>");
%>

</body>
</html>