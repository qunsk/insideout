<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
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
</head>
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
					<div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>연도</th>
									<th>평점</th>
								</tr>
							</thead>
							<tbody id="table-body">
								<c:forEach items="${staticList}" var="list" varStatus="vs">
									<tr>
										<th>${no}</th>
										<td>${list.year}</td>
										<td><a href="" id="total" data-bs-toggle="modal"
											data-bs-target="#resultModal${vs.index}">★
												${list.total/5} </a></td>
									</tr>
									<c:set var="no" value="${no-1}"></c:set>

									<!-- Modal -->
									<div class="modal fade" id="resultModal${vs.index}"
										tabindex="-1" aria-labelledby="resultModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header border-bottom-0">
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body py-0">${list.answer_subj}</div>
												<div class="modal-footer border-top-0">
													<button type="button" class="btn btn-primary"
														data-bs-dismiss="modal">확인</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="page d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${listcount > 0}">
									<c:if test="${startpage > 10}">
										<li class="page-item"><a class="page-link"
											href="surveyList?page=${startpage-10}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<li class="page-item"><a class="page-link"
											href="surveyList?page=${a}">${a}</a></li>
									</c:forEach>

									<c:if test="${endpage < maxpage}">
										<li class="page-item"><a class="page-link"
											href="surveyList?page=${startpage+10}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
</body>
</html>