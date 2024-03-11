<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
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

.container-fluid {
	width: 1000px !important;
}
</style>
</head>
<body>
	<c:import url="../staffHeader.jsp" />
	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<li><a href="/api/v1/staff/StaffList" class="text-info">상담 내역</a></li>
				<li><a href="/api/v1/staff/surveyList" class="text-info">만족도 조사</a></li>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}" class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${staff_no}" class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${staff_no}"
					class="text-info" data-bs-toggle="modal"
					data-bs-target="#wnoteModal">쪽지작성</a></li>
				<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보 수정</a></li>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info"
					data-bs-toggle="modal" data-bs-target="#noteModal">비밀번호 수정</a></li>
			</ul>
		</div>
		<div class="container-fluid">
			<form method="post" action="counselRecordOk">

				<!-- 상담종류 번호 -->
				<input type="hidden" id="booking_no" name="booking_no"
					value="${counselBookingBean.booking_no}"> <input
					type="hidden" id="student_no" name="student_no"
					value="${counselBookingBean.student_no}"> <input
					type="hidden" id="staff_no" name="staff_no" value="${staff_no}">
				<br>
				<div class="form-group">
					<label for="counsel_content">상담기록</label>
					<textarea class="form-control" id="counsel_content"
						name="counsel_content" placeholder="상담내용을 입력해주세요." rows="20"></textarea>
				</div>
				<br>
				<div align="center">
					<button type="reset" class="btn btn-warning">취소</button>
					<button type="submit" class="btn btn-warning">기록</button>
				</div>
			</form>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
		</div>
	</div>
</body>
</html>