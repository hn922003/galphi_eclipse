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

			<!-- <div class="login">
				<button type="button" id="login_button"
					onclick="location.href='login'">로그인</button>
			</div> -->
			<%
			    if(session.getAttribute("nickname") == null)
			    {			
			        out.println("<input type=\"button\" id=\"login_btn\" class=\"login_btn\" value=\"로그인\" onclick=\"location.href='login.jsp'\">\n");
			        out.println("<input type=\"button\" id=\"signin_btn\" class=\"signin_btn\" value=\"회원가입\" onclick=\"location.href='account_create.jsp'\">\n");
			    }
			    else
			    {
			        String nickname = (String) session.getAttribute("nickname");
			        out.println(nickname+"님 로그인 되었습니다");
			        out.print("<input type=\"button\" id=\"logout_btn\" class=\"logout_btn\" value=\"로그아웃\" onclick=\"location.href='logout.jsp'\">\n");
			    }
			%>
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
				<jsp:useBean id="date" class="java.util.Date" />
				<c:set var="list" value="${bookCategoryList.list}" />
				<c:if test="${list.size() == 0}">
					<tr class="table-danger">
						<td colspan="5"><marquee>테이블에 저장된 글이 없습니다.</marquee></td>
					</tr>
				</c:if>
				<c:if test="${list.size() != 0}">
					<c:forEach var="vo" items="${list}">
						<%-- ${vo} --%>
						<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd" />
						<table class="table-borderless ms-sm-5" style="margin: 10px;">
							<tr>
								<td rowspan="3" style="width: 150px; height: 200px;">
								<img alt="title" src="./images/${vo.title}.jpg" style="width: 200px; height: 267px;"></td>
								<td>
									<h3>
										<a
											href="selectByISBN.jsp?ISBN=${vo.ISBN}&currentPage=${currentPage}">
											&nbsp;&nbsp;${vo.title}<%-- (${vo.commentCount}) --%>
										</a>
									</h3>
								</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;${vo.author}&nbsp;&nbsp;•&nbsp;&nbsp;${vo.publisher}&nbsp;&nbsp;•&nbsp;&nbsp;${pDate}</td>
							</tr>
							<tr>
								<fmt:formatNumber var="voavg" value="${vo.avg}" pattern="##.#"></fmt:formatNumber>
								<td>&nbsp;&nbsp;&nbsp;평점: ${voavg}</td>
							</tr>
						</table>
						<br/>
						<hr/>
						<br/>
					</c:forEach>

					<!-- 페이지 이동 버튼 -->
					<tr>
						<td class="align-middle text-center" colspan="5">
							<!-- 처음으로 -->
							<c:if test="${bookCategoryList.currentPage > 1}">
								<button 
									class="button button1"
									type="button" 
									title="첫 페이지로 이동합니다."
									onclick="location.href='list.jsp?list=It&currentPage=1'"
								>처음</button>
							</c:if>
							<c:if test="${bookCategoryList.currentPage <= 1}">
								<button 
									class="button button2"
									type="button" 
									title="이미 첫 페이지 입니다."
									disabled="disabled"
								>처음</button>
							</c:if>
							<!-- 10페이지 앞으로 -->
							<c:if test="${bookCategoryList.startPage > 1}">
								<button
									class="button button1"
									type="button"
									title="이전 10페이지로 이동합니다."
									onclick="location.href='list.jsp?list=It&currentPage=${bookCategoryList.startPage - 1}'"
								>이전</button>
							</c:if>
							<c:if test="${bookCategoryList.startPage <= 1}">
								<button
									class="button button2"
									type="button"
									disabled="disabled"
									title="이미 첫 10 페이지 입니다."
								>이전</button>
							</c:if>
						
							<!-- 페이지 이동 버튼 -->
							<c:forEach var="i" begin="${bookCategoryList.startPage}" end="${bookCategoryList.endPage}" step="1">
							
							<c:if test="${bookCategoryList.currentPage == i}">
								<button
									class="button button2"
									type="button"
									disabled="disabled"
								>${i}</button>
							</c:if>
			
							<c:if test="${bookCategoryList.currentPage != i}">
								<button
									class="button button1"
									type="button"
									onclick="location.href='list.jsp?list=It&currentPage=${i}'"
								>${i}</button>
							</c:if>
							
							</c:forEach>
						
							<!-- 10페이지 뒤로 -->
							<c:if test="${bookCategoryList.endPage < bookCategoryList.totalPage}">
								<button
									class="button button1"
									type="button"
									title="다음 10페이지로 이동합니다."
									onclick="location.href='list.jsp?list=It&currentPage=${bookCategoryList.endPage + 1}'"
								>다음</button>
							</c:if>
				
							<c:if test="${bookCategoryList.endPage >= bookCategoryList.totalPage}">
								<button
									class="button button2"
									type="button"
									disabled="disabled"
									title="이미 마지막 10 페이지 입니다."
								>다음</button>
							</c:if>
							
							<!-- 마지막으로 -->
							<c:if test="${bookCategoryList.currentPage < bookCategoryList.totalPage}">
								<button
									class="button button1"
									type="button"
									title="마지막 페이지로 이동합니다."
									onclick="location.href='list.jsp?list=It&currentPage=${bookCategoryList.totalPage}'"
								>마지막</button>
							</c:if>
						</td>
				 	 </tr>	
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>