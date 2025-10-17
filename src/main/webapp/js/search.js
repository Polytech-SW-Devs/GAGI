window.addEventListener("load", () => {
    const productCards = document.querySelectorAll('.product-card');

    productCards.forEach(card => {
        card.addEventListener('click', function() {
            const itemId = this.dataset.itemId;
            if (itemId) {
                window.location.href = `${contextPath}/product/detail/${itemId}`;
            }
        });
    });
});
