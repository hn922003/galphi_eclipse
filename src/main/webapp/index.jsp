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
					onclick="location.href='login.jsp'">로그인</button>
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
                     content.style.maxHeight = content.scrollHeight
                           + "px"; // 접혀있는 경우 펼치기
                  }
               }
            </script>
			</div>
		</div>
		<div class="rolling_book">
			<table>
				<tr>
					<th>Best</th>
					<th>
						<form action="./list.jsp" method="post">
							<input type="hidden" name="list" value="Best">
							<button type="submit">+</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan='2'>베스트</td>
				</tr>
				<tr>
					<th>오늘의 추천 도서</th>
					<th width="10">
						<form action="./list.jsp" method="post">
							<input type="hidden" name="list" value="Daily">
							<button type="submit">+</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan='2'>오늘 추천 도서</td>
				</tr>
				<tr>
					<th>new</th>
					<th>
						<form action="./list.jsp" method="post">
						<input type="hidden" name="list" value="New">
						<button type="submit">+</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan='2'>신간 도서</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>