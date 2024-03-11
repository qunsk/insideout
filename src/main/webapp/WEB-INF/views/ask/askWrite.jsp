<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의글 작성</title>
</head>
<body>

	<div align="center">

		<form method="post" action="ask_write_ok">
			<table id=table2 border=1>
				<tr>
					<td>제목</td>
					<td><input type=text name="post_title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="50" name="post_content"></textarea></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="작성">
						<input type=reset value="취소"> <input type=button
						value="목록"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>