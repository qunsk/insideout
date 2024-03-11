function check(){
	 if($.trim($("#username").val())==""){
		 alert("학번을 입력하세요");
		 $("#username").focus();
		 return false;
	 }
	 if($.trim($("#password").val())==""){
		 alert("비밀번호를 입력하세요");
		 $("#password").focus();
		 return false;
	 }
}