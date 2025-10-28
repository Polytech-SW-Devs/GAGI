const appendFile = e =>{
    const ul = document.getElementById("files");
    const li = document.createElement("li") // ✅ 수정: li 유지
    li.classList.add("new-file", "image-item"); // ✅ 수정: image-item 클래스 추가

    const input = document.createElement("input");
    input.setAttribute("type", "file");
    input.setAttribute("name", "uploadFile");
    input.setAttribute("accept", "image/*"); // ✅ 추가: 이미지만 선택
    input.style.display = "none"; // ✅ 추가: input 숨김

    const newFileIndex = document.querySelectorAll('li.new-file input[name="uploadFile"]').length;

    const index = ul.querySelectorAll("li").length;
    
    // ✅ 추가: 이미지 미리보기 요소
    const img = document.createElement("img");
    img.style.display = "none";
    img.alt = "미리보기";
    
    // ✅ 추가: 컨트롤 컨테이너
    const controls = document.createElement("div");
    controls.className = "image-controls";
    
    const label = document.createElement("label");
    label.className = "main-image-label"; // ✅ 추가: 클래스
    
    const radio = document.createElement("input");
    radio.setAttribute("type", "radio");
    radio.setAttribute("name", "mainImageIndex");
    radio.setAttribute("value", "new_" + newFileIndex);

    if (index === 0) {
        radio.checked = true;
    }

    label.appendChild(radio);
    // label.append("대표 이미지"); // ✅ 삭제
    const span = document.createElement("span"); // ✅ 추가
    span.textContent = "대표"; // ✅ 추가
    label.appendChild(span); // ✅ 추가
    
    // ✅ 추가: 삭제 버튼
    const deleteBtn = document.createElement("button");
    deleteBtn.type = "button";
    deleteBtn.className = "delete-image-btn";
    deleteBtn.textContent = "삭제";
    deleteBtn.addEventListener("click", () => li.remove());
    
    // ✅ 추가: 컨트롤 구성
    controls.appendChild(label);
    controls.appendChild(deleteBtn);
    
    // ✅ 추가: 파일 선택 이벤트
    input.addEventListener("change", function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                img.src = event.target.result;
                img.style.display = "block";
            };
            reader.readAsDataURL(file);
        }
    });

    // li.append(input); // ✅ 삭제
    // li.append(label); // ✅ 삭제
    li.append(img); // ✅ 추가: 이미지 먼저
    li.append(controls); // ✅ 추가: 컨트롤 추가
    li.append(input); // ✅ 추가: input은 마지막 (숨김)
    ul.append(li);
    
    input.click(); // ✅ 추가: 파일 선택 창 자동 열기
}

window.addEventListener("load", () =>{
    const ul = document.getElementById("files");
    document.querySelectorAll(".deleteImage").forEach(item => {
        const li = item.closest("li");
        if (li && !li.classList.contains("existing-file")) {
            li.classList.add("existing-file");
        }
    });

    if (ul.children.length === 0) {
        appendFile();
    }

    document.getElementById("image_add").addEventListener("click", appendFile);
    document.querySelectorAll(".deleteImage").forEach(item => {
        item.addEventListener("click", e => {
            const id = e.target.dataset.code;
            fetch(`../itemImage/delete/${id}`, { method: "DELETE" })
            .then(resp => {
                if (resp.ok) {
                    alert("삭제되었습니다");
                    e.target.closest("li").remove();
                } else {
                    alert("삭제 실패");
                }
            }).catch(err => alert(err));
        });
    });
});