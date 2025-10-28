document.addEventListener("DOMContentLoaded", () => {

  // ✅ 총액 계산 함수
  const calculateTotal = () => {
    let total = 0;
    document.querySelectorAll("tbody tr").forEach(row => {
      const checkbox = row.querySelector(".cart-checkbox");
      if (checkbox && !checkbox.checked) return; // 체크 안된 상품 제외

      const price = parseInt(row.dataset.price, 10);
      const qtyInput = row.querySelector(".qty-input");

      if (!qtyInput) {
        console.warn("⚠️ qty-input을 찾을 수 없습니다:", row);
        return;
      }

      const qty = parseInt(qtyInput.value, 10);
      if (!isNaN(price) && !isNaN(qty)) {
        total += price * qty;
      }
    });

    const totalSpan = document.querySelector(".total-box span");
    if (totalSpan) totalSpan.innerText = total.toLocaleString() + "원";
  };

  // ✅ 수량 업데이트 함수
  const updateQuantity = (tr, requestedQty) => {
    if (!tr) {
      console.error("❌ updateQuantity() 호출 시 tr이 null입니다.");
      return;
    }

    const userId = tr.dataset.userid;
    const itemId = tr.dataset.itemid;
    const price = parseInt(tr.dataset.price, 10);

    if (!userId || !itemId) {
      console.error("❌ userId 또는 itemId 누락:", tr);
      return;
    }

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
      console.log("✅ 서버 응답:", data);
      if (data.status === "success") {
        const finalQty = data.finalQuantity;

        const input = tr.querySelector(".qty-input");
        if (!input) {
          console.error("❌ qty-input을 찾을 수 없습니다:", tr);
          return;
        }
        input.value = finalQty;

        // ✅ 소계 업데이트
        const subtotalCell = tr.querySelector("td:nth-child(6)");
        if (subtotalCell) {
          subtotalCell.innerText = (price * finalQty).toLocaleString() + "원";
        }

        // ✅ 총액 다시 계산
        calculateTotal();

        // ✅ 재고 부족 시 경고
        if (finalQty < requestedQty) {
          alert(data.message || `재고가 부족하여 최대 ${finalQty}개까지만 구매 가능합니다.`);
        }
      } else {
        alert("업데이트 실패: " + data.message);
      }
    })
    .catch(err => {
      console.error("🚨 업데이트 에러:", err);
      alert("수량 변경 중 오류가 발생했습니다.");
    });
  };

  // ✅ 수량 직접 변경 시
  document.querySelectorAll(".qty-input").forEach(input => {
    input.addEventListener("change", e => {
      let newQty = parseInt(e.target.value, 10);
      if (isNaN(newQty) || newQty < 0) newQty = 0;

      const tr = e.target.closest("tr");
      if (!tr) {
        console.error("❌ input change 시 tr을 찾을 수 없습니다.", e.target);
        return;
      }

      updateQuantity(tr, newQty);
    });
  });

  // ✅ 화살표(+, −) 클릭 시
  document.querySelectorAll(".qty-btn").forEach(btn => {
    btn.addEventListener("click", e => {
      const tr = e.target.closest("tr");
      if (!tr) {
        console.error("❌ 버튼 클릭 시 tr을 찾을 수 없습니다.", e.target);
        return;
      }

      const input = tr.querySelector(".qty-input");
      if (!input) {
        console.error("❌ 버튼 클릭 시 qty-input을 찾을 수 없습니다.", tr);
        return;
      }

      let value = parseInt(input.value, 10);
      if (isNaN(value)) value = 0;

      if (e.target.classList.contains("increase")) value++;
      else if (e.target.classList.contains("decrease")) value = Math.max(0, value - 1);

      updateQuantity(tr, value);
    });
  });

  // ✅ 개별 체크박스
  document.querySelectorAll(".cart-checkbox").forEach(chk => {
    chk.addEventListener("change", calculateTotal);
  });

  // ✅ 전체 선택 체크박스
  const selectAll = document.getElementById("select-all");
  if (selectAll) {
    selectAll.addEventListener("change", () => {
      const checked = selectAll.checked;
      document.querySelectorAll(".cart-checkbox").forEach(chk => chk.checked = checked);
      calculateTotal();
    });
  }

  // ✅ 페이지 로드 시 초기 총액 계산
  calculateTotal();
});
