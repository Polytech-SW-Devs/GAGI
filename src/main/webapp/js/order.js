// order.js
document.addEventListener("DOMContentLoaded", () => {
  const orderForm = document.querySelector("#orderForm");

  orderForm.addEventListener("submit", (e) => {
    e.preventDefault();

    const receiverName = orderForm.querySelector("[name='receiverName']").value.trim();
    const address = orderForm.querySelector("[name='address']").value.trim();
    const receiverPhone = orderForm.querySelector("[name='receiverPhone']").value.trim();

    if (!receiverName || !address || !receiverPhone) {
      alert("배송지 정보를 모두 입력해주세요.");
      return;
    }

    if (!/^[0-9]{9,11}$/.test(receiverPhone)) {
      alert("전화번호는 숫자만 입력해주세요 (9~11자리).");
      return;
    }

    if (confirm("입력한 정보로 주문을 진행하시겠습니까?")) {
      // 지금은 결제 기능 없이 단순 이동만
      orderForm.submit();
    }
  });
});
