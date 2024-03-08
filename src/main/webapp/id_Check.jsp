<%@ page import="com.galphi.account.AccountService" %>
<%@ page import="com.galphi.account.AccountVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ao" class="com.galphi.account.AccountVO">
    <jsp:setProperty property="id" name="ao"/>
</jsp:useBean>


<%
    int id_cnt = AccountService.getInstance().IdCheck(ao.getId());
    out.print(id_cnt);
    if (id_cnt > 0)
    {
        response.getWriter().println("<script>" +
                "alert('이미 사용중인 아이디입니다.'); " +
                "history.go(-1)" +
                "</script>");
    }
    else
    {
        response.getWriter().println("<script>" +
                "alert('사용 가능한 아이디입니다.'); " +
                "history.go(-1)" +
                "</script>");
    }
%>
</body>
</html>
