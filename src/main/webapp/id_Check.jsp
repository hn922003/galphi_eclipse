<%@ page import="com.galphi.account.AccountService" %>
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
    <jsp:setProperty property="id" name="vo"/>
</jsp:useBean>


<%
    if(vo.getId() == null)
    {
        response.getWriter().println("<script>" +
                "alert('ID를 입력해주세요.'); " +
                "history.go(-1)" +
                "</script>");
    }
    else
    {
        int id_cnt = AccountService.getInstance().IdCheck(vo.getId());
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
    }

%>
</body>
</html>
