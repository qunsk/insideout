<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/templet.css?after" />
<link rel="stylesheet" type="text/css"
	href="/css/member/selectstyle.css?after" />
<script src="/js/member/logincheck.js"></script>
</head>
<body>
	<div class="form signin">
	<div class="logo">
			<ul class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
			style="color: #F20544; font-size: 35px; font-weight: bold;">
				<li style="list-style-type: none; margin-left:9px;">INSIDEOUT</li>
			</ul>
		</div>
		<div class="form-header">
			<div class="show-signin">
				<a href="/joinSelect" style="color: #d2d5d8; text-decoration: none;">Sign In</a>
			</div>
			<div class="show-signup">
				<a href="/loginForm" style="color: #d2d5d8; text-decoration: none;">Sign Up</a>
			</div>
			<div class="show-reset" style="color: #F20544;">Reset</div>
		</div>
		<div class="form-elements">
			<div class="form-select container">
				<div class="square" align="center"
					onclick="window.location.href='/lostPassword?mem_type=0100';">
					<div class="innersize">
						<?xml version="1.0" ?>
						<svg viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
					<rect fill="none" height="256" width="256" />
					<line fill="none" stroke="#000" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="8" x1="32" x2="32" y1="64"
								y2="144" />
					<path d="M54.2,216a88.1,88.1,0,0,1,147.6,0" fill="none"
								stroke="#000" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="8" />
					<polygon fill="none" points="224 64 128 96 32 64 128 32 224 64"
								stroke="#000" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="8" />
					<path d="M169.3,82.2a56,56,0,1,1-82.6,0" fill="none" stroke="#000"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="8" /></svg>
					</div>
					<div align="center">학생</div>
				</div>
				<div class="square" align="center"
					onclick="window.location.href='/lostPassword?mem_type=0200';">
					<div class="innersize">
						<?xml version="1.0" ?>
						<svg data-name="Layer 1" id="Layer_1" viewBox="0 0 512 512"
							xmlns="http://www.w3.org/2000/svg">
				<path
								d="M63.7,366.67a5.1,5.1,0,0,0-5.1,5.1v73.76a5.1,5.1,0,1,0,10.2,0V371.77A5.1,5.1,0,0,0,63.7,366.67Z" />
				<path
								d="M483.74,61.37H39.21a5.1,5.1,0,0,0-5.1,5.1V341.62A80.69,80.69,0,0,0,23.16,382.3v63.23a5.1,5.1,0,0,0,10.2,0V382.3a71.06,71.06,0,0,1,71-71h16.07c41.6,0,53.46,4.13,77.09,12.36L228,334.25a5.1,5.1,0,0,0,5.45-1.38L292,268.58a14.26,14.26,0,0,1,17.73-2.51,14,14,0,0,1,3.45,21.55l-70.5,78.61a17,17,0,0,1-16,5.4l-46.07-14.76a5.09,5.09,0,0,0-6.66,4.85v83.81a5.1,5.1,0,1,0,10.2,0V413.75H483.74a5.1,5.1,0,0,0,5.1-5.1V66.47A5.1,5.1,0,0,0,483.74,61.37ZM119.67,300.53a46,46,0,1,1,46-46A46,46,0,0,1,119.67,300.53Zm359,103H184.21V368.71l39.88,12.76a27.4,27.4,0,0,0,26.2-8.43l70.5-78.61A24.26,24.26,0,0,0,314.5,257a24.39,24.39,0,0,0-30,4.68l-56.34,61.81-27.28-9.47c-17.52-6.1-29.29-10.2-51.32-11.95a56.17,56.17,0,1,0-59.34.25A81.13,81.13,0,0,0,44.31,327.7V71.57H478.64Z" />
				<path
								d="M197.31,124.91H420.88a5.1,5.1,0,1,0,0-10.2H197.31a5.1,5.1,0,1,0,0,10.2Z" />
				<path
								d="M420.88,165.58H378.27a5.1,5.1,0,1,0,0,10.2h42.61a5.1,5.1,0,1,0,0-10.2Z" />
				<path
								d="M197.31,175.78H326.83a5.1,5.1,0,1,0,0-10.2H197.31a5.1,5.1,0,0,0,0,10.2Z" />
				<path
								d="M420.88,216.45H337.31a5.1,5.1,0,0,0,0,10.2h83.57a5.1,5.1,0,1,0,0-10.2Z" />
				<path
								d="M197.31,226.65h43.81a5.1,5.1,0,0,0,0-10.2H197.31a5.1,5.1,0,0,0,0,10.2Z" /></svg>
					</div>
					<div align="center">교수/직원</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

