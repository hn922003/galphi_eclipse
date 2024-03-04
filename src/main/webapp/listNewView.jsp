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

<link rel="stylesheet" href="./css/style.css">
</head>
<body>

<div class="container mt-3">
	<table class="table table-borderless">
		<!-- 오늘 날짜를 기억하는 Date 클래스 객체 -->
		<jsp:useBean id="date" class="java.util.Date"/>
		<c:set var="list" value="${bookNewList.list}"/>
		<c:if test="${list.size() == 0}">
		<tr class="table-danger">
		 	<td colspan="5">
		 		<marquee>테이블에 저장된 글이 없습니다.</marquee>
		 	</td>
		</tr>
		</c:if>
		<c:if test="${list.size() != 0}">
		<c:forEach var="vo" items="${list}">
		<%-- ${vo} --%>
		<fmt:formatDate var="pDate" value="${vo.pDate}" pattern="yy.MM.dd"/>
		<table class="table-borderless ms-sm-5" style="margin: 10px;">
		<tr>
	    	<td rowspan="3" style="width: 150px; height: 200px;"><img alt="title" src="./images/${vo.title}.jpg" style="width: 200px; height: 267px;"></td>
	    	<td>
	    		<h3>
	    			<a href="selectByISBN.jsp?ISBN=${vo.ISBN}&currentPage=${currentPage}">
		 				&nbsp;&nbsp;${vo.title}<%-- (${vo.commentCount}) --%>
		 			</a>
	    		</h3>
	    	</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;${vo.author}&nbsp;&nbsp;•&nbsp;&nbsp;${vo.publisher}&nbsp;&nbsp;•&nbsp;&nbsp;${pDate}</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;평점: ${vo.avg}</td>
		</tr>
		</table>
		<br/><hr/><br/>
		</c:forEach>
		
		<!-- 페이지 이동 버튼 -->
		<tr>
			<td class="align-middle text-center" colspan="5">
				<!-- 처음으로 -->
				<c:if test="${bookNewList.currentPage > 1}">
					<button 
						class="button button1"
						type="button" 
						title="첫 페이지로 이동합니다."
						onclick="location.href='?currentPage=1'"
					>처음</button>
				</c:if>
				<c:if test="${bookNewList.currentPage <= 1}">
					<button 
						class="button button2"
						type="button" 
						title="이미 첫 페이지 입니다."
						disabled="disabled"
					>처음</button>
				</c:if>
				<!-- 10페이지 앞으로 -->
				<c:if test="${bookNewList.startPage > 1}">
					<button
						class="button button1"
						type="button"
						title="이전 10페이지로 이동합니다."
						onclick="location.href='?currentPage=${bookNewList.startPage - 1}'"
					>이전</button>
				</c:if>
				<c:if test="${bookNewList.startPage <= 1}">
					<button
						class="button button2"
						type="button"
						disabled="disabled"
						title="이미 첫 10 페이지 입니다."
					>이전</button>
				</c:if>
			
				<!-- 페이지 이동 버튼 -->
				<c:forEach var="i" begin="${bookNewList.startPage}" end="${bookNewList.endPage}" step="1">
				
				<c:if test="${bookNewList.currentPage == i}">
					<button
						class="button button2"
						type="button"
						disabled="disabled"
					>${i}</button>
				</c:if>

				<c:if test="${bookNewList.currentPage != i}">
					<button
						class="button button1"
						type="button"
						onclick="location.href='?currentPage=${i}'"
					>${i}</button>
				</c:if>
				
				</c:forEach>
			
				<!-- 10페이지 뒤로 -->
				<c:if test="${bookNewList.endPage < bookNewList.totalPage}">
					<button
						class="button button1"
						type="button"
						title="다음 10페이지로 이동합니다."
						onclick="location.href='?currentPage=${bookNewList.endPage + 1}'"
					>다음</button>
				</c:if>
	
				<c:if test="${bookNewList.endPage >= bookNewList.totalPage}">
					<button
						class="button button2"
						type="button"
						disabled="disabled"
						title="이미 마지막 10 페이지 입니다."
					>다음</button>
				</c:if>
				
				<!-- 마지막으로 -->
				<c:if test="${bookNewList.currentPage < bookNewList.totalPage}">
					<button
						class="button button1"
						type="button"
						title="마지막 페이지로 이동합니다."
						onclick="location.href='?currentPage=${bookNewList.totalPage}'"
					>마지막</button>
				</c:if>
			</td>
	 	 </tr>	
	 	 
		</c:if>
	</table>
</div>

</body>
</html>