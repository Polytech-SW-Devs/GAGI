<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.sidebar {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	width: 250px;
	height: fit-content;
	position: sticky;
	top: 20px;
}
.sidebar h2 {
	font-size: 28px;
	font-weight: 500;
	margin-bottom: 30px;
	text-align: center;
	color: #333;
}
.sidebar h2 a.mypage-title {
	text-decoration: none;
	color: #333;
	transition: color 0.3s ease;
}
.sidebar h2 a.mypage-title:hover {
	color: #501845;
	cursor: pointer;
}
.sidebar-menu {
	list-style: none;
}
.sidebar-menu li {
	margin-bottom: 15px;
}
.sidebar-menu a {
	display: block;
	padding: 12px 20px;
	text-decoration: none;
	color: #333;
	font-size: 18px;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.3s ease;
}
.sidebar-menu a:hover {
	background: #f5f5f5;
	color: #501845;
	transform: translateX(5px);
}
.sidebar-menu a.active {
	background: #f5f5f5;
	color: #501845;
}
</style>
<aside class="sidebar">
	<h2><a href="javascript:void(0);" data-content-id="dashboard" class="mypage-title"> 관리자 페이지</a></h2>
	<ul class="sidebar-menu">	
		<li><a id="product-management-menu" href="javascript:void(0);" data-content-id="product-management">상품관리</a></li>
		<li><a id="member-management-menu" href="javascript:void(0);" data-content-id="member-management">회원관리</a></li>
		<li><a id="order-management-menu" href="javascript:void(0);" data-content-id="order-management">주문관리</a></li>
	</ul>
</aside>