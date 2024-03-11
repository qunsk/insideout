var idDuplChk = false; // 아이디 중복 체크 버튼
var phoneBtnChk = false; // 인증번호 전송 여부 체크 변수
var certifyBtnChk = false; // 인증하기버튼 안눌렀을 때 막을 변수
var phoneCertifyChk = false; // 인증번호 일치여부 체크 변수
var idRule = /^[0-9]+$/;
var pwdRule = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{1,16}).{8,16}$/; // 비밀번호
// 정규식

function check() {
	
	if ($.trim($("#username").val()) == "") {
		alert("학번을 입력하세요.");
		$("#username").focus();
		return false;
	}
	if (idDuplChk == false) {
		alert("학번 중복확인을 눌러주세요.");
		$("#username").focus();
		return false;
	}
	if ($.trim($("#username").val()).length !== 9) {
		alert("학번은 9자이어야 합니다.")
		$("#username").focus();
		return false;
	}
	if (!idRule.test($("#username").val())) {
		alert("학번은 숫자만 사용 가능 합니다.")
		$("#username").focus();
		return false;
	}
	if ($.trim($("#password").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#password").val("").focus();
		return false;
	}
	if ($.trim($("#password2").val()) == "") {
		alert("비밀번호 확인을 입력하세요.");
		$("#password2").val("").focus();
		return false;
	}
	if (!pwdRule.test($("#password").val())) {
		alert("비밀번호는 영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정하세요.");
		$("#password").val("").focus();
		return false;
	}
	if ($.trim($("#password").val()) != $.trim($("#password2").val())) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#password").val("");
		$("#password2").val("");
		$("#password").focus();
		return false;
	}
	if ($("#mem_type").val() == "0200") {
		if ($('input[type=radio][name="dept_type"]:checked').val() == ""){
			alert("학과 또는 부서를 선택하세요.");
			$("#dept_type").val("").focus();
			return false;
		}
	}
	console.log($("#mem_type").val());
	if ($("#mem_type").val() == "0100") {
		// 학생 이름
		if ($.trim($("#student_name").val()) == "") {
			alert("학생 이름을 입력하세요.");
			$("#student_name").val("").focus();
			return false;
		}
	} else {
		// 교직원 이름
		if ($.trim($("#staff_name").val()) == "") {
			alert("교직원 이름을 입력하세요.");
			$("#staff_name").val("").focus();
			return false;
		}
	}
	if ($("#mem_type").val() == "0100") {
		// 학생 번호
		if ($.trim($("#student_tel").val()) == "") {
			alert("휴대폰 번호를 입력하세요.");
			$("#student_tel").val("").focus();
			return false;
		}
		if (isNaN($("#student_tel").val())) {
			alert("숫자만 입력하세요");
			$("#student_tel").val("").focus();
			return false;
		}
	} else {
		// 교직원 번호
		if ($.trim($("#staff_tel").val()) == "") {
			alert("휴대폰 번호를 입력하세요.");
			$("#staff_tel").val("").focus();
			return false;
		}
		if (isNaN($("#staff_tel").val())) {
			alert("숫자만 입력하세요");
			$("#staff_tel").val("").focus();
			return false;
		}
	}
	if (phoneBtnChk == false) {
		alert("휴대폰 인증번호 전송을 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if ($.trim($("#phone_certify").val()) == "") {
		alert("휴대폰 인증번호를 입력하세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (certifyBtnChk == false) {
		alert("휴대폰 인증하기를 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (phoneCertifyChk == false) {
		alert("휴대폰 인증번호가 일치하지 않습니다.");
		$("#phone_certify").val("").focus();
		return false;
	}
	if ($("#mem_type").val() == "0100") {
		if ($.trim($("#student_email").val()) == "") {
			alert("이메일을 입력하세요.");
			$("#student_email").val("").focus();
			return false;
		}
	} else {
		if ($.trim($("#staff_email").val()) == "") {
			alert("이메일을 입력하세요.");
			$("#staff_email").focus();
			return false;
		}
	}
	if ($("#dept_name").val() == null && $("#dept_name2").val() == null && $("#dept_name3").val() == null) {
		alert("학과 또는 부서를 선택하세요.");
		return false;
	}

	return true;

} // check() 함수 끝

$(document).ready(function() {
// 학과,부서 선택 시 select변경
	$("#dept_select").css("visibility", "hidden");
	$("#dept_name2").css("visibility", "hidden");
	$("#dept_name3").css("visibility", "hidden");

	var dept = "";
	$('input[type="radio"]').change(function() {
		$("#dept_select").css("visibility", "visible");
		
		if ($('input[type=radio][name="dept_type"]:checked').val() == "학과") {
			$("#dept_name3").css("visibility", "hidden");
			$("#dept_name2").css("visibility", "visible");
			$("#dept_name3").css("display","none");
			$("#dept_name2").css("display","block");
		} else if ($('input[type=radio][name="dept_type"]:checked').val() == "부서") {
			$("#dept_name2").css("visibility", "hidden");
			$("#dept_name3").css("visibility", "visible");
			$("#dept_name2").css("display","none");
			$("#dept_name3").css("display","block");
		}

	});

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

	// 비밀번호 일치/불알치 확인
	$("#alert_success").hide();
	$("#alert_fail").hide();
	$("input").keyup(function() {
		var passwd = $("#password").val();
		var passwd2 = $("#password2").val();
		if (passwd != "" || passwd2 != "") {
			if (passwd == passwd2) {
				$("#alert_success").show();
				$("#alert_fail").hide();
				$("#join_submit").removeAttr("disabled");
			} else {
				$("#alert_success").hide();
				$("#alert_fail").show();
			}
		}

	});

	// 휴대폰 본인 인증
	$("#phone_certify").attr("disabled", true);

	var code = "";
	$("#phoneChk").click(function() {

		phoneBtnChk = true;
		if ($("#mem_type").val() == "0100") {
			var phone = $("#student_tel").val();
		} else {
			var phone = $("#staff_tel").val();
		}
		if($("#mem_type").val() == "0100"){
			// 학생 번호
				if ($.trim($("#student_tel").val()) == "") {
					alert("휴대폰 번호를 입력하세요.");
					$("#student_tel").val("").focus();
					return false;
				}
				if (isNaN($("#student_tel").val())) {
					alert("숫자만 입력하세요");
					$("#student_tel").val("").focus();
					return false;
				}
			}else{
				// 교직원 번호
				if ($.trim($("#staff_tel").val()) == "") {
					alert("휴대폰 번호를 입력하세요.");
					$("#staff_tel").val("").focus();
					return false;
				}
				if (isNaN($("#staff_tel").val())) {
					alert("숫자만 입력하세요");
					$("#staff_tel").val("").focus();
					return false;
				}
			}
		alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해주세요.")
		$("#phone_certify").attr("disabled", false);

		$.ajax({
			type : "get",
			url : "phoneChk",
			data : {
				phone : phone
			},
			cache : false,
			success : function(data) {
				if (data == "error") {
					alert("휴대폰 번호가 올바르지 않습니다.");
					$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
					$(".successPhoneChk").css("color", "red");
					if ($("#mem_type").val() == "0100") {
						$("#student_tel").attr("autofocus", "true");
					} else {
						$("#staff_tel").attr("autofocus", "true");
					}
				} else {
					$("#phone_certify").attr("disabled", false);
					$("#phoneChk2").css("display", "inline-block");
					$(".successPhoneChk").text("인증번호를 입력한 뒤 인증하기를 눌러주세요.");
					$(".successPhoneChk").css("color", "green");
					if ($("#mem_type").val() == "0100") {
						$("#student_tel").attr("autofocus", "true");
					} else {
						$("#staff_tel").attr("autofocus", "true");
					}
					code = data;
				}
			}
		});
	});

	// 휴대폰 인증번호 일치 여부
	$("#phoneChk2").click(function() {
		certifyBtnChk = true;
		phoneCertifyChk = true;
		var phone_certify = $("#phone_certify").val();

		if (!phone_certify) {
			alert("인증번호를 입력하세요.");
			$("#phone_certify").focus();
			return false;
		}

		if ($("#phone_certify").val() == code) {
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color", "green");
			$("#phoneDoubleChk").val("true");
			$("#phone_certify").attr("disabled", true);

			phoneCertifyChk = true;

		} else {
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk").css("color", "red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus", true);

			phoneCertifyChk = false;
		}
	});
});

// 아이디 중복체크
function id_check() {
	idDuplChk = true;

	$("#idcheck").hide();
	var memid = $("#username").val();
	
	if ($.trim($("#username").val()) == "") {
		alert("학번을 입력하세요.");
		$("#username").focus();
		return false;
	}

	// 1.입력글자 길이 체크
	if ($.trim($("#username").val()).length !== 9) {
		var newtext = '<font color="red">학번은 9자이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#username").val("").focus();
		return false;
	}
	;

	// 입력아이디 유효성 검사
	if (!(validate_userid(memid))) {
		var newtext = '<font color="red">학번은 숫자만 가능합니다.</font>';
		$("#idcheck").text('');// 문자 초기화
		$("#idcheck").show();// span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#username").val("").focus();
		return false;
	}
	;

	// 아이디 중복확인
	$.ajax({
		type : "POST",
		url : "joinUsername",
		data : {
			"memid" : memid
		},
		success : function(data) {
			// alert("return success=" + data);
			if (data == 1) { // 중복 ID
				var newtext = '<font color="red">중복 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#username").val("").focus();
				return false;

			} else { // 사용 가능한 ID
				var newtext = '<font color="green">사용가능한 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#password").focus();
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax 끝
};
// 아이디 중복 체크 끝

// ID 정규식
function validate_userid(memid) {
	var pattern = new RegExp(/^[0-9]+$/); // 숫자만 가능
	return pattern.test(memid);
};

