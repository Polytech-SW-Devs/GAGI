document.addEventListener("DOMContentLoaded", () => {

  // 총액 계산 함수
  const calculateTotal = () => {
    let total = 0;
    document.querySelectorAll("tbody tr").forEach(row => {
      const checkbox = row.querySelector(".cart-checkbox");
      if (checkbox && !checkbox.checked) return; // 체크 안된 상품은 제외

      const price = parseInt(row.dataset.price, 10);
      const qty = parseInt(row.querySelector(".qty-input").value, 10);
      total += price * qty;
    });

    const totalSpan = document.querySelector(".total-box span");
    if (totalSpan) totalSpan.innerText = total.toLocaleString() + "원";
  };


  const updateQuantity = (tr, requestedQty) => {
    const userId = tr.dataset.userid;
    const itemId = tr.dataset.itemid;
    const price = parseInt(tr.dataset.price, 10);

    fetch(`${contextPath}/mycart/update`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        userId: parseInt(userId, 10),
        itemId: parseInt(itemId, 10),
        quantity: parseInt(requestedQty, 10)
      })
    })
    .then(resp => resp.json())
    .then(data => {
      if (data.status === "success") {
        // 실제 반영된 수량 사용
        const finalQty = data.finalQuantity;

        // input 값 업데이트
        const input = tr.querySelector(".qty-input");
        if (input) input.value = finalQty;

        // 소계 업데이트
        const subtotalCell = tr.querySelector("td:nth-child(5)");
        if (subtotalCell) {
          subtotalCell.innerText = (price * finalQty).toLocaleString() + "원";
        }

        // 총액 다시 계산
        let total = 0;
        document.querySelectorAll("tbody tr").forEach(row => {
          const pr = parseInt(row.dataset.price, 10);
          const qt = parseInt(row.querySelector(".qty-input").value, 10);
          total += pr * qt;
        });
        const totalSpan = document.querySelector(".total-box span");
        if (totalSpan) totalSpan.innerText = total.toLocaleString() + "원";

        // 재고 부족 시 경고 메시지
        if (finalQty < requestedQty) {
          alert(data.message || `재고가 부족하여 최대 ${finalQty}개까지만 구매 가능합니다.`);
        }
      } else {
        alert("업데이트 실패: " + data.message);
      }
    })
    .catch(err => {
      console.error("업데이트 에러:", err);
      alert("수량 변경 중 오류가 발생했습니다.");
    });
  };

  // input change 이벤트
  document.querySelectorAll(".qty-input").forEach(input => {
    input.addEventListener("change", e => {
      let newQty = parseInt(e.target.value, 10);
      if (isNaN(newQty) || newQty < 0) newQty = 0;

      const tr = e.target.closest("tr");
      updateQuantity(tr, newQty);
    });
  });

  // 화살표 버튼 이벤트
  document.querySelectorAll(".qty-btn").forEach(btn => {
    btn.addEventListener("click", e => {
      const tr = e.target.closest("tr");
      const input = tr.querySelector(".qty-input");
      let value = parseInt(input.value, 10);

      if (e.target.classList.contains("increase")) value++;
      else if (e.target.classList.contains("decrease")) value = Math.max(0, value - 1);

      updateQuantity(tr, value); // DB 업데이트 및 UI 반영
    });
  });

   // 개별 체크박스 이벤트
  document.querySelectorAll(".cart-checkbox").forEach(chk => {
    chk.addEventListener("change", calculateTotal);
  });

  // 전체 선택 체크박스
  const selectAll = document.getElementById("select-all");
  if (selectAll) {
    selectAll.addEventListener("change", () => {
      const checked = selectAll.checked;
      document.querySelectorAll(".cart-checkbox").forEach(chk => chk.checked = checked);
      calculateTotal();
    });
  }

  // 페이지 로드 시 초기 총액 계산
  calculateTotal();

  
});
