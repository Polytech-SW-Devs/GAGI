<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<div><h3>나의 게시판</h3></div>
			
			<div>
				<table border="1">
					<thead>
						<tr>
							<th><c:out value="번호"/></th>
							<th><c:out value="카테고리"/></th>
							<th><c:out value="제목"/></th>
							<th><c:out value="생성일"/></th>
							<th><c:out value="조회수"/></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="5">준비된 물건이 없습니다.</td>
							</tr>
						</c:if>
					
						<c:forEach var="item" items="${list}">
							<tr>
								<td><c:out value="${item.boardId}"/></td>
								<td><c:out value="${item.categoryName}"/></td>
								<td><c:out value="${item.title}"/></td>
								<td><fmt:formatDate value="${item.createDt}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${item.views}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<a href="add">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>