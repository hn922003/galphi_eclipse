<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galphi</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="logo">logo</div>
			<div class="search">
				<form method="post" name="search-requirement" action="searchbbs.jsp">
					<select class="search-requirement" name="searchField">
						<option value="title">제목</option>
						<option value="author">저자</option>
						<option value="title_author">제목+저자</option>
					</select>
				</form>
				<input type="text" class="input-search" placeholder="검색어 입력" name="searchText">
				<button type="button" id="search_button"
					onclick="location.href='search'" class="btn-success">검색</button>
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