<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 주소</title>
</head>
<body>
	<div>
		<div>
			<p><strong>${loginUser.nickname}님의 배송지</strong></p>
		</div>
		<div>
			<div>
				<c:choose>
					<c:when test="${not empty deleveryList}">
						<ul>
							<c:forEach var="addr" items="${deleveryList}">
								<li>

									<div>
										<strong><c:out value="${addr.getMember()}"/></strong>
										<c:if test="${addr.getIsDefault() eq 'Y'}">
											<span style="color:blue;">[대표 배송지]</span>
										</c:if>
										<a href="/mypage/delevery/addressUpdate/${addr.addressId}"><button>수정</button></a>
										<button type="button" onclick="deleteAddress(${addr.addressId})">삭제</button>
									</div>

									<p><c:out value="${addr.phone}"></c:out></p>
									<p><c:out value="${addr.getAllAddress()}"></c:out></p>

								</li>
							</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						<p>등록된 배송지가 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<div>
					<a href="/mypage/delevery/addressAdd"><button>배송지 등록</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
function deleteAddress(addressId) {
    if (confirm("정말 이 주소를 삭제하시겠습니까?")) {
        // 확인 → 삭제 실행
        window.location.href = "/addressDelete/" + addressId;
    } else {
        // 취소 → 아무 동작 없음
        return;
    }
}
</script>
</html>