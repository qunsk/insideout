<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>취업게시판 삭제</title>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
#formgroup {
	border: none;
	width: 945px;
	margin: 0 auto;
}

#editor {
	/* border: 1px solid; */
	width: 50%;
	margin: 0 auto;
}

#postwrite_menu {
	text-align: center;
}

/* post_container의 너비를 조절합니다. */
#post_container {
	width: 50%;
	margin: 0 auto;
}

/* 로고이미지 */
.image {
	position: relative;
}

/* 로고이미지 내부 글씨 */
.image .img_text {
	position: absolute;
	bottom: 30px;
	left: 100px;
	color: #FFF;
	font-size: 70px;
}

/* 로고이미지 사이즈 조절 */
.local {
	width: 100%;
	height: 400px;
	object-fit: cover;
	object-position: left 0px;
	position: relative;
}

  .button-container button {
    margin-right: 10px;
  }
</style>
</head>

<body>
	<c:if test="${memtype == '0100'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${memtype != '0100'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>
	<div class="form-group image">
		<img class="local" id="main_img" src="/images/Bbanner1.jpg">
		<div class="img_text container" id="img_text">
			<span><p>취업게시판</p></span>
		</div>
	</div>


 <div id="boarddel_wrap">
  <form method="post" action="board_del_ok" 
  onsubmit="return del_check()">
  <input type="hidden" name="post_no" value="${bcont.post_no}" />
  <input type="hidden" name="page" value="${page}" />
  <input type="hidden" name="board_name" value="job" />
  
    <br>
  <br>
   <table id="boarddel_t" align="center">
    <tr>
     <th>
      <h2> 정말 삭제하시겠습니까? </h2>
     </th>
    </tr>
   </table>
   <div id="boarddel_menu" align="center">
    <input type="submit" value="삭제" class="btn btn-success" />
   </div>
  </form>
 </div>
</body>
</html>
