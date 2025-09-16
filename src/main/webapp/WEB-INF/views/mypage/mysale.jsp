<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>마이페이지 - 판매내역</title>
<style>
    body {
        margin: 0;
        padding: 0;
    }
    div {
        box-sizing: border-box;
    }
    .sidebar {
        float: left;
        width: 20%;
        min-height: 100vh;
        border-right: 1px solid #ccc;
        padding: 20px;
    }
    .main-content {
        float: left;
        width: 75%;
        margin-left: 20px;
        padding: 20px;
    }
    h3 {
        margin-top: 0;
        margin-bottom: 20px;
    }
    nav p {
        margin: 5px 0;
    }
    nav a {
        text-decoration: none;
        color: #333;
        display: block;
        padding: 5px 0;
    }
    nav a:hover {
        color: #007bff;
    }
    nav a.active {
        font-weight: bold;
        color: #007bff;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        vertical-align: middle; /* 추가: 셀 내용 수직 가운데 정렬 */
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<div>
    <div class="sidebar">
        <h3>마이페이지</h3>
        <nav>
            <p><a href="<c:url value='/mypage/myorder'/>">구매내역</a></p>
            <p><a href="<c:url value='/mypage/mysale'/>" class="active">판매내역</a></p>
            <p><a href="<c:url value='/mypage/mypage'/>">개인정보 수정</a></p>
            <p><a href="<c:url value='/mypage/myarticle'/>">내 게시글 보기</a></p>
            <p><a href="#">회원탈퇴</a></p>
        </nav>
    </div>

    <div class="main-content">
        <h2>판매 내역</h2>

        <table border="1">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문일자</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>총 가격</th>
                    <th>주문상태</th>
                    <th>주문자</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="8">판매 내역이 없습니다</td>
                    </tr>
                </c:if>

                <c:forEach var="order" items="${list}">
                    <c:forEach var="orderItem" items="${order.orderItems}" varStatus="loop">
                        <tr>
                            <c:if test="${loop.first}">
                                <td rowspan="${order.orderItems.size()}">
                                    <a href="<c:url value='/mypage/mysaleDetail/${order.id}'/>">${order.id}</a>
                                </td>
                                <td rowspan="${order.orderItems.size()}">
                                    <fmt:formatDate value="${order.createdAtDate}" pattern="yyyy-MM-dd HH:mm" />
                                </td>
                            </c:if>

                            <td>${orderItem.item.title}</td>
                            <td>${orderItem.quantity}개</td>
                            <td><fmt:formatNumber value="${orderItem.price}" pattern="#,##0" />원</td>
                            <td><fmt:formatNumber value="${orderItem.totalPrice}" pattern="#,##0" />원</td>

                            <c:if test="${loop.first}">
                                <td rowspan="${order.orderItems.size()}">${orderItem.orderStatus}</td>
                                <td rowspan="${order.orderItems.size()}">${order.userId}</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
            <tfoot>
				<tr>
					<td colspan="8">
						<div class="pagination pagination-sm justify-content-center">
							<div class="page-item">
								<a href="?page=1${pager.query}" class="page-link">처음</a>
							</div>
							<div class="page-item">
								<a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a>
							</div>

							<c:forEach var="page" items="${pager.list}">
								<div class="page-item ${pager.page == page ? 'active' : ''}">
									<a href="?page=${page}${pager.query}" class="page-link">${page}</a>
								</div>
							</c:forEach>

							<div class="page-item">
								<a href="?page=${pager.next}${pager.query}" class="page-link">다음</a>
							</div>
							<div class="page-item">
								<a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a>
							</div>
						</div>
					</td>
				</tr>
			</tfoot>
        </table>
    </div>
</div>
</body>
</html>
