<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galphi</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="icon" href="./images/galphi_fabi.jpg" type="image/x-icon">
<script type="text/javascript" src="./js/register.js" defer="defer"></script>
<style>@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap')</style>
<style>@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap')</style>
</head>
<body>
	<!-- 전체 시멘틱 페이지 폭 -->
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
						<img alt="로고" src="./images/logo.png" title="갈피">
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

		<!-- 메인 -->
		<main class="container text-center pt-1"
			style="background-color: rgba(255, 255, 255, 0.7);">
			<!-- 도서 슬라이더 섹션 -->
			<section>
				<br/>
				<!-- <hr style="width: 80%; text-align: center; margin: auto;"/> -->
				<!-- 베스트 -->
				<div class="container" style="font-family: 'Nanum Myeongjo', serif;">
					<div class="py-3">
						<div class="d-inline">
							<figure class="text-center">
								<blockquote class="blockquote">
									<p class="fw-bold fs-3">
										<i class="bi bi-trophy-fill" style="color: Goldenrod;"></i> 
										베스트 도서 <i class="bi bi-trophy-fill" style="color: Goldenrod;"></i>
									</p>
								</blockquote>
								<figcaption class="blockquote-footer">Best book for you</figcaption>
							</figure>
							<form class="d-inline text-center align-middle" action="./list.jsp" method="post">
								<input type="hidden" name="list" value="Best">
								<button class="btn" type="submit">
									<i class="bi bi-plus-square-fill" style="color: #6D4C3D; font-size: 20px;"></i>
								</button>
							</form>
						</div>
					</div><br/>
					<div id="best" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner justify-content-center">
							<!-- 슬라이더 뷰 - 아이템 중에 한 곳에 액티브 주기 -->
							<div class="carousel-item active justify-content-evenly">
								<a class="mx-5" onclick="location.href='selectByISBN.jsp&ISBN=${vo.ISBN}'">
									<img src="./images/98.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/90.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/91.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/94.jpg" alt="..." style="height: 200px;">
								</a>
								<a class="mx-5">
									<img src="./images/95.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
							<div class="carousel-item justify-content-evenly">
								<a class="mx-5">
									<img src="./images/84.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/85.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/86.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/96.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/97.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
						</div>
						<!-- 이전 버튼 -->
						<button class="carousel-control-prev" type="button"
							data-bs-target="#best" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<!-- 다음 버튼 -->
						<button class="carousel-control-next" type="button"
							data-bs-target="#best" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div><br/><br/>
					<hr />
					<!-- 추천 -->
					<div class="py-5">
						<div class="d-inline">
							<figure class="text-center">
								<blockquote class="blockquote">
									<p class="fw-bold fs-3">
										<i class="bi bi-hand-thumbs-up-fill" style="color: DodgerBlue;"></i> 
											오늘의 갈피 <i class="bi bi-hand-thumbs-up-fill" style="color: DodgerBlue;"></i>
									</p>
								</blockquote>
								<figcaption class="blockquote-footer">
									We recommend to You!!</figcaption>
							</figure>
							<form class="d-inline text-center align-middle"
								action="./list.jsp" method="post">
								<input type="hidden" name="list" value="Daily">
								<button class="btn" type="submit">
									<i class="bi bi-plus-square-fill"
										style="color: #6D4C3D; font-size: 20px;"></i>
								</button>
							</form>
						</div>
					</div>
					<div id="recommend" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner justify-content-center">
							<!-- 슬라이더 뷰 - 아이템 중에 한 곳에 액티브 주기 -->
							<div class="carousel-item active justify-content-evenly">
								<a class="mx-5">
									<img src="./images/98.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/89.jpg" alt="..." style="height: 200px;">
								</a>
								<a class="mx-5">
									<img src="./images/16.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/15.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/4.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
							<div class="carousel-item justify-content-evenly">
								<a class="mx-5">
									<img src="./images/73.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/85.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/72.jpg" alt="..." style="height: 200px;">
								</a>
								<a class="mx-5">
									<img src="./images/96.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/97.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
						</div>
						<!-- 이전 버튼 -->
						<button class="carousel-control-prev" type="button"
							data-bs-target="#recommend" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<!-- 다음 버튼 -->
						<button class="carousel-control-next" type="button"
							data-bs-target="#recommend" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div><br/><br/>
					<hr />
					<!-- 신간 -->
					<div class="py-5">
						<div class="d-inline">
							<figure class="text-center">
								<blockquote class="blockquote">
									<p class="fw-bold fs-3">
										<i class="bi bi-bell-fill" style="color: crimson"></i> 
										신간 도서 <i class="bi bi-bell-fill" style="color: crimson"></i>
									</p>
								</blockquote>
								<figcaption class="blockquote-footer">
									new book for 3 month
								</figcaption>
							</figure>
							<form class="d-inline text-center align-middle" action="./list.jsp" method="post">
								<input type="hidden" name="list" value="New">
								<button class="btn" type="submit">
									<i class="bi bi-plus-square-fill" style="color: #6D4C3D; font-size: 20px;"></i>
								</button>
							</form>
						</div>
					</div>
					<div id="new" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner justify-content-center">
							<!-- 슬라이더 뷰 - 아이템 중에 한 곳에 액티브 주기 -->
							<div class="carousel-item active justify-content-evenly">
								<a class="mx-5">
									<img src="./images/86.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/71.jpg" alt="..." style="height: 200px;"></a>
								<a class="mx-5">
									<img src="./images/70.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/85.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/78.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
							<div class="carousel-item justify-content-evenly">
								<a class="mx-5">
									<img src="./images/42.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/44.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/69.jpg" alt="..." style="height: 200px;">
								</a>
								<a class="mx-5">
									<img src="./images/43.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/81.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
							<div class="carousel-item justify-content-evenly">
								<a class="mx-5">
									<img src="./images/80.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/68.jpg" alt="..." style="height: 200px;">
								</a>
								<a class="mx-5">
									<img src="./images/91.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/76.jpg" alt="..." style="height: 200px;">
								</a> 
								<a class="mx-5">
									<img src="./images/88.jpg" alt="..." style="height: 200px;">
								</a>
							</div>
						</div>
						<!-- 이전 버튼 -->
						<button class="carousel-control-prev" type="button"
							data-bs-target="#new" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<!-- 다음 버튼 -->
						<button class="carousel-control-next" type="button"
							data-bs-target="#new" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
						<br/><br/><br/>
					</div>
				</div>
			</section>
		</main>

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