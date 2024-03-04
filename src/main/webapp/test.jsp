<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test</title>
</head>
<body>


<form action="./selectByISBN.jsp" method="post">
	<input type="text" name="ISBN">
	<button type="submit">이동</button>
</form>
<form action="./list.jsp" method="post">
	<input type="hidden" name="list" value="Best">
	<button type="submit">베스트</button>
</form>
<form action="./list.jsp" method="post">
	<input type="hidden" name="list" value="New">
	<button type="submit">신간</button>
</form>
<form action="./list.jsp" method="post">
	<input type="hidden" name="list" value="Daily">
	<button type="submit">추천</button>
</form>



</body>
</html>