<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>
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
<body>

	<%-- <c:if test="${role == 'ROLE_STUDENT'}"> --%>
	<c:import url="../studentHeader.jsp" />
	<%-- 	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if> --%>


	<div class="container">

		<form action="/api/v1/student/updateStudent" method="POST">
			<div class="form-group">

				<h1 class="text-primary">학생 정보 수정</h1>
				<br> <input type="hidden" name="student_no"
					value="${student.student_no}">
				<div class="form-group">

					<label for="studentName">이름:</label> <input type="text"
						id="studentName" name="student_name"
						value="${student.student_name}" class="form-control" required><br>
				</div>

				<div class="form-group">
					<label for="studentTel">전화번호:</label> <input type="text"
						id="studentTel" name="student_tel" class="form-control"
						value="${student.student_tel}" required><br>
				</div>

				<div class="form-group">
					<label for="studentEmail">이메일:</label> <input type="email"
						id="studentEmail" name="student_email" class="form-control"
						value="${student.student_email}" required><br>
				</div>


				<input type="submit" name="submit" class="btn btn-primary"
					value="수정">
		</form>
	</div>


</body>
</html>