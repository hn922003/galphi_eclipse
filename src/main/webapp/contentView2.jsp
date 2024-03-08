<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<button class="btn btn-sm text-black-50 pt-4" type="button"
						id="login_button" onclick="location.href='login'"> 로그인 | 회원가입
					</button>
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
				<div class="row gx-4 gx-lg-1 align-items-center my-5">
					<div class="col-lg-5">
						<img class="mx-auto d-block" alt="title" src="./images/${vo.ISBN}.jpg" style="width: 60%; height: 60%;">
					</div>
					<div class="col-lg-6" style="text-align: left;">
						<h2 class="font-weight-light">${vo.title}</h2><br/>
						<p>${vo.author}</p>
						<p>${vo.publisher}</p>
						<p>출판일: ${pDate}</p>
						<p>평점: ${vo.avg}</p>
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
			<br/><br/>
		</main><br/>
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