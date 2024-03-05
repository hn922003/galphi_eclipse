<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<link rel="stylesheet" href="./css/view.css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="logo">logo</div>
			<div class="search">
				<form action="list.jsp" method="post" name="search-requirement">
					<select class="search-requirement" name="category">
						<option>제목</option>
						<option>저자</option>
						<option>제목+저자</option>
					</select>
					<input type="text" class="input-search" placeholder="검색어 입력" name="item">
					<input type="hidden" name="list" value="Search"/>
					<input class="button button1" type="submit" value="검색"/>
				</form>
			</div>

			<div class="login">
				<button type="button" id="login_button"
					onclick="location.href='login'">로그인</button>
			</div>
		</div>

		<div class="main">
			<div class="Category">
				<button type="button" class="cate_list" onclick="cate_list(this);">카테고리</button>
				<div class="category">
					<li><a href="list.jsp?list=Novel">소설</a></li>
					<li><a href="list.jsp?list=Develop">자기개발</a></li>
					<li><a href="list.jsp?list=It">IT/컴퓨터</a></li>
					<li><a href="list.jsp?list=Child">아동</a></li>
					<li><a href="list.jsp?list=History">역사</a></li>
				</div>
				<script>
					function cate_list(element) {
						var before = document.getElementsByClassName("active")[0] // 기존에 활성화된 버튼
						if (before
								&& document.getElementsByClassName("active")[0] != element) { // 자신 이외에 이미 활성화된 버튼이 있으면
							before.nextElementSibling.style.maxHeight = null; // 기존에 펼쳐진 내용 접고
							before.classList.remove("active"); // 버튼 비활성화
						}
						element.classList.toggle("active"); // 활성화 여부 toggle

						var content = element.nextElementSibling;
						if (content.style.maxHeight != 0) { // 버튼 다음 요소가 펼쳐져 있으면
							content.style.maxHeight = null; // 접기
						} else {
							content.style.maxHeight = content.scrollHeight + "px"; // 접혀있는 경우 펼치기
						}
					}
				</script>
			</div>
		</div>
	
		<div class="container mt-3">
			<table class="table table-borderless">
				<!-- 오늘 날짜를 기억하는 Date 클래스 객체 -->
				<jsp:useBean id="date" class="java.util.Date"/>
				<c:set var="list" value="${bookDailyList.list}"/>
				<c:if test="${list.size() == 0}">
				<tr class="table-danger">
				 	<td colspan="5">
				 		<marquee>테이블에 저장된 글이 없습니다.</marquee>
				 	</td>
				</tr>
				</c:if>
				<c:if test="${list.size() != 0}">
				<c:forEach var="vo" items="${list}">
				<%-- ${vo} --%>
				<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd"/>
				<table class="table-borderless ms-sm-5" style="margin: 10px;">
				<tr>
			    	<td rowspan="3" style="width: 150px; height: 200px;"><img alt="title" src="./images/${vo.title}.jpg" style="width: 200px; height: 267px;"></td>
			    	<td>
			    		<h3>
			    			<a href="selectByISBN.jsp?ISBN=${vo.ISBN}&currentPage=${currentPage}">
				 				&nbsp;&nbsp;${vo.title}<%-- (${vo.commentCount}) --%>
				 			</a>
			    		</h3>
			    	</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;${vo.author}&nbsp;&nbsp;•&nbsp;&nbsp;${vo.publisher}&nbsp;&nbsp;•&nbsp;&nbsp;${pDate}</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;평점: ${vo.avg}</td>
				</tr>
				</table>
				<br/><hr/><br/>
				</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>