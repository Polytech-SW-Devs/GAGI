document.addEventListener("DOMContentLoaded", () => {
    // 이 스크립트가 작동하려면 myorder.jsp에 contextPath 변수가 설정되어 있어야 합니다.
    // 예: <script>const contextPath = "${pageContext.request.contextPath}";</script>

    const cancelButtons = document.querySelectorAll(".cancel-order-btn");

    cancelButtons.forEach(button => {
        button.addEventListener("click", e => {
            const orderId = e.target.dataset.orderId;

            if (confirm(`주문번호 ${orderId}번 주문을 정말로 취소하시겠습니까?\n취소된 주문은 되돌릴 수 없습니다.`)) {
                
                const body = new URLSearchParams();
                body.append('id', orderId);

                fetch(`${contextPath}/mypage/cancelOrder`, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                    },
                    body: body
                })
                .then(response => {
                    if (!response.ok) {
                        return response.json().then(err => { throw new Error(err.message || '서버 오류가 발생했습니다.') });
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.success) {
                        alert("주문이 성공적으로 취소되었습니다.");
                        location.reload(); // 페이지를 새로고침하여 변경사항을 반영
                    } else {
                        alert("주문 취소에 실패했습니다: " + (data.message || "알 수 없는 오류"));
                    }
                })
                .catch(err => {
                    alert("처리 중 오류가 발생했습니다: " + err.message);
                    console.error('Fetch Error:', err);
                });
            }
        });
    });
});
