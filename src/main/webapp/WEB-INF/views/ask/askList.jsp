<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#asklist_c {
  margin-top: 2rem; /* 글쓰기 버튼 위쪽 간격 조정 */
}
</style>
</head>
<body>
	<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>

	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<c:if test="${role == 'ROLE_STUDENT'}">
					<li><a href="/api/v1/student/StudentList" class="text-info">상담
							내역</a></li>
					<li><a href="/api/v1/student/surveyList" class="text-info">만족도
							조사</a></li>
				</c:if>
				<c:if test="${role == 'ROLE_STAFF'}">
					<li><a href="/api/v1/staff/StaffList" class="text-info">상담
							내역</a></li>
					<li><a href="/api/v1/staff/surveyList" class="text-info">만족도
							조사</a></li>
				</c:if>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${send_id}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${send_id}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${send_id}"
					class="text-info" data-bs-toggle="modal"
					data-bs-target="#wnoteModal">쪽지작성</a></li>
				<c:if test="${role == 'ROLE_STUDENT'}">
					<li><a href="/api/v1/student/studentUpdateForm"
						class="text-info">회원정보 수정</a></li>
				</c:if>
				<c:if test="${role == 'ROLE_STAFF'}">
					<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
							수정</a></li>
				</c:if>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info"
					data-bs-toggle="modal" data-bs-target="#noteModal">비밀번호 수정</a></li>
			</ul>
			<br>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 container">
					<div id="asklist_c">
						<button type="button" value="글쓰기" class="btn btn-outline-warning"
							onclick="location='ask_write'">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-pencil-fill"
								viewBox="0 0 16 16">
  							<path
									d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
						</svg>
							글쓰기
						</button>
					</div>
					<table class="table table-hover">
						<tr>
							<td>작성자ID</td>
							<td>게시글제목</td>
							<td>작성일자</td>

						</tr>

						<c:forEach var="msg" items="${askList }">
							<tr>
								<td>${msg.writer_id }</td>
								<td><c:if test="${msg.up_post_no != 0 }">
						[ ↳ ]
					</c:if> <a href="askView?post_no=${msg.post_no}">${msg.post_title}</a></td>
								<td><fmt:formatDate value="${msg.post_dt }"
										pattern="yyyy-MM-dd" /></td>

							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
</body>
</html>