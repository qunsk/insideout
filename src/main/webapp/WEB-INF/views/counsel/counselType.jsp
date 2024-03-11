<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"
	integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm"
	crossorigin="anonymous">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">
</head>
<style>
.btn {
	margin-right: 0.7%;
	margin-bottom: 2%;
	align-items: center;
	justify-content: center;
	width: 24%;
	height: 350px;
}

.button {
	/* align-items: center; */
	/* justify-content: center; */
	display: /* margin-top: 70px; */
	/* height: 100vh; */
}

.button h3 {
	color: #fff;
}

td {
	display: table-cell;
	vertical-align: inherit;
	width: 30%;
}

td.title {
	display: table-cell;
	vertical-align: inherit;
	width: 85%;
}

.container-lg {
	max-width: 80%;
	align-items: center;
	justify-content: center;
}

/* 로고이미지 */
.image {
	position: relative;
}

/* 로고이미지 내부 글씨 */
.image .img_text {
	position: absolute;
	bottom: 30px;
	left: 100px;
	color: #FFF;
	font-size: 80px;
}

/* 로고이미지 사이즈 조절 */
.local {
	width: 100%;
	height: 500px;
	object-fit: cover;
	object-position: left 0px;
	/* position: relative; */
}

.text-dark {
    --bs-text-opacity: 1;
    color: black;
}
</style>
<body>
	<c:import url="../studentHeader.jsp" />
	<div class="form-group image">
		<img class="local" id="main_img" src="/images/box4_4.jpeg">
		<div class="img_text container" id="img_text">
			<span><p>인사이드 아웃이 함께합니다.</p></span> <span><h5
					style="color: #fff; font-size: 24px;">인사이드 아웃은 성장과 소통 실천을 통한 자아실현을 교육이념으로하는 대학교 상담센터입니다.
본 센터에서는 교수진을 비롯한 각 분야의 상담전문가가 개인의 성장과 회복을 돕는 상담서비스를 제공합니다.</h5></span>
		</div>
	</div>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<!-- <div class="col-lg-2 container"></div> -->
			<input type="hidden" id="student_no" name="student_no"
				value="${student_no}">
			<!-- <h3 class="card-header">상담예약</h3> -->
			
			<div class="col-lg-8 container">
				<h3>상담예약</h3>
				<div class="d-grid gap-2">
					<div class="button" align="center">
						<button class="btn btn-success" type="button"
							name="counsel_typeno"
							onclick="location.href='counselBooking?counsel_typeno=0101'">
							<img src="/images/people-fill.svg" width="100px">
							<h3>대학생활</h3>
						</button>
						<button class="btn btn-info" type="button" name="counsel_typeno"
							onclick="location.href='counselBooking?counsel_typeno=0102'">
							<img src="/images/briefcase-fill.svg" width="100px">
							<h3>취업/진로</h3>
						</button>
						<button class="btn btn-warning" type="button"
							name="counsel_typeno"
							onclick="location.href='counselBooking?counsel_typeno=0103'">
							<img src="/images/mortarboard-fill.svg" width="100px">
							<h3>학사</h3>
						</button>
						<button class="btn btn-danger" type="button" name="counsel_typeno"
							onclick="location.href='counselBooking?counsel_typeno=0104'">
							<img src="/images/person-check-fill.svg" width="100px">
							<h3>개인고민</h3>
						</button>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-md-6">
						<h3 class="card-header">공지사항</h3>
						<ul class="list-group list-group-flush">
							<c:forEach var="b" items="${noticelist}" varStatus="loop">
								<c:if test="${loop.index < 5}">
									<li class="list-group-item">
										<table style="margin-bottom: 0;">
											<tr>
												<td class="title"><a
													href="${pageContext.request.contextPath}/api/v1/user/board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=notice">
														${b.post_title} </a></td>
												<%-- <td>
											<div>${b.writer_id}</div>
										</td> --%>
												<td>
													<div>
														<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd" />
													</div>
												</td>
											</tr>
										</table>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<div class="col-md-6">
						<h3 class="card-header">취업정보</h3>
						<ul class="list-group list-group-flush">
							<c:forEach var="b" items="${joblist}" varStatus="loop">
								<c:if test="${loop.index < 5}">
									<li class="list-group-item">
										<table style="margin-bottom: 0;">
											<tr>
												<td class="title"><a
													href="${pageContext.request.contextPath}/api/v1/user/board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=job">
														${b.post_title} </a></td>
												<%-- <td>
											<div>${b.writer_id}</div>
										</td> --%>
												<td>
													<div>
														<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd" />
													</div>
												</td>
											</tr>
										</table>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- <div class="col-lg-2 container"></div> -->
		</div>

	</div>
</body>
</html>