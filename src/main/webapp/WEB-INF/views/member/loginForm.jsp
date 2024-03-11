<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.js?after"></script>
<link rel="stylesheet" type="text/css" href="/css/member/templet.css?after" />
<style type="text/css">
.form .logo{
	color: #ffffff;
}
</style>
<script src="/js/member/logincheck.js"></script>
</head>
<body>
	<div class="form signup">
	<div class="logo">
		<ul class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
			style="color: #F20544; font-size: 35px; font-weight: bold;">
			<li style="list-style-type: none; margin-left:9px;">INSIDEOUT</li>
		</ul>
	</div>
		<form action="/login" method="post" onsubmit="return check()">
			<div class="form-header">
				<div class="show-signin"><a href="/joinSelect" style="color: #d2d5d8; text-decoration: none;">Sign In</a></div>
				<div class="show-signup">Sign Up</div>
				<div class="show-reset"><a href="/lostSelect" style="color: #d2d5d8; text-decoration: none;">Reset</a></div>
			</div>
			<div class="arrow"></div>
			<div class="form-elements">
				<div class="form-element">
					<input type="text" id="username" name="username" placeholder="학 번">
				</div>
				<div class="form-element">
					<input type="password" id="password" name="password" placeholder="비밀 번호">
				</div>
				<div class="form-element">
					<button type="submit" id="submit-btn">Sign Up</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>