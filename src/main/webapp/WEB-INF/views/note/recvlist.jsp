<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="passmo.jsp" %>
<%@ include file="writemo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 메시지</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="path/to/bootstrap.min.css">
<script src="path/to/bootstrap.min.js"></script>


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
	// 받은 메세지
	function mytable1(recv_id) {
		alert(recv_id);
		location.href = "recvlist?recv_id=" + recv_id;
	}

	// 보낸 메세지
	function mytable2(send_id) {
		alert(send_id);
		location.href = "sendlist?send_id=" + send_id;
	}

	function msgchk() {
		alert("전체 메시지를 읽음처리합니다.");
		var checkboxes = document.getElementsByName("checked");
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				var row = checkboxes[i].parentNode.parentNode;
				var contentCell = row.cells[2];
				contentCell.style.textDecoration = "none";
			}
		}
		document.getElementById("rdform").action = "msgchk";
		document.getElementById("rdform").submit();
	}

	function msgdel() {
		if (confirm("정말로 선택한 메시지를 삭제하시겠습니까?")) {
			document.getElementById("rdform").action = "msgdel";
			document.getElementById("rdform").submit();
		}
	}
</script>

<script>
	// 모달 요소를 가져옵니다.
	var modal = document.getElementById("noteModal${vs.index}");

	// 모달을 열기 위한 버튼을 가져옵니다.
	// var button = document.getElementById("replyButton${vs.index}");

	// 버튼을 클릭할 때 모달을 표시합니다.
	button.onclick = function() {
		modal.style.display = "block";
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
				<li><a href="/api/v1/user/recvlist?recv_id=${recv_id}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${recv_id}"
					class="text-info">보낸쪽지함</a></li>
				<%-- 	<li><a href="/api/v1/user/writenote?send_id=${recv_id}" class="text-info">쪽지작성</a></li> --%>

				<li><a href="/api/v1/user/writenote?send_id=${recv_id}"
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
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 container mx-4">
					<br>
					<h4>받은쪽지함</h4>
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 5%; text-align: center;">No.</th>
								<th style="width: 15%; text-align: center;">보낸 사람</th>
								<th style="width: 15%; text-align: center;">받은 사람</th>
								<th style="width: 30%; text-align: center;">내용</th>
								<th style="width: 16%; text-align: center;">시간</th>
								<!--          <th>확인</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noteList}" var="note" varStatus="vs">
								<tr>
									<td style="width: 5%; text-align: center;">${note.note_no}</td>
									<td style="width: 15%; text-align: center;">${note.send_id}</td>
									<td style="width: 15%; text-align: center;">${note.recv_id}</td>
									<td style="width: 30%; text-align: center;"><a href=""
										id="message" data-bs-toggle="modal"
										data-bs-target="#noteModal${vs.index}">${note.message}</a></td>
									<td style="width: 16%; text-align: center;"><fmt:formatDate
											value="${note.rcv_dt}" pattern="yyyy.MM.dd" /></td>
								</tr>

								<!-- Modal -->
								<div class="modal fade" id="noteModal${vs.index}" tabindex="-1"
									aria-labelledby="resultModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5>보낸이 ${note.send_id}</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>${note.message}</p>
											</div>
											<div class="modal-footer">


												<button type="button" class="btn btn-outline-primary"
													onClick="location.href='notereplyform?send_id=${note.send_id}&recv_id=${note.recv_id}'">답장</button>
												<button type="button" class="btn btn-outline-danger"
													onClick="location.href='notedelete?note_No=${note.note_no}'">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</tbody>
					</table>


					<!-- 페이징 처리 -->
					<nav aria-label="Page navigation example" align="center">
						<ul class="pagination justify-content-center">

							<a class="page-link" a href="recvlist?page=1&recv_id=${recv_id}"
								style="text-decoration: none">&laquo;</a>
							<c:if test="${startPage != 1}">
								<a href="recvlist?page=${page}&recv_id=${recv_id}">&laquo;</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item active"><a class="page-link"
									href="recvlist?page=${i}&recv_id=${recv_id}">${i}</a></li>
							</c:forEach>
							<c:if test="${endPage != pageCount}">
								<a class="page-link"
									href="recvlist?page=${page}&recv_id=${recv_id}">&raquo;</a>
							</c:if>
							<a class="page-link"
								href="recvlist?page=${pageCount}&recv_id=${recv_id}"
								style="text-decoration: none">&raquo;</a>
						</ul>
					</nav>
					<!-- </form> -->
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>

</body>
</html>
