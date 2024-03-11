<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Header</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">

<style>
.navbar-nav .nav-link {
	color: #fff; /* 링크 글씨 색상 */
	font-size: 18px; /* 글자 크기 */
}

.navbar-nav .nav-link.active {
	color: #fff; /* 활성 링크 글씨 색상 */
}

.navbar-nav .nav-item.logout a {
	color: #fff; /* 로그아웃 링크 글씨 색상 */
}

.navbar {
	height: 100px; /* 해더의 높이 */
}

.navbar-nav




.nav-link




:not




(
:last-child




)
{
margin-right


:


20
px
; /* 메뉴 간격 조정 */




}
.navbar-nav .nav-link:hover {
	color: #ffc107 !important; /* 호버 시 글씨 색상을 노란색으로 설정 */
}

.navbar-nav .nav-item.logout a:hover {
	color: #ffc107 !important; /* 호버 시 로그아웃 링크의 글씨 색상을 노란색으로 설정 */
}
</style>

</head>
<body>
	<!-- <div class="container">
		<header
			class="d-flex flex-wrap justify-content-md-between py-3 border-bottom">
			<a href="/"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			</a>
			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="/api/v1/student/StudentList"
					class="nav-link px-2 link-dark">마이페이지</a></li>
				<li><a href="/api/v1/student/counselType"
					class="nav-link px-2 link-dark">상담예약</a></li>
				<li><a href="/api/v1/user/job_list"
					class="nav-link px-2 link-dark">취업정보</a></li>
				<li><a href="/api/v1/user/notice_list"
					class="nav-link px-2 link-dark">공지사항</a></li>
				<li><a href="/api/v1/user/QnA_list"
					class="nav-link px-2 link-dark">QnA</a></li>
			</ul>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0">
				<li><a href="/logout" class="nav-link px-2 link-dark">로그아웃</a></li>
			</ul>
		</header>
	</div> -->
	<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="">InsideOut</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor02"
				aria-controls="navbarColor02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link active"
						href="/api/v1/student/StudentList">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" 
						href="/api/v1/student/counselType">상담예약</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/api/v1/user/job_list">취업정보</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/api/v1/user/notice_list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/api/v1/user/QnA_list">Q&A</a></li>
				</ul>
				<ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0">
					<li class="nav-item"><a href="/logout" class="nav-link active">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>