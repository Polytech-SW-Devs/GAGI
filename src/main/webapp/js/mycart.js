document.addEventListener("DOMContentLoaded", () => {
   // 수량 input change 이벤트
  const updateQuantity = (tr, newQty) => {
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
        quantity: parseInt(newQty, 10)
      })
    })
    .then(resp => resp.json())
    .then(data => {
      if (data.status === "success") {
        // 소계 업데이트
        const subtotalCell = tr.querySelector("td:nth-child(5)"); // 합계 td
        if (subtotalCell) {
          subtotalCell.innerText = (price * newQty).toLocaleString() + "원";
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
      if (isNaN(newQty) || newQty < 1) newQty = 1;
      e.target.value = newQty;

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
      else if (e.target.classList.contains("decrease")) value = Math.max(1, value - 1);

      input.value = value;
      updateQuantity(tr, value); // DB 업데이트 및 UI 반영
    });
  });
});
