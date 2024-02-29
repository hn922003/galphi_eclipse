<%@page import="com.galphi.vo.BookCommentList"%>
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

	/* int mode = Integer.parseInt(request.getParameter("mode")); */
	int ISBN = Integer.parseInt(request.getParameter("ISBN"));
%>

<jsp:useBean id="co" class="com.galphi.vo.BookCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

<%
	out.println("<script>");
	BookCommentList bookCommentList = BookCommentService.getInstance().selectCommentList(ISBN);
	request.setAttribute("bookCommentList", bookCommentList);
	
	out.println("</script>");
	// out.println(ISBN); 
	pageContext.forward("insertcomment.jsp");
	//response.sendRedirect("insertcomment.jsp");
%>

	
</body>
</html>




