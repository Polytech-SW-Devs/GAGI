// order.js
document.addEventListener("DOMContentLoaded", () => {
  const orderForm = document.querySelector("#orderForm");
  const select = document.getElementById("addressSelect");

  // ====== [주소 선택 시 자동 입력] ======
  if (select) {
    select.addEventListener("change", function () {
      const selected = this.options[this.selectedIndex];

      // data- 속성 읽어서 폼에 반영
      document.getElementById("receiverName").value = selected.dataset.name || '';

      // 전화번호에서 - 제거
      let phone = selected.dataset.phone || '';
      phone = phone.replace(/[^0-9]/g, ''); // 숫자만 남김
      document.getElementById("receiverPhone").value = phone;

      document.getElementById("zipCode").value = selected.dataset.zipcode || '';
      document.getElementById("address").value = selected.dataset.address || '';
      document.getElementById("addressDetail").value = selected.dataset.detail || '';
    });
  }

  // ====== [폼 제출 시 검증] ======
  if (orderForm) {
    orderForm.addEventListener("submit", (e) => {
      e.preventDefault();

      const receiverName = orderForm.querySelector("[name='receiverName']").value.trim();
      const address = orderForm.querySelector("[name='address']").value.trim();
      let receiverPhone = orderForm.querySelector("[name='receiverPhone']").value.trim();

      if (!receiverName || !address || !receiverPhone) {
        alert("배송지 정보를 모두 입력해주세요.");
        return;
      }

      // 숫자만 남기기
      receiverPhone = receiverPhone.replace(/[^0-9]/g, "");

      if (!/^[0-9]{9,11}$/.test(receiverPhone)) {
        alert("전화번호는 숫자만 입력해주세요 (9~11자리).");
        return;
      }

      // 값 다시 폼에 반영
      orderForm.querySelector("[name='receiverPhone']").value = receiverPhone;

      if (confirm("입력한 정보로 주문을 진행하시겠습니까?")) {
        orderForm.submit();
      }
    });
  }
});
