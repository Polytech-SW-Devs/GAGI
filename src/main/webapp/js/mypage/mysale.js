window.addEventListener("load", () => {
    const statusSelects = document.querySelectorAll(".status-select");

    statusSelects.forEach(select => {
        select.addEventListener("change", e => {
            const orderId = e.target.dataset.orderId;
            const currentStatus = e.target.dataset.currentStatus;
            const newStatus = e.target.value;

            if(currentStatus === newStatus) {
                return;
            }

            if(confirm(`${orderId}번 주문의 상태를 ${currentStatus}에서 ${newStatus}(으)로 변경하시겠습니까?`)) {
                
                // 전송 방식을 FormData에서 URLSearchParams로 변경합니다.
                const body = new URLSearchParams();
                body.append('id', orderId);
                body.append('orderStatus', newStatus);

                fetch(`${contextPath}/mypage/updateOrderStatus`, {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                    },
                    body: body
                })
                .then(resp => {
                    if(!resp.ok) {
                        throw new Error(`HTTP error! status: ${resp.status}`);
                    }
                    return resp.json();   
                })
                .then(data => {
                    if(data.success) {
                        alert("주문 상태가 성공적으로 변경되었습니다.");
                        select.dataset.currentStatus = newStatus;
                    } else {
                        alert("주문 상태 변경에 실패했습니다: " + (data.message || "알 수 없는 오류"));
                        select.value = currentStatus;
                    }
                })
                .catch(err => {
                    alert("오류가 발생했습니다: " + err);
                    console.error('Fetch Error:', err);
                    select.value = currentStatus;
                });
            } else {
                select.value = currentStatus;
            }
        });
    });
});