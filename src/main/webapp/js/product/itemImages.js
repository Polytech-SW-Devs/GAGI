const appendFile = e =>{
    const ul = document.getElementById("files");
    const li = document.createElement("li")
    const input = document.createElement("input");

    input.setAttribute("type", "file");
    input.setAttribute("name", "uploadFile");

    const existingRadios = ul.querySelectorAll('input[name="mainImageIndex"]');
    let maxValue = -1;
    existingRadios.forEach(r => {
        const val = parseInt(r.value) || 0;
        if (val > maxValue) maxValue = val;
    });
    const newValue = maxValue + 1;

    const label = document.createElement("label");
    const img = document.createElement("img");
    img.style.display = "none";
    img.alt = "미리보기";

    const controls = document.createElement("div");
    controls.className = "image-controls";
    label.className = "main-image-label";

    const radio = document.createElement("input");
    radio.setAttribute("type", "radio");
    radio.setAttribute("name", "mainImageIndex");
    radio.setAttribute("value", newValue); // ✅ 수정
    if (ul.children.length === 0) radio.checked = true

    label.appendChild(radio);
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

    li.append(img);
    li.append(controls);
    li.append(input);
    ul.append(li);
    input.click();
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