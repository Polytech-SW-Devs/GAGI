// 아이디 중복확인
function checkId() {
    var snd_data = $("#userid").val();   // 입력된 아이디(이메일)

    $.ajax({
        type: "GET",
        url: contextPath+"/checkid",   // 상대 경로 (http://localhost:포트 자동 적용됨)
        data: { data: snd_data },
        dataType: "text",
        success: function (data) {
            console.log("Response from server:", data);
            if (data === "true") {
                $("#id-area").html("<p>※ 사용 가능한 아이디입니다.</p>");
            } else {
                $("#id-area").html("<p>※ 사용할 수 없는 아이디입니다.</p>");
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log("Error occurred:", textStatus, errorThrown);
            alert("에러가 발생했습니다.");
        }
    });
}

// 닉네임 중복확임
function checkNm() {
	var snd_data = $("#nickname").val();   // 입력된 닉네임
	
	$.ajax({
    	type: "GET",
    	url: contextPath +"/checknm",
    	data: { data: snd_data },
    	dataType: "text",
    	success: function(data) {
    		console.log("Response from server:", data);
        	if(data === "true") {
            	$("#id-area-nickname").html("사용 가능한 닉네임입니다.");
        	} else {
            	$("#id-area-nickname").html("이미 사용 중인 닉네임입니다.");
        	}
    	},
    	error: function (xhr, textStatus, errorThrown) {
            console.log("Error occurred:", textStatus, errorThrown);
            alert("에러가 발생했습니다.");
        }
	}); 
}

// 비밀번호 확인
function checkPwConfirm() {
	var pw = $("#password").val();  // 비밀번호 입력값
	var pwConfirm = $("#passwordConfirm").val();  // 비밀번호 확인 입력값
	
	if(pw === "" || pwConfirm === "") {
		$("pw-msg").html("<p>※ 비밀번호를 입력하세요.</p>");
		return;
	}
	
	if(pw === pwConfirm) {
		$("#pw-msg").html("<p style='color:green;'>※ 비밀번호가 일치합니다.</p>");
	} else {
		$("#pw-msg").html("<p style='color:red;'>※ 비밀번호가 일치하지 않습니다.</p>");
	}
}

// 아이디(이메일) 검증
function validateEmail() {
    var email = $("#userid").val();
    var msgBox = $("#email-rule-msg");

    var emailRule = /^[0-9a-zA-Z._%+-]+@[0-9a-zA-Z.-]+\.[a-zA-Z]{2,}$/;

    if (!emailRule.test(email)) {
        msgBox.show().html("* 올바른 이메일 형식(example@domain.com)이어야 합니다.");
    } else {
        msgBox.hide();
    }
}

// 비밀번호 검증
function validatePassword() {
    var pw = $("#password").val();
    var email = $("#userid").val();
    var msgBox = $("#pw-rule-msg");

    var lengthRule = /^.{8,20}$/;
    var comboRule = /^(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[^A-Za-z0-9])|(?=.*\d)(?=.*[^A-Za-z0-9])/;
    var repeatRule = /(.)\1\1/;
    var sequenceRule = /123|234|345|456|567|678|789|890|abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz/i;
    var containsEmail = email && pw.includes(email.split("@")[0]);

    if (!lengthRule.test(pw)) {
        msgBox.show().html("* 8~20자 사이여야 합니다.");
    } else if (!comboRule.test(pw)) {
        msgBox.show().html("* 영문/숫자/특수문자 중 2가지 이상 조합하세요.");
    } else if (repeatRule.test(pw)) {
        msgBox.show().html("* 같은 문자가 3번 이상 반복되면 안 됩니다.");
    } else if (sequenceRule.test(pw)) {
        msgBox.show().html("* 연속된 문자/숫자는 사용할 수 없습니다.");
    } else if (containsEmail) {
        msgBox.show().html("* 아이디(이메일)를 포함할 수 없습니다.");
    } else {
        msgBox.hide();
    }
}

// 닉네임 검증
function validateNickname() {
    var nickname = $("#nickname").val();
    var msgBox = $("#nickname-rule-msg");

    var nicknameRule = /^[가-힣a-zA-Z0-9]{2,10}$/;

    if (!nicknameRule.test(nickname)) {
        msgBox.show().html("* 닉네임은 2~10자, 한글/영문/숫자만 사용 가능합니다.");
    } else {
        msgBox.hide();
    }
}

// 전화번호 검증
function validatePhone() {
    var phone = $("#phone").val();
    var msgBox = $("#phone-rule-msg");

    var phoneRule = /^01[0-9]-\d{3,4}-\d{4}$/;

    if (!phoneRule.test(phone)) {
        msgBox.show().html("* 전화번호 형식: 010-1234-5678");
    } else {
        msgBox.hide();
    }
}

$(document).ready(function() {
    $('#joinForm').on('submit', function(e) {
        e.preventDefault(); // 기본 폼 제출 방지

        // 폼 제출 전 유효성 검사
        let hasError = false;
        $('.error-msg').each(function() {
            if ($(this).is(':visible')) {
                hasError = true;
            }
        });

        if (hasError) {
            alert('입력 양식에 오류가 있습니다. 내용을 다시 확인해주세요.');
            return;
        }
        
        if ($('#id-area').text().indexOf('사용 가능한') < 0) {
            alert('아이디 중복 확인을 해주세요.');
            return;
        }
        
        if ($('#id-area-nickname').text().indexOf('사용 가능한') < 0) {
            alert('닉네임 중복 확인을 해주세요.');
            return;
        }

        if ($('#pw-msg').text().indexOf('일치합니다') < 0) {
            alert('비밀번호가 일치하는지 확인해주세요.');
            return;
        }

        let allChecked = true;
        $('.checklist input[type="checkbox"][required]').each(function() {
            if (!this.checked) {
                allChecked = false;
            }
        });

        if (!allChecked) {
            alert('필수 이용약관에 모두 동의해주세요.');
            return;
        }

        var formData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: contextPath + "/join", // 'contextPath' 변수 사용
            data: formData,
            success: function(response) {
                alert("회원가입 성공! 가지마켓에 오신걸 환영합니다.");
                window.location.href = contextPath + "/login"; // 'contextPath' 변수 사용
            },
            error: function(xhr, status, error) {
                alert("회원가입 중 오류가 발생했습니다. 서버 로그를 확인해주세요.");
            }
        });
    });
});
