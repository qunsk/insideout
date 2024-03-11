<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/jointemplet.css?after" />
<script src="/js/member/joincheck.js"></script>
</head>
<body>

	<form action="/join" method="post" onsubmit="return check();">
		<input type="hidden" name="mem_type" id="mem_type" value="${mem_type}">
		<div class="form signin">
		<div class="logo">
			<ul class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
			style="color: #F20544; font-size: 35px; font-weight: bold;">
				<li style="list-style-type: none; margin-left:9px;">INSIDEOUT</li>
			</ul>
		</div>
			<div class="form-header">
				<div class="show-signin"><a href="/joinSelect" style="color: #F20544; text-decoration: none;">Sign In</a></div>
				<div class="show-signup"><a href="/loginForm" style="color: #d2d5d8; text-decoration: none;">Sign Up</a></div>
				<div class="show-reset"><a href="/lostSelect" style="color: #d2d5d8; text-decoration: none;">Reset</a></div>
			</div>
			<c:if test="${mem_type == '0100'}">
				<div class="arrow"></div>
			</c:if>
			<div class="form-elements">
				<c:if test="${mem_type == '0100'}">
					<input type="hidden" name="dept_type" value="학과">
				</c:if>
				<c:if test="${mem_type == '0200'}">
					<div class="radiobutton">
						<input type="radio" id="dept_type1" name="dept_type" style="color: #ffffff;" value="학과">학과 
						<input type="radio" id="dept_type2" name="dept_type" style="color: #ffffff;" value="부서">부서
					</div>
				</c:if>
				<c:if test="${mem_type == '0100'}">
					<div class="divide">
						<input type="text" id="username" name="username" placeholder="학 번"> 
						<button type="button" class="button" onclick="id_check()">check</button>
					</div>
					<div class="hide">
						<span id="idcheck" style="font-size: 12px;"></span>
					</div>
				</c:if>
				<c:if test="${mem_type == '0200'}">
					<div class="divide">
						<input type="text" id="username" name="username" placeholder="교직원 번호">
						<button  type="button" class="button" onclick="id_check()">check</button>
					</div>
					<div class="hide">
						<span id="idcheck" style="font-size: 12px;"></span>
					</div>
				</c:if>
				<div class="form-element">
					<input type="password" id="password" name="password" placeholder="비밀 번호">
				</div>
				<div class="hide">
					<span id="alert_ruleS" style="color: green; font-size: 12px;">&nbsp;&nbsp;사용 가능한 비밀번호 입니다.</span>
					<span id="alert_ruleF" style="color: red; font-size: 12px;">&nbsp;&nbsp;영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함  &nbsp;&nbsp;8~16자</span>
				</div>
				<div class="form-element">
					<input type="password" id="password2" name="password2" placeholder="비밀 번호 확인"><br>
				</div>
				<div class="hide">
					<span id="alert_success" style="color: green; font-size: 12px;">&nbsp;&nbsp;비밀번호가 일치합니다.</span>
					<span id="alert_fail" style="color: red; font-size: 12px;">&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</span>
				</div>
				<c:if test="${mem_type == '0100'}">
					<div class="form-element">
						<input type="text" id="student_name" name="student_name" placeholder="이 름">
					</div>
					<div class="divide">
						<input type="text" id="student_tel" class="divide" name="student_tel" placeholder="휴대폰 번호"> 
						<button type="button" id="phoneChk">send</button>
					</div>
					<div class="divide">					
						<input id="phone_certify" name="phone_certify" placeholder="인증 번호">
						<button type="button" id="phoneChk2" >check</button>
					</div>
					<div>
						<span class="successPhoneChk" style="color: #ffffff; font-size: 13px;">&nbsp;&nbsp;휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
						<input type="hidden" id="phoneDoubleChk" />
					</div>
					<div class="form-element">
						<input type="text" id="student_email" name="student_email" placeholder="이메일">
					</div>
					<!-- 여기랑 -->
					<div class="form-element" id="deptselect">
						<select name="dept_name" id="dept_name">
							<option value="" disabled="disabled" selected="selected">학과 선택</option>
							<option value="경영학과">경영학과</option>
							<option value="경제학과">경제학과</option>
							<option value="컴퓨터공학과">컴퓨터공학과</option>
							<option value="기계과">기계과</option>
							<option value="메카트로닉스과">메카트로닉스과</option>
						</select>
					</div>
				</c:if>
				<c:if test="${mem_type == '0200'}">
					<div class="form-element">
						<input type="text" id="staff_name" name="staff_name" placeholder="이 름">
					</div>
					<div class="divide">
						<input type="text" id="staff_tel" name="staff_tel" placeholder="휴대폰 번호"> 
						<button type="button" class="dividetwo" id="phoneChk">send</button>
					</div>					
					<div class="divide">
						<input id="phone_certify" name="phone_certify" placeholder="인증 번호"> 
						<button type="button" id="phoneChk2">check</button>
					</div>
					<div class="hide">
						<span class="successPhoneChk" style="color: #ffffff; font-size: 13px;">&nbsp;&nbsp;휴대폰 번호는 '-' 없이 번호만 입력하세요.</span>
						<input type="hidden" id="phoneDoubleChk" /> 
						<input type="hidden" id="phoneDoubleChk" />
					</div>
					<div class="form-element">
						<input type="email" id="staff_email" name="staff_email" placeholder="이메일">
					</div>
					<div class="form-element">
						<select name="dept_name" id="dept_name2">
							<option value="" disabled="disabled" selected="selected">학과 선택</option>
							<option value="경영학과">경영학과</option>
							<option value="경제학과">경제학과</option>
							<option value="컴퓨터공학과">컴퓨터공학과</option>
							<option value="기계과">기계과</option>
							<option value="메카트로닉스과">메카트로닉스과</option>
						</select> 
					<!-- </div>
					<div class="form-element"> -->
						<select name="dept_name" id="dept_name3">
							<option value="" disabled="disabled" selected="selected">부서
								선택</option>
							<option value="학생상담센터">학생상담센터</option>
							<option value="학사과">학사과</option>
						</select>
					</div>
				</c:if>
				<button type="submit" id="submit-btn" class="send">회원가입</button>
				<button type="button" id="submit-btn" class="send" onclick="history.go(-1)">취소</button>
			</div>
		</div>
	</form>
</body>
</html>