<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<div class="container py-5">
  <div class="card shadow-sm">
    <div class="card-body">

      <!-- 상단 헤더 -->
      <div class="d-flex align-items-center mb-4">
        <a href="../" class="me-3 text-dark">
          <i class="bi bi-arrow-left fs-4"></i>
        </a>
        <h5 class="mb-0"><c:out value="${loginUser.nickname}"/>님의 배송지</h5>
      </div>

      <!-- 탭 -->
      <ul class="nav nav-tabs mb-3">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">배송지 목록</a>
        </li>
        <!-- 
        <li class="nav-item">
          <a class="nav-link" href="#">최근 배송지</a>
        </li>
         -->
      </ul>

      <!-- 배송지 리스트 -->
      <c:choose>
        <c:when test="${not empty deleveryList}">
          <div class="list-group">
            <c:forEach var="addr" items="${deleveryList}">
              <div class="list-group-item d-flex justify-content-between align-items-start">
                <c:url var="updateUrl" value="/mypage/delevery/addressUpdate/${addr.addressId}"/>
                <c:url var="deleteUrl" value="/mypage/delevery/addressDelete/${addr.addressId}"/>
                
                <!-- 배송지 정보 -->
                <div>
                  <h6 class="mb-1">
                    <c:out value="${addr.member}"/>
                    <c:if test="${addr.isDefault eq 'Y'}">
                      <span class="badge bg-success ms-2">기본배송지</span>
                    </c:if>
                  </h6>
                  <small class="text-muted d-block"><c:out value="${addr.phone}"/></small>
                  <p class="mb-0"><c:out value="${addr.allAddress}"/></p>
                </div>

                <!-- 버튼 영역 -->
                <div class="ms-3">
                  <a href="${updateUrl}" class="btn btn-sm btn-outline-secondary">수정</a>
                  <form method="post" action="${deleteUrl}" style="display:inline;" 
                        onsubmit="return confirm('정말 이 주소를 삭제하시겠습니까?');">
                    <button type="submit" class="btn btn-sm btn-outline-danger">삭제</button>
                  </form>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <p class="text-center text-muted py-4">등록된 배송지가 없습니다.</p>
        </c:otherwise>
      </c:choose>

      <!-- 안내문 -->
      <p class="text-muted mt-3 mb-4">※ 배송지는 최대 15개까지 등록하실 수 있습니다.</p>

      <!-- 배송지 등록 버튼 -->
      <div class="text-center">
        <c:url var="addUrl" value="/mypage/delevery/addressAdd"/>
        <a href="${addUrl}" class="btn btn-success btn-lg">배송지 등록</a>
      </div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
