<%@page import="com.galphi.service.BookService"%>
<%@page import="com.galphi.vo.BookList"%>
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
	
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {
		
	}
	
//	1페이지 분량의 메인글을 얻어온다.
	BookList bookDailyList = BookService.getInstance().selectDailyList(currentPage);
	BookList bookBestList = BookService.getInstance().selectBestList(currentPage);
	BookList bookNewList = BookService.getInstance().selectNewList(currentPage);
	
	request.setAttribute("bookDailyList", bookDailyList); // 메인글을 request 영역에 저장한다.
	request.setAttribute("bookBestList", bookBestList);
	request.setAttribute("bookNewList", bookNewList);
	request.setAttribute("currentPage", currentPage);
	
	String list = request.getParameter("list");
//	out.println(list);

	pageContext.forward("list" + list + "View.jsp");
%>

</body>
</html>