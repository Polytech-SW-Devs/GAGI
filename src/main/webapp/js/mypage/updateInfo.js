let check_nickname = false;

window.addEventListener("load",() =>{
    document.querySelectorAll(".password").forEach(item => {
        const input = item.querySelector("input[type='password']");
        const button = item.querySelector(".view");
        button.addEventListener("click",() => {
            
            
            if(input.type === "password"){
                input.type = "text";
                button.textContent = "숨기기"
            }else {
                input.type = "password"
                button.textContent = "비밀번호 보기";
            }     
        });
    });
    document.querySelector("input[name='nickname']").addEventListener("change",e => {
        check_nickname = false;
    });

    //promise 비동기 확인
    document.getElementById("check_nickname").addEventListener("click",e =>{
        const button = e.target;
        const nickname = document.querySelector("input[name='nickname']").value;
        button.setAttribute("disabled",true);
        
        fetch(`checknm/${nickname}`,{
            method: "GET"   
        }).then(resp => {
            button.removeAttribute("disabled");
            if(resp.ok) 
                return resp.text();
            else
                throw new Error("닉네임 중복검사를 할 수 없습니다.");
            })
        .then(result => {
            if(result == "OK"){
                alert("사용가능한 닉네임 입니다.");
                check_nickname = true;
            }else {
                alert("이미 다른사용자가 사용하는 닉네임 입니다.");
            }}
        )
        .catch(e=> alert(e));
    });
});
