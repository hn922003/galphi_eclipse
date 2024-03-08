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
    <jsp:setProperty property="*" name="ao"/>
</jsp:useBean>

<%
    String input_id = ao.getId();
    String input_password = ao.getPassword();

    int account = AccountService.getInstance().Login(input_id,input_password);
    int IdExNo = AccountService.getInstance().IdCheck(input_id);
    String nickname = AccountService.getInstance().nickname(input_id,input_password);

    if(IdExNo == 0)
    {
        response.getWriter().println("<script>" +
                "alert('아이디 정보가 존재하지 않습니다.'); " +
                "history.go(-1)" +
                "</script>");
    }
    else
    {
        if(account == 0)
        {
            response.getWriter().println("<script>" +
                    "alert('비밀번호를 확인하세요'); " +
                    "history.go(-1)" +
                    "</script>");
        }
        else
        {
            session.setAttribute("nickname",nickname);
            response.getWriter().println("<script>" +
                    "alert('로그인 성공!'); " +
                    "</script>");
            response.sendRedirect("index.jsp");
        }
    }

%>

</body>
</html>
