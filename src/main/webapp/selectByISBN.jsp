<%@page import="com.galphi.service.BookService"%>
<%@page import="com.galphi.vo.BookVO"%>
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
	int ISBN = Integer.parseInt(request.getParameter("ISBN"));
//	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//	out.println(ISBN);
//	메인글 1건을 얻어오는 메소드를 호출한다.
	BookVO vo = BookService.getInstance().selectByISBN(ISBN);
//	out.println(vo);
	
//	브라우저에 출력할 메인글이 저장된 객체, 작업 후 돌아갈 페이지 번호, 줄바꿈에 사용할 이스케이프
//	시퀀스("\r\n")를 request 영역에 저장한다.
	request.setAttribute("vo", vo);
//	request.setAttribute("currentPage", currentPage);
	request.setAttribute("enter", "\r\n");

	pageContext.forward("contentView.jsp");
%>

</body>
</html>