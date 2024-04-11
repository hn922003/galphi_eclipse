<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="icon" href="./images/galphi_fabi.jpg" type="image/x-icon">
<style>@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap')</style>
<style>@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap')</style>
<link rel="stylesheet" href="./css/view.css">
</head>
<body>
	<div class="container-fluid"
		style="background-image: url('./images/bg.jpg'); 
		background-repeat: no-repeat; 
		background-attachment: scroll; 
		background-size: cover;">
		<!-- 헤더 -->
		<header class="container text-center"
			style="background-color: rgba(255, 255, 255, 0.7);">
			<!-- 로고 / 검색 폼 / 회원가입-->
			<div class="row">
				<!-- 로고 -->
				<div class="col-3">
					<button class="btn" type="button" onclick="location.href='index.jsp'">
						<img alt="갈피" src="./images/logo.png" title="로고">
					</button>
				</div>
				<!-- 로고 끝 -->
				<!-- 검색 폼 -->
				<div class="col-6 pt-5">
					<br/>
					<form class="form-control form-control-sm d-flex" action="list.jsp"
						method="post" name="search-requirement"
						style="background-color: #6D4C3D; border-radius: 12px; font-family: 'Gowun Dodum', sans-serif;">
						<select class="mr-2 text-center" name="category"
							style="width: 100px; background-color: #6D4C3D; color: white; border: none;">
							<option>제목</option>
							<option>저자</option>
							<option>제목+저자</option>
						</select>&nbsp; 
						<input type="text" class="form-control form-control-sm" placeholder="&nbsp;검색어를 입력하세요" name="item"> 
						<input type="hidden" name="list" value="Search"/>&nbsp;
						<button class="btn bg-primary" type="submit">
							<i class="bi bi-search text-white"></i>
						</button>
					</form>
					<!-- 검색 폼 끝 -->
				</div>
				<!-- 로그인/회원가입 폼 -->
				<div class="col-3" style="font-family: 'Gowun Dodum', sans-serif;">
					<%
					    if(session.getAttribute("nickname") == null)
					    {			
					        out.println("<input type=\"button\" id=\"login_button\" class=\"btn btn-sm text-black-50 pt-4\" value=\"로그인\" onclick=\"location.href='login.jsp'\">\n");
					        out.println("<input type=\"button\" id=\"login_button\" class=\"btn btn-sm text-black-50 pt-4\" value=\"회원가입\" onclick=\"location.href='account_create.jsp'\">\n");
					    }
					    else
					    {
					        String nickname = (String) session.getAttribute("nickname");
					        out.println(nickname+"님 로그인 되었습니다");
					        out.print("<input type=\"button\" id=\"logout_btn\" class=\"btn btn-sm text-black-50 pt-4\" value=\"로그아웃\" onclick=\"location.href='logout.jsp'\">\n");
					    }
					%>
				</div>
				<!-- 로그인/회원가입 폼 끝-->
			</div>
			<!-- 로고 / 검색 폼 / 회원가입 끝-->

			<!-- 카테고리 네비게이션 -->
			<div class="d-flex mx-5 justify-content-start">
				<ul class="d-flex nav nav-tabs rounded-pill" style="border: none;">
					<li class="nav-item dropdown"
						style="background-color: none; border-color: #6D4C3D;">
						<a class="nav-link dropdown-toggle link-light" data-bs-toggle="dropdown" href="#"> 
							<span style="color: #6D4C3D; font-family: 'Nanum Myeongjo', serif;">카테고리</span>
						</a>
						<ul class="dropdown-menu" style="opacity: 0.8">
							<li style="font-family: 'Nanum Myeongjo', serif;"><a class="dropdown-item" href="list.jsp?list=Novel">
								<span style="color: #6D4C3D;">소설</span></a></li>
							<li style="font-family: 'Nanum Myeongjo', serif;"><a class="dropdown-item" href="list.jsp?list=Develop">
								<span style="color: #6D4C3D;">자기계발</span></a></li>
							<li style="font-family: 'Nanum Myeongjo', serif;"><a class="dropdown-item" href="list.jsp?list=It">
								<span style="color: #6D4C3D;">IT/컴퓨터</span></a></li>
							<li style="font-family: 'Nanum Myeongjo', serif;"><a class="dropdown-item" href="list.jsp?list=Child">
								<span style="color: #6D4C3D;">아동</span></a></li>
							<li style="font-family: 'Nanum Myeongjo', serif;"><a class="dropdown-item" href="list.jsp?list=History">
								<span style="color: #6D4C3D;">역사</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- 카테고리 네비게이션 끝 -->
		</header>
		<main class="container text-center pt-1"
			style="background-color: rgba(255, 255, 255, 0.7);">
			<h2><b style="font-family: 'Nanum Myeongjo', serif;">역사</b></h2><br/>
			<div class="container mt-3" style="font-family: 'Gowun Dodum', sans-serif;">
				<table class="table table-borderless">
					<!-- 오늘 날짜를 기억하는 Date 클래스 객체 -->
					<jsp:useBean id="date" class="java.util.Date" />
					<c:set var="list" value="${bookCategoryList.list}" />
					<c:if test="${list.size() == 0}">
						<tr class="table-danger">
							<td colspan="5"><marquee>저장된 책이 없습니다.</marquee></td>
						</tr>
					</c:if>
					<c:if test="${list.size() != 0}">
						<c:forEach var="vo" items="${list}">
							<%-- ${vo} --%>
							<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd" />
							<table class="table-borderless ms-sm-5" style="margin: 10px;">
								<tr>
									<td rowspan="3" style="width: 150px; height: 200px;">
									<img alt="title" src="./images/${vo.ISBN}.jpg" style="width: 200px; height: 267px;"></td>
									<td style="text-align: left;">
										<h4>
											<a
												href="selectByISBN.jsp?ISBN=${vo.ISBN}&currentPage=${currentPage}"
												style="color: black; text-decoration: none; font-weight: bold; font-size: 32;">
												&nbsp;&nbsp;${vo.title}<%-- (${vo.commentCount}) --%>
											</a>
										</h4>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.author}<br/><br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.publisher}&nbsp;&nbsp;/&nbsp;&nbsp;${pDate}<br/><br/>
										<fmt:formatNumber var="voavg" value="${vo.avg}" pattern="##.#"></fmt:formatNumber>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평점: ${voavg}<br/>
									</td>
								</tr>
							</table>
							<br/><hr style="color: #6D4C3D;"/><br/>
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
										onclick="location.href='list.jsp?list=History&currentPage=1'"
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
										onclick="location.href='list.jsp?list=History&currentPage=${bookCategoryList.startPage - 1}'"
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
										onclick="location.href='list.jsp?list=History&currentPage=${i}'"
									>${i}</button>
								</c:if>
								
								</c:forEach>
							
								<!-- 10페이지 뒤로 -->
								<c:if test="${bookCategoryList.endPage < bookCategoryList.totalPage}">
									<button
										class="button button1"
										type="button"
										title="다음 10페이지로 이동합니다."
										onclick="location.href='list.jsp?list=History&currentPage=${bookCategoryList.endPage + 1}'"
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
										onclick="location.href='list.jsp?list=History&currentPage=${bookCategoryList.totalPage}'"
									>마지막</button>
								</c:if>
							</td>
					 	 </tr>	
					</c:if>
				</table>
			</div>
		</main><br/>
		<!-- 풋터 -->
		<footer class="container bg-dark">
			<br/><br/>
			<!-- 카피라이트 -->
			<div class="container px-4 px-lg-5">
				<p class="m-0 text-center text-white">Copyright &copy; TJoeun
					Academy Team Project: Galphi 2024</p>
			</div>
			<!-- 만든이 / 연락처 -->
			<br/><br/>
		</footer>
	</div>
</body>
</html>