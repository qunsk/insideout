<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">
</head>
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
	margin-top: 4rem; /* 해더와의 간격 조정 */
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

.row .col-3 .nav>li>a :hover {
	text-decoration: none;
	color: #D3D3D3;
}

.detail {
	display: block;
	width: 630px;
	/* font-size: 20px;
        font-weight: bolder !important; */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	line-height: 1.2;
	text-align: left;
}

.container-fluid {
	width: 1400px !important;
}
</style>



<body>
	<c:import url="../staffHeader.jsp" />
	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<li><a href="/api/v1/staff/StaffList" class="text-info">상담
						내역</a></li>
				<li><a href="/api/v1/staff/surveyList" class="text-info">만족도
						조사</a></li>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${staff_no}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${staff_no}"
					class="text-info" data-bs-toggle="modal"
					data-bs-target="#wnoteModal">쪽지작성</a></li>

				<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
						수정</a></li>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info"
					data-bs-toggle="modal" data-bs-target="#noteModal">비밀번호 수정</a></li>
			</ul>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 container">
					<form method="post">
						<input type="hidden" id="staff_no" name="staff_no"
							value="${staff_no}">
						<div id="list"></div>
						<nav class="nav">
							<a class="nav-link active text-info" aria-current="page"
								href="StaffList">상담관리</a> <a class="nav-link text-info"
								href="ConfirmList">상담내역</a> <a class="nav-link text-info"
								href="counselRecordList">상담기록</a>
						</nav>
						<table class="table table-hover">
							<tr>
								<td width="100px;">이름</td>
								<!-- <td>학번</td> -->
								<!-- 								<th>예약번호</th> -->
								<td>상담내용</td>
								<td>상담기록일시</td>
							</tr>
							<c:forEach items="${recordList}" var="r">
								<tr>
									<td><input type="hidden" id="student_name"
										name="student_name" value="${r.student_name}">${r.student_name}</td>
									<td><a class="detail"
										href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}"
										style="white-space: nowrap;">${r.counsel_content}</a></td>
									<td><fmt:formatDate value="${r.counsel_record_dt}"
												pattern="yyyy-MM-dd" /></td>
								</tr>
								<input type="hidden" id="booking_no" name="booking_no"
									value="${r.booking_no}">
								<input type="hidden" id="student_no" name="student_no"
									value="${r.student_no}">
							</c:forEach>
						</table>
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
					</form>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
