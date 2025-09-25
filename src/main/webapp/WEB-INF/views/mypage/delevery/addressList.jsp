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
			<p><strong><c:out value="${loginUser.nickname}"/>님의 배송지</strong></p>
		</div>
		<div>
			<div>
				<c:choose>
					<c:when test="${not empty deleveryList}">
						<ul>
							<c:forEach var="addr" items="${deleveryList}">
								<li>
									<c:url var="updateUrl" value="/mypage/delevery/addressUpdate/${addr.addressId}"></c:url>
									<c:url var="deleteUrl" value="/mypage/delevery/addressDelete/${addr.addressId}" />
									
									<div>
										<strong><c:out value="${addr.getMember()}"/></strong>
										<c:if test="${addr.getIsDefault() eq 'Y'}">
											<span style="color:blue;">[대표 배송지]</span>
										</c:if>
										<a href="${updateUrl}"><button type="button">수정</button></a>
										<form method="post" action="${deleteUrl}" style="display:inline;" onsubmit="return confirm('정말 이 주소를 삭제하시겠습니까?');">
											<button type="submit">삭제</button>
										</form>
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
					<c:url var="addUrl" value="/mypage/delevery/addressAdd"></c:url>
					<a href="${addUrl}"><button>배송지 등록</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>