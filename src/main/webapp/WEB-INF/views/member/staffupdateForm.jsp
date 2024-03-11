<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 정보 수정</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css"
	integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK"
	crossorigin="anonymous">
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	 crossorigin="anonymous"> -->
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
	<c:import url="../staffHeader.jsp" />
	<div class="container">
		<form action="/api/v1/staff/updateStaff" method="POST">
			<div class="form-group">

				<h1 class="text-primary">교직원 정보 수정</h1>
				<br> <input type="hidden" name="staff_no"
					value="${staff.staff_no}">
				<!-- 수정이 필요한 부분 -->
				<div class="form-group">

					<label for="staffName">이름:</label> <input type="text"
						id="staffName" name="staff_name" value="${staff.staff_name}"
						class="form-control" required><br>
				</div>

				<div class="form-group">
					<label for="staffTel">전화번호:</label> <input type="text"
						id="staffTel" name="staff_tel" class="form-control"
						value="${staff.staff_tel}" required><br>
				</div>

				<div class="form-group">
					<label for="staffEmail">이메일:</label> <input type="email"
						id="staffEmail" name="staff_email" class="form-control"
						value="${staff.staff_email}" required><br>
				</div>


				<input type="submit" name="submit" class="btn btn-primary"
					value="수정">
		</form>
	</div>
</body>
</html>
