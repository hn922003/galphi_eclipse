<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.galphi.vo.BookCommentList"%>
<%@page import="com.galphi.service.BookCommentService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="css/contentViewStyles.css" rel="stylesheet" />
<script type="text/javascript" src="./js/register.js" defer="defer"></script>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-5">
			<a class="navbar-brand" href="#!">Start Bootstrap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd"/>
		<div class="row gx-4 gx-lg-1 align-items-center my-5">
			<div class="col-lg-7">
				<img class="mx-auto d-block" alt="title" src="./images/${vo.title}.jpg" style="width: 300px; height: 400px;">
			</div>
			<div class="col-lg-5">
				<h1 class="font-weight-light">${vo.title}</h1>
				<p>${vo.author}</p>
				<p>${vo.publisher}</p>
				<p>출판일: ${pDate}</p>
				<p>평점: ${vo.avg}</p>
				<a class="btn btn-primary" href="#!">Call to Action!</a>
			</div>
		</div>
		<hr/><br/>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-1">
			<div class="card-body">
				<h2 class="card-title">책 소개</h2><br/>
				<p class="card-text">${vo.summary}</p><br/><hr/><br/>
			</div>
			<div class="card-body">
				<h2 class="card-title">목차</h2><br/>
				<p class="card-text">${vo.chap}</p><br/><hr/><br/>
			</div>
			<div class="card-body">
				<h2 class="card-title">서평</h2><br/>
				<p class="card-text">${vo.review}</p><br/><br/>
			</div>
			<!-- 
			<div class="card-footer">
				<a class="btn btn-primary btn-sm" href="#!">More Info</a>
			</div>
			-->
		</div>
	</div>

	<%-- ${vo.ISBN} --%>
	<!-- 댓글 출력 -->	
<%
	request.setCharacterEncoding("UTF-8");
	int ISBN = Integer.parseInt(request.getParameter("ISBN"));	
	out.print(ISBN);
	BookCommentList bookCommentList = BookCommentService.getInstance().selectCommentList(ISBN);
	request.setAttribute("bookCommentList", bookCommentList);
%>
	<table class="table table-hover" style="width: 700px; margin-left: auto; margin-right: auto;">
		<c:set var="comment" value="${bookCommentList.list}"/>
		<c:if test="${comment.size() == 0}">
		<tr>
			<td colspan="4">
				<marquee>댓글이 하나도 없네요~~~~~ 인기가 꽝이에요~~~~~</marquee>
			</td>
		</tr>
		</c:if>
		
		<!-- 댓글이 있는 경우 -->
		<c:if test="${comment.size() != 0}">
		<c:forEach var="co" items="${comment}">
		<tr class="table-primary">
			<td colspan="4">
				${co.idx}. 
				<c:set var="nick" value="${fn:replace(co.nick, '<', '&lt;')}"/>
				<c:set var="nick" value="${fn:replace(nick, '>', '&gt;')}"/>
				${co.nick}님이
				<fmt:formatDate value="${co.wDate}" pattern="yy년MM월dd일(E)"/>에 남긴글
				<c:set var="memo" value="${fn:replace(co.memo, '<', '&lt;')}"/>
				<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}"/>
				<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평점: ${co.score}점<br/>
				${co.memo}<br/>
				<!-- <div class="align-middle d-flex justify-content-end"> -->
				<div align="right">
					<input 
						class="btn btn-outline-primary btn-sm" 
						type="button" 
						value="댓글수정" 
						style="font-size: 13px;"
						onclick="location.href='updatecommentOK.jsp?idx=${co.idx}'"/>
					<input 
						class="btn btn-outline-danger btn-sm" 
						type="button" 
						value="댓글삭제" 
						style="font-size: 13px;"
						onclick="location.href='deletecommentOK.jsp?idx=${co.idx}'"/>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
<!-- 댓글 입력창 -->
<form class="m-3" action="insertcommentOK.jsp" method="post" name="commentForm">
	<table class="table table-hover" style="width: 700px; margin-left: auto; margin-right: auto;">
	
		<tr class="table-primary">
			<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
				후기 입력
			</th>
		</tr>
		
		<!-- 이 줄은 원래 보이면 안되는 줄로 테스트가 완료된 후 화면에 보이지 않게 한다. -->
		<!-- <tr style="display: none;"> -->
		<tr style="display: none;">
			<td colspan="4">
				<!-- 수정 또는 삭제할 댓글의 책번호-->
				ISBN: <input type="hidden" name="ISBN" size="1"/>
				<!-- 현재 댓글이 누구의(?) 댓글인가 -->
				nick: <input type="hidden" name="nick" size="1"/>
				<!-- 작업 모드, 1 => 댓글 저장, 2 => 댓글 수정, 3 => 댓글 삭제 -->
				<!-- mode: <input type="text" name="mode" value="1" size="1"/> -->
				<!-- 메인글이 표시되던 페이지 번호 -->
				<%-- currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/> --%>
			</td>
		</tr>
		
		<!-- 이 줄 부터 댓글 입력, 수정, 삭제에 사용한다. -->
		<tr>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="score">별점</label>
			</th>
			<td style="width: 250px;">
				<input id="score" class="form-control form-control-sm" type="text" name="score"/>
			</td>
		</tr>
	
		<tr>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="memo">후기</label>
			</th>
			<td colspan="3" style="width: 600px;">
				<textarea 
					id="memo" 
					class="form-control form-control-sm" 
					rows="5" 
					name="memo"
					style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr class="table-warning">
			<td class="align-middle text-center" colspan="4">
				<input 
					class="btn btn-outline-primary btn-sm" 
					type="submit" 
					value="댓글저장" 
					style="font-size: 13px;"
					name="commentBtn"/>
				<!-- <input 
					class="btn btn-outline-danger btn-sm" 
					type="button" 
					value="다시쓰기" 
					style="font-size: 13px;"/> -->
			</td>
		</tr>
	</table>
</form>	
	
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>