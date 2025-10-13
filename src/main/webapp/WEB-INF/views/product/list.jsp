<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAGI Market </title>

<style>
  table, th, td {
    border: 1px solid black;
  }
</style>

</head>
<body>
<jsp:include page="../templete/headerLogin.jsp"></jsp:include>
	<div>
		<div>
			<div><h3>나의 게시판</h3></div>
			
			<div>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>상품설명</th>
							<th>수량</th>							
							<th>원산지</th>														
							<th>직거래 여부</th>														
							<th>계좌번호</th>														
							<th>생성일</th>
							<th>조회수</th>	
							<th>관리</th>							
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="11">준비된 물건이 없습니다.</td>
							</tr>
						</c:if>
					
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.price}</td>
								<td>${item.categoryName}</td>
								<td><a href="${pageContext.request.contextPath}/product/detail/${item.id}">${item.title}</a></td>
								<td>${item.description}</td>
								<td>${item.amount}</td>
								<td>${item.delivery}</td>
								<td>${item.isDirectDeal}</td>
								<td>${item.bankAccountNumber}</td>
								<td>${item.createdAt}</td>
								<td>${item.views}</td>
								<td>
									<a href="${pageContext.request.contextPath}/product/update/${item.id}">변경</a>
									<a href="./delete/${item.id}">삭제</a>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<a href="../product/add">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>