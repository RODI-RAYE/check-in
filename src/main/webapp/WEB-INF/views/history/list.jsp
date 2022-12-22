<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/83d190ca68.js" crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/history.css">
    
    <script>
    	$(function() {
    		autosize($(".memo"));
    	});
    </script>
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
            	<li><a href="/logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
		<a href="add"><i class="fas fa-plus icon"></i></a>
        <div class="section">

			<c:if test="${list.size() < 1}">
				<div id="msg">
                    <p>등록된 집이 없습니다<br></p>			
                    <p><i class="fas fa-plus"></i> 를 눌러 추가해 주세요</p>
                </div>
		    </c:if>
		    
		    <c:forEach var="item" items="${list}">
			    <div class="item"><a href="update/${item.code}">
	                <div class="polaroid">	  
	                	<img src="/upload/${item.uuid}_${item.filename}">
	                    <div class="caption">
		                    <div>${item.homeName}</div>
		                    <div>${item.time}</div>
		                    <textarea class="memo" readonly>${item.problem}</textarea>
	                    </div>
	                </div>
	            </a></div>
		    </c:forEach>
        </div>
<!-- section end-->
        <div class="footer">
            <div>COPYRIGHT © check-in All Right Reserved.</div>
        </div>
    </div>
<!-- footer end-->
</body>
</html>