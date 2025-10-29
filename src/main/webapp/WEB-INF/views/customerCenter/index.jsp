<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .tab-menu {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }
        .tab-menu button {
            background: none;
            border: none;
            font-size: 16px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .tab-menu button.active {
            border-bottom: 3px solid #007BFF;
            font-weight: bold;
            color: #007BFF;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
        .loading {
            padding: 20px;
            color: gray;
        }
    </style>
</head>
<body>
 
	<h2>고객센터</h2>
	<br>
	<div class="tab-menu">
        <button class="tab-btn active" data-target="notice">공지사항</button>
        <button class="tab-btn" data-target="review">후기</button>
        <button class="tab-btn" data-target="inquiry">문의</button>
        <button class="tab-btn" data-target="report">신고</button>
    </div>
   
    <!-- 탭 컨텐츠 -->
    <div id="notice" class="tab-content active">
        <div class="loading">불러오는 중...</div>
    </div>
    <div id="review" class="tab-content">
        <div class="loading">불러오는 중...</div>
    </div>
    <div id="inquiry" class="tab-content">
        <div class="loading">불러오는 중...</div>
    </div>
    <div id="report" class="tab-content">
        <div class="loading">불러오는 중...</div>
    </div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        // 첫 번째 탭(공지사항) 자동 로드
        $(document).ready(function() {
            $("#notice").load("/notice/list");
        });

        // 탭 클릭 이벤트
        $(".tab-btn").on("click", function() {
            $(".tab-btn").removeClass("active");
            $(this).addClass("active");

            var target = $(this).data("target");
            $(".tab-content").removeClass("active");
            $("#" + target).addClass("active");

            // 탭 클릭 시 해당 게시판 목록을 Ajax로 불러오기
            $("#" + target).html('<div class="loading">불러오는 중...</div>');
            $("#" + target).load("/" + target + "/list");
        });
    </script>

</body>
</html>