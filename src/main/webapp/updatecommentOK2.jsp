<%@page import="com.galphi.service.BookService"%>
<%@page import="com.galphi.vo.BookVO"%>
<%@page import="com.galphi.vo.Param"%>
<%@page import="com.galphi.dao.BookCommentDAO"%>
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
	String check_memo = request.getParameter("memo");
	try {
		int checkScore = Integer.parseInt(request.getParameter("score"));
		if (check_memo == "") {
			out.print("<script>");
			out.println("alert('후기를 입력해주세요.')");
			out.println("history.go(-1)");
			out.print("</script>");
		}
		else if (checkScore > 10 || checkScore < 0) {
			out.print("<script>");
			out.println("alert('별점을 0 ~ 10 사이로 입력해 주세요.')");
			out.println("history.go(-1)");
			out.print("</script>");
		}
		else {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String memo = request.getParameter("memo");
			float score = Float.parseFloat(request.getParameter("score"));
			//out.println(idx);
			Param param = new Param(idx, memo, score);
			BookCommentService.getInstance().updateComment(param);

			int ISBN = Integer.parseInt(request.getParameter("ISBN"));
			request.setAttribute("ISBN", ISBN);

			float coscore = Float.parseFloat(request.getParameter("coscore"));
			// out.print(coscore);
			int size = Integer.parseInt(request.getParameter("size"));
			// out.print(size);
			float avg = Float.parseFloat(request.getParameter("avg"));
			// out.print(avg);

			avg = (avg * size - coscore + score) / size;
			// out.print(avg);

			BookService.getInstance().update(avg, ISBN);

			pageContext.forward("selectByISBN.jsp");
		}
	} catch (Exception e) {
		out.print("<script>");
		out.println("alert('별점이 없습니다.')");
		out.println("history.go(-1)");
		out.print("</script>");	
	}
%>


</body>
</html>