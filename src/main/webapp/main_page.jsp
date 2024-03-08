<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>메인 화면</title>
</head>
<body>

<%
    if(session.getAttribute("nickname") == null)
    {
        out.println("<a href='login.jsp'>로그인</a>");
        out.println("<a href='account_create.jsp'>회원가입</a>");
    }
    else
    {
        String nickname = (String) session.getAttribute("nickname");
        out.println(nickname+"님 로그인 되었습니다");
        out.print("<a href='logout.jsp'>로그아웃</a>");
    }
%>

</body>
</html>
