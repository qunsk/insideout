<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>

<style>
a.main-button {
	text-align: center;
	position: absolute;
	top: 20px;
	right: 20px;
	font-size: 0.8em;
	padding: 0.5em 0.5em;
	width: 120px;
}
</style>

</head>
<body>
	<a href="adminMain" class="btn btn-outline-success main-button">관리자
		메인</a>


	<section id=content>
		<div>&nbsp;</div>
		<div id=title align="center">
			<h2>일대일문의</h2>
			<br>
			<br>
		</div>
		<div
			style="text-align: center; margin-left: 100px; margin-right: 100px;">
			<table class="table table-hover" border="1" width="800">
				<tr>

					<td>작성자ID</td>
					<td>게시글제목</td>
					<td>작성일자</td>

				</tr>

				<c:forEach var="msg" items="${askBoardList }">
					<tr>
						<td>${msg.writer_id }</td>
						<td><c:if test="${msg.up_post_no != 0 }">
						[ ↳ ]
					</c:if> <a
							href="/api/v1/user/askView?post_no=${msg.post_no}&board_re_ref=${msg.board_re_ref}">${msg.post_title}</a>

						</td>
						<td><fmt:formatDate value="${msg.post_dt }"
								pattern="yyyy-MM-dd" /></td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
</body>
</html>