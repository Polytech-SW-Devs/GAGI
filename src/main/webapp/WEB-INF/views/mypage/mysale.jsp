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
<jsp:include page="../templete/logo.jsp"></jsp:include>

</head>
<body class="bg-light">
    <!-- 헤더 영역 -->
    <header class="bg-white border-bottom py-3 mb-4">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center">
                <!-- 로고 -->
                <div class="d-flex align-items-center">
                    <i class="bi bi-egg-fried text-warning me-2" style="font-size: 2rem;"></i>
                    <h1 class="h3 mb-0 text-dark fw-bold">가지 마켓</h1>
                </div>
                <!-- 우측 버튼들 -->
                <div class="d-flex gap-2">
                    <button class="btn btn-success btn-sm px-3">로그아웃</button>
                    <button class="btn btn-outline-secondary btn-sm px-3">장바구니</button>
                </div>
            </div>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid">
        <div class="row">
            <!-- 왼쪽 공백 영역 -->
            <div class="col-2"></div>
            
            <!-- 사이드바 -->
            <div class="col-2 pe-0">
                <div class="bg-white rounded border p-3">
                    <h5 class="text-center mb-4 fw-bold">마이페이지</h5>
                    <nav class="nav flex-column gap-2">
                        <a href="<c:url value='/mypage/myorder'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">구매내역</a>
                        <a href="<c:url value='/mypage/mysale'/>" class="nav-link text-dark py-2 px-3 text-center border rounded bg-light fw-bold">판매내역</a>
                        <a href="<c:url value='/mypage/mypage'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">개인정보 수정</a>
                        <a href="<c:url value='/mypage/myarticle'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">내 게시글 보기</a>
                        <a href="#" class="nav-link text-dark py-2 px-3 text-center border rounded">회원탈퇴</a>
                    </nav>
                </div>
            </div>

            <!-- 메인 컨테이너 -->
            <div class="col-6 px-3">
                <div class="bg-white rounded border p-4">
                    <h4 class="mb-4 text-start fw-bold">판매 내역</h4>

                    <div class="table-responsive">
                        <table class="table table-bordered mb-0">
                            <thead class="table-light">
                                <tr class="text-center">
                                    <th class="py-3" style="width: 10%;">주문번호</th>
                                    <th class="py-3" style="width: 15%;">주문일자</th>
                                    <th class="py-3">상품명</th>
                                    <th class="py-3" style="width: 8%;">수량</th>
                                    <th class="py-3" style="width: 15%;">가격</th>
                                    <th class="py-3" style="width: 15%;">총 가격</th>
                                    <th class="py-3" style="width: 12%;">주문상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="7" class="text-center py-5 text-muted">
                                            <div>
                                                <i class="bi bi-inbox text-muted mb-2" style="font-size: 2rem;"></i>
                                                <div>판매 내역이 없습니다</div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>

                                <c:forEach var="order" items="${list}">
                                    <tr class="text-center">
                                        <td class="align-middle">
                                            <a href="<c:url value='/mypage/mysaleDetail/${order.id}'/>" class="text-decoration-none text-primary fw-bold">${order.id}</a>
                                        </td>
                                        <td class="align-middle">
                                            <!-- LocalDateTime 대신 변환된 Date getter 사용 -->
                                            <fmt:formatDate value="${order.createdAtDate}" pattern="yyyy-MM-dd HH:mm" />
                                        </td>
                                        <td class="text-start ps-3">${order.itemName}</td>
                                        <td>${order.amount}개</td>
                                        <td class="text-end"><fmt:formatNumber value="${order.price}" pattern="#,##0" />원</td>
                                        <td class="text-end fw-bold"><fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</td>
                                        <td class="align-middle">
                                            <span class="badge bg-primary">${order.orderStatus}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- 페이지네이션 -->
                    <div class="d-flex justify-content-center mt-4">
                        <nav aria-label="페이지 네비게이션">
                            <ul class="pagination pagination-sm">
                                <li class="page-item">
                                    <a href="?page=1${pager.query}" class="page-link">처음</a>
                                </li>
                                <li class="page-item">
                                    <a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a>
                                </li>

                                <c:forEach var="page" items="${pager.list}">
                                    <li class="page-item ${pager.page == page ? 'active' : ''}">
                                        <a href="?page=${page}${pager.query}" class="page-link">${page}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item">
                                    <a href="?page=${pager.next}${pager.query}" class="page-link">다음</a>
                                </li>
                                <li class="page-item">
                                    <a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- 오른쪽 공백 영역 -->
            <div class="col-2"></div>
        </div>
    </div>
</body>
</html>
