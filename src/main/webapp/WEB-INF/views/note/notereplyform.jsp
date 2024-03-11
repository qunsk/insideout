<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">


<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
	margin-top: 4rem; /* Adjust the top margin if needed */
	padding-right: 0; /* Remove right padding */
	padding-left: 0; /* Remove left padding */
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}

.bd-sidebar .nav>li>a.text-info {
	color: #28a745; /* Change text color to green */
}

/* Increase the vertical spacing */
.bd-sidebar {
	margin-top: 1rem;
}

.container {
	margin-top: 2rem; /* Increase container spacing */
	margin-left: 0;
	margin-right: 0;
}

.row .col-3 .nav>li>a:hover {
	text-decoration: none;
	color: #D3D3D3;
	background-color: #D3D3D3; /* Add background color for hover effect */
}
</style>


<!-- <style>
 .container-fluid {
	width: 1000px !important;
}
.bd-navbar {
    position: sticky;
    top: 0;
    z-index: 1071;
    min-height: 4rem;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0 rgba(0, 0, 0, .1);
}

.bd-sidebar {
    position: sticky;
    z-index: 1000;
    background: #fff;
    border-right: 1px solid rgba(0, 0, 0, .1);
    overflow-y: auto;
    min-width: 160px;
    max-width: 25% !important;
}

.bd-sidebar .nav {
    display: block;
    margin: 20px auto;
}

.bd-sidebar .nav>li>a {
    display: block;
    padding: 1rem 1.5rem;
    font-size: 110%;
    text-decoration: none;
    color: navy;
    font-weight: bold;
}
</style> -->
<style>
.container {
	margin-top: 20px;
}

.note-form-container {
	max-width: 500px;
	margin: 0 auto;
}

.note-form {
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
}

.note-form label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

.note-form input[type="text"], .note-form textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
}

/* .note-form button {
    display: block;
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    background-color: #673ab7 !important;
    /* 연보라색(Deep Purple) */
color


:

 

white


;
border


:

 

none


;
cursor


:

 

pointer


;
text-align


:

 

right


;
/* 버튼을 오른쪽으로 정렬 */
}
.note-form button:hover {
	background-color: #5e35b1 !important;
	/* 연보라색의 더 진한 버전 */
}

.note-form button:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

* /

.note-form textarea {
	margin-bottom: 10px;
	/* 쪽지 내용과의 간격 추가 */
}
</style>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#recv_id").val() == "") {
				alert("받는 사람ID를 입력하세요.");
				$("#recv_id").focus();
				return false;
			}
			if ($("#message").val() == "") {
				alert("쪽지 내용을 입력하세요.");
				$("#message").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>


	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<li><a href="/api/v1/staff/StaffList" class="text-info">상담
						내역</a></li>
				<li><a href="/api/v1/staff/surveyList" class="text-info">만족도
						조사</a></li>
				<li><a href="#" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${staff_no}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${staff_no}"
					class="text-info" data-bs-toggle="modal"
					data-bs-target="#wnoteModal">쪽지작성</a></li>
				<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
						수정</a></li>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info"
					data-bs-toggle="modal" data-bs-target="#noteModal">비밀번호 수정</a></li>
			</ul>
		</div>


		<!-- <div class="container note-form-container" style="width:90%; margin:0 auto;"> -->
		<!--   <form id="snote" method="post"  action="sendnote"> -->
		<div class="container" style="max-width: 1000px;">
			<form class="note-form" id="snote" method="post" action="notereply">

				<input type="hidden" name="send_id" value="${note.send_id}">
				<input type="hidden" name="recv_id" value="${note.recv_id}">
				<!--   <label for="recv_id">받는 사람:</label>
                <input type="text" id="recv_id" name="recv_id">
                    <label for="recv_id">보내는 사람:</label>
                <input type="text" id="send_id" name="send_id"> -->
				<br>

				<div class="form-group">
					<label for="message">쪽지 내용:</label> <br>
					<textarea class="form-control" id="message" cols="100" rows="10"
						name="message"></textarea>
				</div>
				<!--    <button type="submit" id="sendmsg" class="btn btn-info btn-sm">보내기</button> -->
				<br>
				<div class="d-grid gap-2">
					<button class="btn btn-lg btn-primary" type="submit" id="sendmsg"
						class="btn btn-info btn-sm">보내기</button>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" onclick="modal.style.display = 'none';"></button>

			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>





















<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function send() {
	/* 	if ($("#nsubject").val() == "") {
			alert("제목을 입력하세요");
			$("#msubject").focus();
			return false;
		} */
		if ($("#message").val() == "") {
			alert("내용을 입력하세요");
			$("#message").focus();
			return false;
		}
		//	});	
	/* 	document.myform.action = "/notereply";
		document.myform.submit(); */
//		self.close();
	}
</script>
</head>
<body>

<div class="container" style="width:90%; margin:0 auto;">
  <form id="snote" method="post"  action="sendnote">
    <input type="hidden" name="send_id" value="${sessionScope.send_id}">
           받는 사람: <input type="text" id="recv_id" name="recv_id">
    <div class="form-group">
      <textarea class="form-control" id="message" cols="100" rows="10" name="message"></textarea>
    </div>
    <input type="submit" id=sendreply class="btn btn-info btn-sm" value="답장" style="font-size:1.6rem;">
  </form>
</div>  



</body>
</html> --%>