<%@page import="com.galphi.vo.BookCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body>


<form class="m-3" action="updatecommentOK2.jsp" method="post" name="commentForm">
	<input type="hidden" name="size" size="1" value="${size}"/>
	<input type="hidden" name="avg" size="1" value="${avg}"/>
	<input type="hidden" name="coscore" size="1" value="${coscore}"/>
	<table class="table table-hover" style="width: 700px; margin-left: auto; margin-right: auto;">
		<c:set var="co" value="${co}"/>
		<tr class="table-primary">
			<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
				후기 수정 
			</th>
		</tr>
		
		<!-- 이 줄은 원래 보이면 안되는 줄로 테스트가 완료된 후 화면에 보이지 않게 한다. -->
		<!-- <tr style="display: none;"> -->
		<tr style="display: none;">
			<td colspan="4">
				<!-- 수정 또는 삭제할 댓글의 책번호-->
				ISBN: <input type="text" name="ISBN" size="1" value="${co.ISBN}"/>
				<!-- 현재 댓글이 누구의(?) 댓글인가 -->
				nick: <input type="text" name="nick" size="1" value="${co.nick}"/>
				
				idx:  <input type="text" name="idx" size="1" value="${co.idx}"/>
				<!-- 작업 모드, 1 => 댓글 저장, 2 => 댓글 수정, 3 => 댓글 삭제 -->
				<!-- mode: <input type="text" name="mode" value="1" size="1"/> -->
				<!-- 메인글이 표시되던 페이지 번호 -->
				<%-- currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/> --%>
			</td>
		</tr>
		
		<!-- 이 줄 부터 댓글 입력, 수정, 삭제에 사용한다. -->
		<tr>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="score">별점</label>
			</th>
			<td style="width: 250px;">
				<input id="score" class="form-control form-control-sm" type="text" name="score" value="${co.score}"/>
			</td>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="wDate">작성일</label>
				
			</th>
			<td class="text-center align-middle" style="width: 250px;">
				<fmt:formatDate value="${co.wDate}" pattern="yy년MM월dd일(E)"/>에 남긴글
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
					rows="5" 
					name="memo"
					style="resize: none;">${co.memo}</textarea>
			</td>
		</tr>
		
		<tr class="table-warning">
			<td class="align-middle text-center" colspan="4">
				<input 
					class="btn btn-outline-primary btn-sm" 
					type="submit" 
					value="댓글수정" 
					style="font-size: 13px;"
					name="commentBtn"/>
				<!-- <input 
					class="btn btn-outline-danger btn-sm" 
					type="button" 
					value="다시쓰기" 
					style="font-size: 13px;"/> -->
			</td>
		</tr>
	</table>
</form>


</body>
</html>















