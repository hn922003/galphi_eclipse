<%@page import="com.galphi.vo.BookCommentList"%>
<%@page import="com.galphi.service.BookService"%>
<%@page import="com.galphi.service.BookCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="co" class="com.galphi.vo.BookCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

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
			BookCommentService.getInstance().insertComment(co);
			request.setAttribute("ISBN", co.getISBN());
			
			float avg = Float.parseFloat(request.getParameter("avg"));
			// out.print(avg);
			int size = Integer.parseInt(request.getParameter("size"));
			// out.print(size);
			float score = co.getScore();
			// out.print(score);
			avg = (avg * size + score) / (size + 1);
			// out.print(avg);
			
			BookService.getInstance().update(avg, co.getISBN());
			
			pageContext.forward("selectByISBN.jsp");
		}
	} catch (Exception e) {
		out.print("<script>");
		out.println("alert('별점이 없습니다.')");
		out.println("history.go(-1)");
		out.print("</script>");	
	}
	//out.print(memo);
	//out.print(checkScore2);
	
%>

<%-- 11111 ${ISBN} <br/>
2222 ${co.ISBN}<br/>
333 ${co} --%>

</body>
</html>




