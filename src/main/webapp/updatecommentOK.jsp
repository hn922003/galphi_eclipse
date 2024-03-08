<%@page import="com.galphi.service.BookCommentService"%>
<%@page import="com.galphi.vo.BookCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	// out.println(idx);
	
	BookCommentVO co = BookCommentService.getInstance().selectcommentByIdx(idx);
	
	float coscore = Float.parseFloat(request.getParameter("coscore"));
	// out.print(coscore);
	int size = Integer.parseInt(request.getParameter("size"));
	// out.print(size);
	float avg = Float.parseFloat(request.getParameter("avg"));
	// out.print(avg);
	
	request.setAttribute("coscore", coscore);
	request.setAttribute("size", size);
	request.setAttribute("avg", avg);
	
	request.setAttribute("co", co);
	pageContext.forward("updatecomment.jsp");
	//out.println(co);
	
%>


</body>
</html>