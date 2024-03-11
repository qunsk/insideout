<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록 상세페이지</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
table, td, th {
	border: 1px solid black;
}

.active {
	font-weight: bold;
}

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
<body>
	<c:import url="../staffHeader.jsp" />
	<br>
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
			<input type="hidden" id="staff_no" name="staff_no"
				value="${staff_no}"> <br>
			<!-- <h3>상담기록</h3> -->
			<div class="form-group row">
				<label for="student_name" class="col-sm-2 col-form-label">학생이름:
				</label>
				<div class="col-sm-4">${record.student_name}</div>
				<label for="student_no" class="col-sm-2 col-form-label">학번:
				</label>
				<div class="col-sm-4">${record.student_no}</div>
			</div>
			<div class="form-group row">
				<label for="student_name" class="col-sm-2 col-form-label">상담기록
					일자: </label>
				<div class="col-sm-4"><fmt:formatDate value="${record.counsel_record_dt}"
												pattern="yyyy-MM-dd" /></div>
			</div>
			<div class="form-group row">
				<label for="student_name" class="col-sm-2 col-form-label">상담기록:</label>
				<div class="counsel_content">${record.counsel_content}</div>
			</div>
			<br>
			<div align="center">
				<input type="button" class="btn btn-warning"
					onclick="location.href='counselRecordList?page=${page}'" value="목록">
				<input type="button" class="btn btn-warning"
					onclick="location.href='counselRecordUpdate?booking_no=${record.booking_no}&page=${page}'"
					value="수정"> <input type="button" class="btn btn-warning"
					onclick="location.href='counselRecordDelete?booking_no=${record.booking_no}&page=${page}'"
					value="삭제">
			</div>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>