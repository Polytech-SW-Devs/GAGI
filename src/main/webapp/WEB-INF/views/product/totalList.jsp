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
	<div>
		<div>
			<div><h3>전체 게시판</h3></div>			
			<div>
				<table border="1">
					<thead>
						<tr>
							<th>가격</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>판매자</th>
							<th>수량</th>							
							<th>원산지</th>														
							<th>직거래 여부</th>													
							<th>생성일</th>
							<th>조회수</th>							
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="5">준비된 물건이 없습니다.</td>
							</tr>
						</c:if>
					
						<c:forEach var="item" items="${totalList}">
							<tr>
								<td>${item.price}</td>
								<td>${item.categoryName}</td>
								<td><a href="./product/detail/${item.id}">${item.title}</a></td>
								<td>${item.nickname}</td>
								<td>${item.amount}</td>
								<td>${item.delivery}</td>
								<td>${item.isDirectDeal}</td>
								<td>${item.createdAt}</td>
								<td>${item.views}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>