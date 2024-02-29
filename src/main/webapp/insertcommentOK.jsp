<%@page import="com.galphi.service.BookCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	// int mode = Integer.parseInt(request.getParameter("mode"));

	/* int mode = Integer.parseInt(request.getParameter("mode")); */

%>

<jsp:useBean id="co" class="com.galphi.vo.BookCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

<%
	out.println("<script>");
	
	BookCommentService.getInstance().insertComment(co);
	
	
	// (BookCommentService.getInstance().updateComment(co);
	
	
	out.println("</script>");
	response.sendRedirect("insertcomment.jsp");

%>

	입력완료
	
</body>
</html>




