function checkId() {
    var snd_data = $("#userid").val();   // 입력된 아이디(이메일)

    $.ajax({
        type: "GET",
        url: "/checkid",   // 상대 경로 (http://localhost:포트 자동 적용됨)
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

function checkNm() {
	var snd_data = $("#nickname").val();   // 입력된 닉네임
	
	$.ajax({
    	type: "GET",
    	url: "/checknm",
    	data: { nickname: $("#nickname").val() },
    	success: function(result) {
        	if(result === "OK") {
            	alert("사용 가능한 닉네임입니다.");
        	} else {
            	alert("이미 사용 중인 닉네임입니다.");
        	}
    	}
	}); 
}