<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>취업</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- 보기 편하게 CSS 추가해주었습니다. -->
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

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous">

</head>
<body>
	<c:import url="../staffHeader.jsp" />
	<div class="form-group image">
		<img class="local" id="main_img" src="/images/Bbanner1.jpg">
		<div class="img_text container" id="img_text">
			<span><p>취업정보</p></span>
		</div>
	</div>

	<form method="post" action="board_write_ok"
		enctype="multipart/form-data">
		<input Type=hidden name=board_name value="job" /> <input Type=hidden
			name=board_no value="200" />

		<div class="form-group" id="formgroup">
			<label class="col-form-label mt-4" for="post_title"></label> <input
				name="post_title" id="post_title" class="form-control" type="text"
				placeholder="제목을 입력하세요"> <label for="formFile"
				class="form-label mt-4"></label> <input name="nFile" id="formFile"
				class="form-control" type="file">
		</div>
		<br>
		<!-- TOAST UI Editor가 들어갈 div태그 -->
		<div id="editor" class="editor-container"></div>
		<!-- !!여기!! 에디터 내용을 받을 input 태그-->
		<textarea name="post_content" id="post_content" style="display: none;"></textarea>
		<!-- !!여기!! HTML 형식의 내용을 받을 input 태그-->
		<input type="hidden" name="htmlPost_content" id="htmlPost_content" />
		<!-- TOAST UI Editor CDN URL(JS) -->
		<script
			src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

		<!-- TOAST UI Editor 생성 JavaScript 코드 -->
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				const editor = new toastui.Editor({
					el : document.querySelector('#editor'),
					height : '400px',
					initialEditType : 'wysiwyg',
					previewStyle : 'vertical',
					language : 'ko-KR'
				});

				const form = document.querySelector('form');
				const postContent = document.querySelector('#post_content');
				const htmlPostContent = document
						.querySelector('#htmlPost_content');

				form.addEventListener('submit', function(event) {
					event.preventDefault();
					const markdownValue = editor.getMarkdown();
					const htmlValue = editor.getHTML();
					postContent.value = markdownValue;
					htmlPostContent.value = htmlValue; // HTML 형식의 내용을 추가
					form.submit();
				});

				// 에디터에서 입력되는 내용을 Markdown 형식으로 받아오기
				editor.on('change', function() {
					const markdownValue = editor.getMarkdown();
					console.log(markdownValue); // Markdown 형식의 입력 내용 출력
				});
				editor.removeToolbarItem('image');
			});
		</script>

		<br>
		<div id="postwrite_menu" class="button-container">
			<input type="submit" value="등록" class="btn btn-success" /> <input
				type="reset" value="취소" class="btn btn-success"
				onclick="$('#post_title').focus();" />
		</div>
	</form>
	<br>
</body>
</html>
