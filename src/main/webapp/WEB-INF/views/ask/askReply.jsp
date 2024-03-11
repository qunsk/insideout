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
</head>
<body>
	<br>
	<h2 style="text-align: center;">문의 답변</h2>
	<br>
	<br>
	<div
		style="text-align: center; margin-left: 400px; margin-right: 400px;">

		<form method="post" action="askViewReply">
			<input type="hidden" name="post_no" value="${post_no}"> <input
				type="hidden" name="board_re_ref" value="${board_re_ref}">

			<%-- <input type="hidden"  name="board_re_ref"  value="${askBoard.board_re_ref}">
			<input type="hidden"  name="up_post_no"  value="${askBoard.up_post_no}"> --%>

			<table class="table table-hover" border=1>
				<tr>
					<td>작성자ID</td>
					<td><input type=text name="writer_id" value="관리자"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>게시글제목</td>
					<td><input type=text name="post_title"></td>
				</tr>
				<tr>
					<td>게시글내용</td>
					<td><textarea rows="10" cols="50" name="post_content"></textarea></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit"
						class="btn btn-outline-success" value="답변"> <input
						type=reset class="btn btn-outline-success" value="취소"> <input
						type=button class="btn btn-outline-success" value="목록"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>