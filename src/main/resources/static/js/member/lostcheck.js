var idDuplChk = false; // 아이디 중복 체크 버튼
var phoneBtnChk = false; // 인증번호 전송 여부 체크 변수
var certifyBtnChk = false; // 인증하기버튼 안눌렀을 때 막을 변수
var idRule = /^[0-9]+$/;
var phoneCertifyChk = false; // 인증번호 일치여부 체크 변수

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
    if ($.trim($("#username").val()).length == 10) {
        alert("학번은 9자이어야 합니다.");
        $("#username").focus();
        return false;
    }
    if (!idRule.test($("#username").val())) {
        alert("학번은 숫자만 사용 가능합니다.");
        $("#username").focus();
        return false;
    }
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
}
	
$(document).ready(function() {
	console.log($("#mem_type").val());
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
		alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해주세요.");
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
		console.log("클릭 누름");
		certifyBtnChk = true;
		var phone_certify = $("#phone_certify").val();

		if (!phone_certify) {
			alert("인증번호를 입력하세요.");
			$("#phone_certify").focus();
			return false;
		}

		if ($("#phone_certify").val() == code) {
			console.log("인증 번호 일치함");
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color", "green");
			$("#phoneDoubleChk").val("true");
			$("#phone_certify").attr("disabled", true);

			phoneCertifyChk = true;

		} else {
			console.log("인증 번호 불일치함");
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk").css("color", "red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus", true);

			phoneCertifyChk = false;
		}
	});
});

//아이디 중복체크
function id_check() {

	idDuplChk = true;
	
	$("#idcheck").hide();
	var memid = $("#username").val();

	// 1. 입력글자 길이 체크
	if ($.trim($("#username").val()).length == 10) {
		var newtext = '<font color="red">학번은 9자이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext); // span 아이디 영역에 경고문자 추가
		$("#username").val("").focus();
		return false;
	}

	// 입력아이디 유효성 검사
	if (!(validate_userid(memid))) {
		var newtext = '<font color="red">학번은 숫자만 가능합니다.</font>';
		$("#idcheck").text(''); // 문자 초기화
		$("#idcheck").show(); // span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#username").val("").focus();
		return false;
	}


	// 아이디 중복확인
	$.ajax({
		type : "POST",
		url : "joinUsername",
		data : {
			"memid" : memid
		},
		success : function(data) {
			// alert("return success=" + data);
			if (data == 1) { // 학번 존재
				var newtext = '<font color="green">성함을 적어주세요</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				idDuplChk = true;

			} else { // 학번 존재하지 않음
				var newtext = '<font color="red">없는 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#username").val("").focus();
				return false;
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax 끝
}
// 아이디 중복 체크 끝

//ID 정규식
function validate_userid(memid) {
	var pattern = new RegExp(/^[0-9]+$/); // 숫자만 가능
	return pattern.test(memid);
};