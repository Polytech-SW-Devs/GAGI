window.addEventListener("load", () => {
    // 로그인 버튼 이벤트
    const loginBtn = document.getElementById("loginBtn");
    if (loginBtn) {
        loginBtn.addEventListener("click", () => {
            window.location.href = contextPath + "/login";
        });
    }

    // 신뢰 섹션 카드 클릭 이벤트
    const trustItems = document.querySelectorAll(".trust-item");
    trustItems.forEach(item => {
        item.addEventListener("click", () => {
            window.location.href = contextPath + "/home";
        });
    });

    // 마이페이지 버튼 이벤트
    const mypageBtn = document.getElementById("mypageBtn");
    if (mypageBtn) {
        mypageBtn.addEventListener("click", () => {
            window.location.href = contextPath + "/mypage";
        });
    }

    // 상품 카드 클릭 이벤트
    const productCards = document.querySelectorAll(".product-card");
    productCards.forEach(card => {
        card.addEventListener("click", () => {
            const itemId = card.dataset.itemId;
            if (itemId) {
                window.location.href = contextPath + "/product/detail/" + itemId;
            }
        });
    });
});