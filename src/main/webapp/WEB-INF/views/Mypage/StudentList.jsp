<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
<!-- 부트스트랩 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/minty/bootstrap.min.css"
	rel="stylesheet">
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
	margin-top: 4rem; /* Adjust the top margin if needed */
	padding-right: 0; /* Remove right padding */
	padding-left: 0; /* Remove left padding */
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}

.bd-sidebar .nav>li>a.text-info {
	color: #28a745; /* Change text color to green */
}

/* Increase the vertical spacing */
.bd-sidebar {
	margin-top: 1rem;
}

.container {
	margin-top: 2rem; /* Increase container spacing */
	margin-left: 0;
	margin-right: 0;
}

.row .col-3 .nav>li>a:hover {
	text-decoration: none;
	color: #D3D3D3;
	background-color: #D3D3D3; /* Add background color for hover effect */
}
/* 페이징 숫자 */
/* .active>.page-link, .page-link.active {
	background-color: #303d4e;
} */

/* 페이징 화살표 */
/* .pagination {
	bs-pagination-disabled-bg: #D3D3D3 !important;
} */
</style>
</head>
<body>
	<c:import url="../studentHeader.jsp" />
	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<li><a href="/api/v1/student/StudentList" class="text-info">상담
						내역</a></li>
				<li><a href="/api/v1/student/surveyList" class="text-info">만족도
						조사</a></li>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${student_no}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${student_no}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${student_no}"
					class="text-info" data-bs-toggle="modal"
					data-bs-target="#wnoteModal">쪽지작성</a></li>
				<li><a href="/api/v1/student/studentUpdateForm"
					class="text-info">회원정보 수정</a></li>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info"
					data-bs-toggle="modal" data-bs-target="#noteModal">비밀번호 수정</a></li>
			</ul>
			<br>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 container">
					<!-- <table class="table table-bordered"> -->
					<table class="table table-hover">
						<tr>
							<th>상담사이름</th>
							<th>상담 내용</th>
							<th>날짜</th>
							<th>시간</th>
						</tr>
						<c:forEach var="booking" items="${bookings}">
							<tr>
								<td>${booking.staff_name}</td>
								<td>${booking.counsel_Request_Content}</td>
								<td>${booking.confirm_Dt}</td>
								<td>${booking.cd_nm}</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징 처리 -->
					<nav aria-label="Page navigation example" align="center">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${startpage > 1}">
									<li class="page-item"><a class="page-link"
										href="?page=${startpage - 1}" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link"
										aria-hidden="true">&laquo;</span></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${startpage}" end="${endpage}" step="1"
								varStatus="loop">
								<c:choose>
									<c:when test="${loop.index == page}">
										<li class="page-item active"><span class="page-link">${loop.index}</span>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="?page=${loop.index}">${loop.index}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${endpage < maxpage}">
									<li class="page-item"><a class="page-link"
										href="?page=${endpage + 1}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><span class="page-link"
										aria-hidden="true">&raquo;</span></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
</body>
</html>
