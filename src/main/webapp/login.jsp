<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>

    <script type="text/javascript" src="./js/Account.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/login.css">
    <style>@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&display=swap')</style>
</head>
<body class="text-center" style="font-family: 'Gowun Dodum', sans-serif;">
	<div class="container-fluid"
			style="background-image: url('./images/bg.jpg'); 
			background-repeat: no-repeat; 
			background-attachment: scroll; 
			background-size: cover;">
		<header class="container text-center"  style="background-color: rgba(255, 255, 255, 0.7);">
			<form action="loginOk.jsp" method="post" onsubmit="return true">
			    <!--  html 전체 영역을 지정하는 container -->
			    <div id="container">
			        <!--  login 폼 영역을 : loginBox -->
			        <div id="loginBox">
			            <!-- 로그인 페이지 타이틀 -->
			            <div id="loginBoxTitle">갈피 로그인</div>
			            <!-- 아이디, 비번, 버튼 박스 -->
			            <div id="inputBox">
			                <div class="input-form-box"><span>아이디 </span>
			                    <input type="text" name="id" class="form-control"></div>
			                <div class="input-form-box"><span>비밀번호 </span>
			                    <input type="password" name="password" class="form-control"></div>
			                <div class="button-login-box" >
			                    <button type="button" class="btn btn-primary btn-xs" style="width:47%" onclick="login(form)">로그인</button>
			                    <button type="button" class="btn btn-secondary btn-xs" style="width:47%" onclick="location.href='account_create.jsp'">회원가입</button>
			                </div>
			            </div>
			
			        </div>
			    </div>
			</form>
		</header>
	</div>
</body>
</html>
