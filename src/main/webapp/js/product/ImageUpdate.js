const appendFile = e =>{
    const ul = document.getElementById("files");
    const li = document.createElement("li")
    li.classList.add("new-file"); // add.js와 다른부분 

    const input = document.createElement("input");
    input.setAttribute("type", "file");
    input.setAttribute("name", "uploadFile");

    const newFileIndex = document.querySelectorAll('li.new-file input[name="uploadFile"]').length;// add.js와 다른부분 

    const index = ul.querySelectorAll("li").length;// add.js와 다른부분 
    const label = document.createElement("label");
    const radio = document.createElement("input");
    radio.setAttribute("type", "radio");
    radio.setAttribute("name", "mainImageIndex");
    radio.setAttribute("value", "new_" + newFileIndex);// add.js와 다른부분 

    // If there are no images at all (existing or new), check the first one by default.
    if (index === 0) {
        radio.checked = true;
    }

    label.appendChild(radio);
    label.append("대표 이미지");

    li.append(input);
    li.append(label);
    ul.append(li);
}

window.addEventListener("load", () =>{
    const ul = document.getElementById("files");
    document.querySelectorAll(".deleteImage").forEach(item => {
        const li = item.closest("li");
        if (li && !li.classList.contains("existing-file")) {
            li.classList.add("existing-file");
        }
    });// add.js와 다른부분 

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