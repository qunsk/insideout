<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
div.container {
	text-align: center;
	margin: 100px auto 0;
}

a {
	display: inline-block;
	background-color: #fff;
	color: #FF0000;
	font-size: 1.5em;
	font-family: Courier, sans-serif;
	padding: 3em; /* 변경: 위아래 패딩을 2em으로 설정 */
	width: 5em; /* 변경: 가로 길이를 4em으로 설정 */
	height: 5em; /* 추가: 세로 길이를 4em으로 설정 */
	text-decoration: none;
	text-transform: uppercase;
	border-radius: 0.5em;
	border-bottom: 0.25em solid #0f5177;
	-moz-transition: 0.1s;
	-webkit-transition: 0.1s;
	transition: 0.1s;
	box-shadow: 0 2px 3px #ccc;
	position: relative;
}

a:hover {
	background-color: #fae8e8;
	border-bottom-width: 0;
	margin-top: 0.2em;
}

a.logout-button {
	text-align: center;
	position: absolute;
	top: 20px;
	right: 20px;
	font-size: 0.8em;
	padding: 0.2em 0.2em;
	height: 30px;
	width: 80px;
	color: black; /* 변경: 글자색을 검은색으로 설정 */
	text-align: center; /* 변경: 가운데 정렬 */
	line-height: 30px; /* 변경: 수직 가운데 정렬 */
}

div
.container
 
a
:not
 
(
:last-child
 
)
{
margin-right
:
 
70
px
; /* 변경: 회원목록과 문의답변 사이 간격 조정 */


}
body {
	background-color: #2c3e50;
}
</style>


</head>
<body>
	<h1 align="center" style="color: #FF0000;">관리자 페이지</h1>
	<div class="container">
		<a href="adminMember"><svg xmlns="http://www.w3.org/2000/svg"
				width="120" height="120" fill="black"
				class="bi bi-person-lines-fill" viewBox="0 0 16 16">
      <path
					d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
    </svg> 회원목록</a> <a href="adminAskList"><svg
				xmlns="http://www.w3.org/2000/svg" width="120" height="120"
				fill="black" class="bi bi-patch-question-fill" viewBox="0 0 16 16">
  <path
					d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zm1.602-2.027c.04-.534.198-.815.846-1.26.674-.475 1.05-1.09 1.05-1.986 0-1.325-.92-2.227-2.262-2.227-1.02 0-1.792.492-2.1 1.29A1.71 1.71 0 0 0 6 5.48c0 .393.203.64.545.64.272 0 .455-.147.564-.51.158-.592.525-.915 1.074-.915.61 0 1.03.446 1.03 1.084 0 .563-.208.885-.822 1.325-.619.433-.926.914-.926 1.64v.111c0 .428.208.745.585.745.336 0 .504-.24.554-.627z" />
</svg> 문의답변</a>
	</div>
	<a href="/logout" class="logout-button">로그아웃</a>

</body>
</html>