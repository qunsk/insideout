<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
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
			<span><p>공지사항</p></span>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="form-group row">
			<label for="post_title" class="col-sm-2 col-form-label">제목: </label>
			<div class="col-sm-4">
				<input type="text" id="post_title" name="post_title"
					value="${bcont.post_title}" readonly class="form-control-plaintext">
			</div>
		</div>
		<div class="form-group row">
			<label for="writer_id" class="col-sm-2 col-form-label">작성자: </label>
			<div class="col-sm-4">
				<input type="text" id="writer_id" name="writer_id"
					value="${bcont.writer_id}" readonly class="form-control-plaintext">
			</div>
			<label for="post_readcount" class="col-sm-2 col-form-label">조회수:
			</label>
			<div class="col-sm-4">
				<input type="text" id="post_readcount" name="post_readcount"
					value="${bcont.post_readcount}" readonly
					class="form-control-plaintext">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-4">
				<c:if test="${!empty bcont.save_file_nm }">
					<label for="nFile" class="col-sm-2 col-form-label">첨부파일: </label>
					<img src="./upload/${bcont.save_file_nm }" width="200" height="100">
				</c:if>
			</div>
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleFormControlTextarea1"></label>
			${bcont.htmlPost_content}
		</div>
		<br>
		<div id="boardcont_menu"
			style="display: flex; justify-content: center"
			; class="button-container">
			<button type="button" class="btn btn-success"
				onclick="location='notice_list?page=${page}&board_name=notice'">목록</button>
			<c:if test="${memtype != '0100'}">
				<button type="button" class="btn btn-success"
					onclick="location='/api/v1/staff/board_cont?post_no=${bcont.post_no}&page=${page}&state=edit&board_name=notice'">수정</button>
				<button type="button" class="btn btn-success"
					onclick="location='/api/v1/staff/board_cont?post_no=${bcont.post_no}&page=${page}&state=del&board_name=notice'">삭제</button>
			</c:if>
		</div>

	</div>
	<br>
	<br>
</body>
</html>