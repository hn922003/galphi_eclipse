<%@ page import="com.galphi.account.AccountService" %>
<%@ page import="com.galphi.account.AccountVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ao" class='com.galphi.account.AccountVO'>
    <jsp:setProperty property="*" name="ao"/>
</jsp:useBean>

<%
    AccountService.getInstance().insert(ao);
    response.getWriter().println("<script>" +
            "confirm('회원 가입이 완료되었습니다'); " +
            "history.go(-1)" +
            "</script>");
    response.sendRedirect("login.jsp");
%>

</body>
</html>
