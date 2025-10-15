const appendFile = e =>{
    const ul = document.getElementById("files");
    const li = document.createElement("li")
    const input = document.createElement("input");

    input.setAttribute("type", "file");
    input.setAttribute("name", "uploadFile");

    const index = ul.children.length;
    const label = document.createElement("label");
    const radio = document.createElement("input");
    radio.setAttribute("type", "radio");
    radio.setAttribute("name", "mainImageIndex");
    radio.setAttribute("value", index);
    if (index === 0) radio.checked = true;

    label.appendChild(radio);
    label.append("대표 이미지");

    li.append(input);
    li.append(label);
    ul.append(li);
}

window.addEventListener("load", () =>{
    const ul = document.getElementById("files");
    
    if (ul.children.length === 0) {
        appendFile();
    }
    document.getElementById("image_add").addEventListener("click", appendFile);
});