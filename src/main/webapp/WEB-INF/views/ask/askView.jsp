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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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
</style>




<script>
	function deleteAskView(post_no) {
		var result = confirm("삭제 하시겠습니까?");
		if (result) {
			location.href = "/api/v1/user/deleteAskView?post_no=" + post_no;
		}
	}
</script>
</head>

<body>
	<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>

	<%-- <c:import url="../staffHeader.jsp" /> --%>

	<div class="row flex-nowrap">
		<c:if test="${role != 'ROLE_ADMIN'}">
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
					<li><a href="/api/v1/user/AskList" class="text-info">1:1
							문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${send_id}"
						class="text-info">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${send_id}"
						class="text-info">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${send_id}"
						class="text-info">쪽지작성</a></li>
					<c:if test="${role == 'ROLE_STUDENT'}">
						<li><a href="/api/v1/student/studentUpdateForm"
							class="text-info">회원정보 수정</a></li>
					</c:if>
					<c:if test="${role == 'ROLE_STAFF'}">
						<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
								수정</a></li>
					</c:if>
					<li><a href="/api/v1/user/PasswordUpdateForm"
						class="text-info">비밀번호 수정</a></li>
				</ul>
			</div>
		</c:if>

		<!--  -->
		<br> <br>
		<!-- <h1 align="center">1:1 문의</h1> -->
		<br> <br>
		<div style="text-align: center; width: 60%">
			<table class="table table-hover" border=1>
				<input type="hidden" name="board_re_ref" value="${board_re_ref}">
				<tr>
					<th>ID</th>
					<td>${askBoard.writer_id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${askBoard.post_title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="50" readonly
							style="border-color: #ccc;"> ${askBoard.post_content }</textarea></td>
				</tr>

				<tr>
					<td colspan=2 align=center><input type="button"
						class="btn btn-outline-success" value="글 삭제"
						onClick="deleteAskView('${askBoard.post_no }')"> <c:if
							test="${role == 'ROLE_ADMIN'}">
							<input type="button" value="답변" class="btn btn-outline-success"
								onClick="location.href='/api/v1/admin/replyAsk?post_no=${askBoard.post_no }&board_re_ref=${askBoard.board_re_ref}' ">
						</c:if></td>
				</tr>
			</table>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>