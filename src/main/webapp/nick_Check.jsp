<%@ page import="com.galphi.account.AccountService" %>
<%@ page import="jakarta.ws.rs.core.Response" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="vo" class="com.galphi.account.AccountVO">
    <jsp:setProperty property="nickname" name="vo"/>
</jsp:useBean>

<%
    int nick_cnt = AccountService.getInstance().nickCheck(vo.getNickname());
    out.print(nick_cnt);
    if (nick_cnt > 0)
    {
        out.println("<script>");
        out.println("alert('이미 존재하는 닉네임입니다.')");
        out.println("location.href='account_create.jsp'");
        out.println("</script>");

    }
    else
    {
        out.println("<script>");
        out.println("confirm('사용 가능한 닉네임입니다!)");
        out.println("location.href='account_create.jsp'");
        out.println("</script>");
    }
%>
</body>
</html>
