<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css"
	integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK"
	crossorigin="anonymous">

<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">

<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
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

	<div class="container">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#noteModal">비밀번호 업데이트</button>
	</div>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="noteModal" tabindex="-1"
		aria-labelledby="noteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="noteModalLabel">비밀번호 업데이트</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="./PasswordUpdate" method="post" class="form-inline">
						<div class="form-group">
							<label class="sr-only" for="inputPassword">새로운 비밀번호 입력</label> <input
								type="password" name="newPassword" class="form-control"
								id="inputPassword" placeholder="새로운 비밀번호 입력" required>
						</div>
						<button type="submit" class="btn btn-primary">비밀번호 업데이트</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/bootstrap.min.js"
		integrity="sha384-pzjw6/0qNvNgsGze0+vPSAaXMw4lk5ULqAYnfwYIZo2yM8b+VmrEh1c/iKTkS+nu"
		crossorigin="anonymous"></script>

</body>

</html>
