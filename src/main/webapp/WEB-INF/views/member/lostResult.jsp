<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/lostpass.css?after" />
<script src="/js/member/passcheck.js"></script>
</head>
<body>
	<form method="post" action="/reset" onsubmit="return check();">
		<div class="form reset">
			<div class="logo">
				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
					style="color: #F20544; font-size: 35px; font-weight: bold;">
					<li style="list-style-type: none; margin-left: 9px;">INSIDEOUT</li>
				</ul>
			</div>
			<div class="form-header">
				<div class="show-signup">Sign Up</div>
				<div class="show-signin">Sign In</div>
				<div class="show-reset">Reset</div>
			</div>
			<div class="arrow"></div>
			<div class="form-elements">
				<input type="hidden" name="username" value="${username}"
					placeholder="학 번">
				<div class="form-element">
					<input type="password" id="password" name="password"
						placeholder="변경할 비밀번호">
				</div>
				<div class="hide">
					<span id="alert_ruleS" style="color: green;">사용 가능한 비밀번호
						입니다.</span> <span id="alert_ruleF" style="color: red;">영문자, 숫자,
						특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정</span>
				</div>
				<div class="form-element">
					<button type="submit" id="submit-btn">Reset</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>