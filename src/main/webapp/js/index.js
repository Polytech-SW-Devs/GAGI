window.addEventListener("load", () => {
    const loginBtn = document.getElementById("loginBtn");
    if (loginBtn) {
        loginBtn.addEventListener("click", () => {
            window.location.href = contextPath + "/login";
        });
    }

    const trustItems = document.querySelectorAll(".trust-item");
    trustItems.forEach(item => {
        item.addEventListener("click", () => {
            window.location.href = contextPath + "/home";
        });
    });
});