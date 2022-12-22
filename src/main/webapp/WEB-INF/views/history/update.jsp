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
	
	<script src = "../../js/history.js"></script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div>
                <h1>check-in</h1>
            </div>
            <ul class="nav">
                <li><a href="../../home/list">HOME</a></li>
                <li><a href="../../home/compare">COMPARE</a></li>
                <li><a href="../list">HISTORY</a></li>
                <li><a href="../../tip">TIP</a></li>
                <li>${sessionScope.user.id} 님</li>
            	<li><a href="../../logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
        <form method="post" class="section">
            <div class="item">
                <div class="polaroid"><img id="image" src="/upload/${item.uuid}_${item.filename}">
	                <div class="caption">
	                    <div>
	                        <select name="home" class="home">
	                            <c:forEach var="home" items="${homeList}">
	                                <option value="${home.code}" ${item.home == home.code ? 'selected' : ''}>${home.name}</option>
	                            </c:forEach>
	                        </select>
	                    </div>	  
	                    <input name="num" type="hidden" id="num" value="${item.num}">                  
	                    <input name="time" type="text" value="${item.time}"><br>
	                    <textarea name="problem" class="memo">${item.problem}</textarea>
	                </div>
                </div>
            </div>
            <div class="btn">
                <div><button>변경</button></div>
                <div><a href="../list">취소</a></div>
                <div><a href="../delete/${item.code}">삭제</a></div>
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