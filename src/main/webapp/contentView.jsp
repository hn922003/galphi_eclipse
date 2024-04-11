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
<title>Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="icon" href="./images/galphi_fabi.jpg" type="image/x-icon">
<style>@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap')</style>
<style>@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap')</style>
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
					<!-- <button class="btn btn-sm text-black-50 pt-4" type="button"
						id="login_button" onclick="location.href='login'"> 로그인 | 회원가입
					</button> -->
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
		<!-- Page Content-->
		<main class="container text-center pt-1"
			style="background-color: rgba(255, 255, 255, 0.85);">
			<div class="container px-4 px-lg-5" style="font-family: 'Gowun Dodum', sans-serif;">
				<!-- Heading Row-->
				<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd"/>
				<fmt:formatNumber var="voavg" value="${vo.avg}" pattern="##.#"></fmt:formatNumber>
				<div class="row gx-4 gx-lg-1 align-items-center my-5">
					<div class="col-lg-5">
						<img class="mx-auto d-block" alt="title" src="./images/${vo.ISBN}.jpg" style="width: 60%; height: 60%;">
					</div>
					<div class="col-lg-6" style="text-align: left;">
						<h2 class="font-weight-light">${vo.title}</h2><br/>
						<p>${vo.author}</p>
						<p>${vo.publisher}</p>
						<p>출판일: ${pDate}</p>
						<p>평점: ${voavg}</p>
					</div>
				</div>
				<hr/><br/>
				<!-- Content Row-->
				<div class="row gx-4 gx-lg-1" style="text-align: left;">
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
				</div>
			</div>
			<br/><hr style="color: #6D4C3D;"/><br/>
			<!-- 댓글 출력 -->	
			<%
				request.setCharacterEncoding("UTF-8");
				int ISBN = Integer.parseInt(request.getParameter("ISBN"));	
				//out.print(ISBN);
				BookCommentList bookCommentList = BookCommentService.getInstance().selectCommentList(ISBN);
				request.setAttribute("bookCommentList", bookCommentList);
			%>
			<div class="container">
				<form class="m-3" action="insertcommentOK.jsp" method="post" name="commentForm">
					<table style="margin-left: auto; margin-right: auto;">
						<c:set var="comment" value="${bookCommentList.list}"/>
						<!-- 댓글 입력 시 새로운 댓글 별점 반영해서 평점 새로 계산 -->
						<c:set var="avg" value="0"/>
						<c:forEach var="co" items="${comment}">
							<c:set var="avg" value="${avg = avg + co.score}"/>
						</c:forEach>
						<c:set var="avg" value="${avg/comment.size()}"/>
						<%-- <fmt:formatNumber var="avg" value="${avg}" pattern="##.#"></fmt:formatNumber> --%>
						<tr class="align-middle text-center">
							<td>
								<figure class="text-center">
								  <blockquote class="blockquote">
								    <p class="fw-bold fs-3 text-secondary"><i class="bi bi-activity"></i> 먼저 읽어본 길라잡이들의 이야기 <i class="bi bi-activity"></i></p>
								  </blockquote>
								  <figcaption class="blockquote-footer">
								    당신의 갈피를 잡아줄 <cite title="Source Title">속삭임</cite>
								  </figcaption>
								</figure>
								<div class="text-danger mb-4 fs-5">
									<c:set var="fillstars" value="${avg / 2 - avg / 2 % 1}"/><!-- 내림처리 -->
									<c:set var="halfStars" value="${avg % 2.0}"/>
									<c:forEach begin="1" end="${fillstars}" step="1" >
										<i class="bi bi-star-fill"></i>
									</c:forEach>
									<c:if test="${halfStars != 0}">
										<i class="bi bi-star-half"></i>
										<c:set var="halfStars" value="1"/>
									</c:if>
									<c:forEach begin="1" end="${5 - (fillstars + halfStars)}" step="1" >
										<i class="bi bi-star"></i>
									</c:forEach>
									&nbsp;<b>평점: ${voavg}</b> 
									<input type="hidden" name="avg" value="${avg}"/>
									<input type="hidden" name="size" value="${comment.size()}"/>
								</div>
							</td>
						</tr>
						<!-- 후기가 없는 경우 -->
						<c:if test="${comment.size() == 0}">
						<tr class="align-middle text-center">
							<td colspan="4">
								<marquee>첫번째 후기를 남겨주세요!!</marquee>
							</td>
						</tr>
						</c:if>
						
						<!-- 후기가 있는 경우 -->
						<c:if test="${comment.size() != 0}">
						<c:forEach var="co" items="${comment}">
						<tr>
							<td class="clearfix p-2" colspan="4">
								<c:set var="nick" value="${fn:replace(co.nick, '<', '&lt;')}"/>
								<c:set var="nick" value="${fn:replace(nick, '>', '&gt;')}"/>
								<div class="d-inline p-3 align-middle">
									<b class="d-inline-flex float-center">${co.nick}</b>
									<small class="ml-3">
										<fmt:formatDate value="${co.wDate}" pattern="yy.MM.dd"/>
									</small>
									<c:if test="${nickname == co.nick}">
									<button
										class="btn btn-sm text-primary"
										type="button"
										style="font-size: 12px; margin-right: -12px;"
										title="후기수정"
										onclick="location.href='updatecommentOK.jsp?idx=${co.idx}&coscore=${co.score}&avg=${avg}&size=${comment.size()}'">
										<i class="bi bi-wrench-adjustable"></i>
									</button>
									<button
										class="btn btn-sm text-danger"
										type="button"
										style="font-size: 12px;"
										title="후기삭제"
										onclick="location.href='deletecommentOK.jsp?idx=${co.idx}&ISBN=${co.ISBN}&coscore=${co.score}&avg=${avg}&size=${comment.size()}'">
										<i class="bi bi-x-circle-fill"></i>
									</button>	
									</c:if>
								</div>
								<div class="d-inline-flex float-end" style="color: red;">
									<!-- 평점 만큼 별의 개수를 적어준다 온별 반별 -->
									${co.score}	&nbsp;&nbsp;
									<c:set var="fillstars" value="${co.score / 2 - co.score / 2 % 1}"/><!-- 내림처리 -->
									<c:set var="halfStars" value="${co.score % 2.0}"/>
									<c:forEach var="fillStar" begin="1" end="${fillstars}" step="1" >
										<i class="bi bi-star-fill"></i>
									</c:forEach>
									<c:if test="${halfStars != 0}">
										<i class="bi bi-star-half"></i>
										<c:set var="halfStars" value="1"/>
									</c:if>
									<c:forEach var="emptyStar" begin="1" end="${5 - (fillstars + halfStars)}" step="1" >
										<i class="bi bi-star"></i>
									</c:forEach>
									<small class="text-black-50"><span>&nbsp; / &nbsp;</span></small>
									<c:if test="${fillstars == 5}">
										<b style="color: deeppink; border: 1px solid;">&nbsp;<i class="bi bi-emoji-laughing"></i> 완벽해요&nbsp;</b> 
									</c:if>
									<c:if test="${fillstars == 4}">
										<b style="color: blue; border: 1px solid;">&nbsp;<i class="bi bi-emoji-smile"></i> 추천해요&nbsp;</b> 
									</c:if>
									<c:if test="${fillstars == 3}">
										<b style="color: green; border: 1px solid;">&nbsp;<i class="bi bi-emoji-neutral"></i> 읽어봐요&nbsp;</b> 
									</c:if>
									<c:if test="${fillstars == 2}">
										<b style="color: yellow; border: 1px solid;">&nbsp;<i class="bi bi-emoji-frown"></i> 아쉬워요&nbsp;</b> 
									</c:if>
									<c:if test="${fillstars == 1}">
										<b style="color: orangered; border: 1px solid;">&nbsp;<i class="bi bi-emoji-dizzy"></i> 별로예요&nbsp;</b> 
									</c:if>
									<c:if test="${fillstars == 0}">
										<b style="color: red; border: 1px solid;">&nbsp;<i class="bi bi-emoji-angry"></i> 비추예요&nbsp;</b> 
									</c:if>
								</div>
								<br/>
								<c:set var="memo" value="${fn:replace(co.memo, '<', '&lt;')}"/>
								<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}"/>
								<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}"/>
								<div class="p-3 pt-3 pb-3">
									${memo}
								</div>
								<hr style="color: #6D4C3D;">
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</table>
				<!-- 댓글 입력창 -->
					<c:if test="${nickname == null}">
						<table class="table table-hover table-warning table-border" style="width: 700px; margin-left: auto; margin-right: auto;">
							<tr style="background-color: royalblue;">
								<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
									후기를 입력하고 싶으면 로그인 하세요
								</th>
							</tr>
						</table>
					</c:if>
					<c:if test="${nickname != null}">

					<table style="width: 700px; margin-left: auto; margin-right: auto;">
						
						<tr>
							<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
								후기 입력
							</th>
						</tr>
						
						<!-- 이 줄은 원래 보이면 안되는 줄로 테스트가 완료된 후 화면에 보이지 않게 한다. -->
						<!-- <tr style="display: none;"> -->
						<tr style="display: none;">
							<td colspan="4">
								<!-- 수정 또는 삭제할 댓글의 책번호-->
								ISBN: <input type="text" name="ISBN" value="${vo.ISBN}"/>
								<!-- 현재 댓글이 누구의(?) 댓글인가 -->
								nick: <input type="hidden" name="nick" value="${nickname}"/>
								<!-- 작업 모드, 1 => 댓글 저장, 2 => 댓글 수정, 3 => 댓글 삭제 -->
								<!-- mode: <input type="text" name="mode" value="1" size="1"/> -->
								<!-- 메인글이 표시되던 페이지 번호 -->
								<%-- currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/> --%>
							</td>
						</tr>
						
						<!-- 댓글 입력 -->
						<tr>
							<th class="align-middle text-center" style="width: 100px;">
								<label for="score">별점</label>
							</th>
							<td style="width: 250px;">
								<input 
									id="score" 
									class="form-control form-control-sm" 
									type="number"
									placeholder="0 ~ 10점을 입력해주세요" 
									name="score"/>
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
									rows="10" 
									name="memo"
									placeholder="당신의 소중한 경험을 이야기해주세요."
									style="resize: none;"></textarea>
							</td>
						</tr>
						
						<tr class="table-warning">
							<td class="align-middle text-center" colspan="4">
								<button
									class="btn btn-outline-primary btn-sm"
									type="submit"
									name="commentBtn">
									<i class="bi bi-pencil"></i>&nbsp;후기쓰기
								</button>
							</td>
						</tr>
					</table>
					</c:if>
				</form>	
			</div>
			<br/><br/>
		</main>
		
		<!-- Footer-->
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