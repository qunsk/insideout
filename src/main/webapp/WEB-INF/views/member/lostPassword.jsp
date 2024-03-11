<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/resetstyle.css?after" />
<script src="./js/member/lostcheck.js"></script>
</head>
<body>
	<form method="post" action="/lost" onsubmit="return check();">
		<input type="hidden" name="mem_type" id="mem_type" value="${mem_type}">
		<div class="form reset">
		<div class="logo">
			<ul class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
			style="color: #F20544; font-size: 35px; font-weight: bold;">
				<li style="list-style-type: none; margin-left:9px;">INSIDEOUT</li>
			</ul>
		</div>
			<div class="form-header">
				<div class="show-signup">
					<a href="/joinSelect"
						style="color: #d2d5d8; text-decoration: none;">Sign Up</a>
				</div>
				<div class="show-signin">
					<a href="/loginForm" style="color: #d2d5d8; text-decoration: none;">Sign
						In</a>
				</div>
				<div class="show-reset">
					<a href="/lostSelect"
						style="color: #F20544; text-decoration: none;">Reset</a>
				</div>
			</div>
			<div class="form-elements">
				<div class="divide">
					<input id="username" name="username" placeholder="학 	번"> 
					<button type="button" class="button" onclick="id_check()">check</button>
				</div>
				<div class="hide">
					<span id="idcheck"></span>
				</div>
				<c:if test="${mem_type == '0100'}">
					<div class="form-element">
						<input id="student_name" name="student_name" placeholder="이  름">
					</div>
					<div class="divide">
						<input id="student_tel" name="student_tel" placeholder="휴대폰 번호"> 
						<button type="button" id="phoneChk">send</button>
					</div>
					<div class="divide">
						<input id="phone_certify" name="phone_certify" placeholder="인증 번호"> 
						<button type="button" id="phoneChk2">check</button> 
					</div>	
					<div class="hide">
						<span class="successPhoneChk" style="color:#ffffff; font-size: 13px;">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
						<input type="hidden" id="phoneDoubleChk" /> 
						<input type="hidden" id="phoneDoubleChk" />
					</div>
				</c:if>
				<c:if test="${mem_type == '0200'}">
					<div class="form-element">
						<input id="staff_name" name="staff_name" placeholder="이  름">
					</div>
					<div class="divide">
						<input id="staff_tel" name="staff_tel" placeholder="휴대폰 번호"> 
						<button type="button" id="phoneChk">send</button>
					</div>
					<div class="divide">
						<input id="phone_certify" name="phone_certify" placeholder="인증 번호"> 
						<button type="button" id="phoneChk2">check</button>
					</div>
					<div class="hide">
						<span class="successPhoneChk" style="color:#ffffff; font-size: 13px;">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
						<input type="hidden" id="phoneDoubleChk" /> 
						<input type="hidden" id="phoneDoubleChk" />
					</div>
				</c:if>
				<div class="form-element">
					<button type="submit">reset</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>