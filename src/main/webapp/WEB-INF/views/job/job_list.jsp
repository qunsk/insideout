<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>취업 게시판 목록</title>
<link rel="stylesheet" href="./css/bbs.css" type="text/css">
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 20%;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

#joblist_wrap {
	margin-top: 2rem; /* 원하는 간격 값으로 수정하세요 */
}

#joblist_c {
	margin-bottom: 2rem; /* 버튼과 리스트 사이의 간격을 조정합니다. */
}

#formgroup {
	border: none;
	width: 945px;
	margin: 0 auto;
}

#editor {
	/* border: 1px solid; */
	width: 50%;
	margin: 0 auto;
}

#postwrite_menu {
	text-align: center;
}

/* post_container의 너비를 조절합니다. */
#post_container {
	width: 50%;
	margin: 0 auto;
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
	font-size: 70px;
}

/* 로고이미지 사이즈 조절 */
.local {
	width: 100%;
	height: 400px;
	object-fit: cover;
	object-position: left 0px;
	position: relative;
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
	<div class="form-group image">
		<img class="local" id="main_img" src="/images/Bbanner1.jpg">
		<div class="img_text container" id="img_text">
			<span><p>취업정보</p></span>
		</div>
	</div>
	<div id="joblist_wrap">
		<div class="container">
			<input Type=hidden name=board_name value="job" />
			<c:if test="${memtype != '0100'}">
				<div id="joblist_c">
					<button type="button" value="글쓰기" class="btn btn-outline-warning"
						onclick="location='/api/v1/staff/board_write?page=${page}&board_name=job'">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  <path
								d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
</svg>
						글쓰기
					</button>
				</div>
			</c:if>

			<table class="table table-hover" id="joblist_t">
				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
						height="26">
						<div align="center">번호</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="47%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
						<div align="center">작성자</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
						<div align="center">날짜</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
						<div align="center">조회수</div>
					</td>
				</tr>

				<!-- 화면 출력 번호  변수 정의 -->
				<c:set var="num" value="${joblistcount-(page-1)*10}" />

				<!-- 반복문 시작 -->
				<c:forEach var="b" items="${joblist}">

					<tr align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''">
						<td height="23" style="font-family: Tahoma; font-size: 10pt;">
							<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
								value="${num-1}" />
						</td>

						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="left">

								<!-- 제목 출력 부분 -->
								<a
									href="board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=job">
									${b.post_title} </a>
								<%-- 시큐리티 머지하고 쓸것
					<a href="<sec:authorize access="hasAnyRole('ROLE_STAFF','ROLE_ADMIN')">staff/</sec:authorize>board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=job">
							 --%>
							</div>
						</td>

						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">${b.writer_id}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">
								<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">${b.post_readcount}</div>
						</td>
					</tr>

				</c:forEach>
				<!-- 반복문 끝 -->
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
								<li class="page-item active"><span class="page-link">${loop.index}</span></li>
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
	</div>
</body>
</html>