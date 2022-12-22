<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/history.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	
	<script src = "../js/history.js"></script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div>
                <h1>check-in</h1>
            </div>
            <ul class="nav">
                <li><a href="../home/list">HOME</a></li>
                <li><a href="../home/compare">COMPARE</a></li>
                <li><a href="list">HISTORY</a></li>
                <li><a href="../tip">TIP</a></li>
                <li>${sessionScope.user.id} 님</li>
            	<li><a href="../logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
        <form method="post" class="section">
            <div class="item">
                <div class="polaroid">
                	<input id="num" name="num" type="hidden">
                	<img id="image" src="${pageContext.request.contextPath}/resources/image/list_no image.png" onerror="this.src='${pageContext.request.contextPath}/resources/image/list_no image.png'">
	                <div class="caption">
	                    <div>
	                        <select name="home" class="home">
	                            <option value="" disabled selected>집을 선택해 주세요</option>
	                            <c:forEach var="item" items="${homeList}">
	                                <option value="${item.code}">${item.name}</option>
	                            </c:forEach>
	                        </select>
	                    </div>	                    
	                    <input name="time" type="text" placeholder="거주기간을 입력해주세요"><br>
	                    <textarea name="problem" class="memo" placeholder="개선사항을 입력해주세요"></textarea>
	                </div>
                </div>
            </div>
            <div class="btn">
                <div><button>등록</button></div>
                <div><a href="list">취소</a></div>
            </div>
        </form>
<!-- section end-->
        <div class="footer">
            <div>COPYRIGHT © check-in All Right Reserved.</div>
        </div>
    </div>
<!-- footer end-->
</body>
</html>