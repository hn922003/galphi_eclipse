<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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