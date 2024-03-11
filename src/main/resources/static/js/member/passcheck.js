var pwdRule = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{1,16}).{8,16}$/; // 비밀번호

function check() {
	if ($.trim($("#password").val()) == "") {
		alert("변경할 비밀번호를 입력하세요.");
		$("#password").focus();
		return false;
	}
	if (!pwdRule.test($("#password").val())) {
		alert("비밀번호는 영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정하세요.");
		$("#password").val("").focus();
		return false;
	}
}

$(document).ready(function() {
	// 비밀번호 정규식 확인
	$("#alert_ruleS").hide();
	$("#alert_ruleF").hide();
	$("input").keyup(function() {
		var passwd = $("#password").val();
		if (passwd != "") {
			if (pwdRule.test(passwd)) {
				$("#alert_ruleS").show();
				$("#alert_ruleF").hide();
			} else {
				$("#alert_ruleF").show();
				$("#alert_ruleS").hide();
			}
		}
	});

});