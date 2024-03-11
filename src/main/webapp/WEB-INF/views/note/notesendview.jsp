<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<table class="table" align=center width=600 border=1>
		<tr>
			<td width=100 align=center>보낸 이</td>
			<td>${send_id}</td>
		</tr>

		<tr>
			<td height=200 align=center>내용</td>
			<td>${message}</td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="button" value="답장하기"
				onclick="location.href='notereplyform?send_id=${send.send_id}
				&recv_id=${send.recv_id}&note_No=${note.note_no}'">
				<input type="button" value="삭제하기"
				onclick="location.href='notedelete?note_No=${note.note_no}'">



			</td>
		</tr>
	</table>

</body>
</html>