<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tip</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tip.css">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/83d190ca68.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div>
                <h1>check-in</h1>
            </div>
            <ul class="nav">
                <li><a href="home/list">HOME</a></li>
                <li><a href="home/compare">COMPARE</a></li>
                <li><a href="history/list">HISTORY</a></li>
                <li><a href="tip">TIP</a></li>
                <li>user 님</li>
            	<li><a href="/logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
        <div class="section">
            <div class="search">
                <form>
                    <input type="search" placeholder="search">
                    <a href="#"><i class="fas fa-search"></i></a>
                </form>
            </div>
            <div class="container">
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_1.JPG">
                    </div>
                    <p>크리스마스 분위기 내는 간단 스타일링</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_2.JPG">
                    </div>
                    <p>이케아 내돈내산 BEST 10</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_3.JPG">
                    </div>
                    <p>집밥부터 홈파티까지, 우리 집 커트러리</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_4.JPG">
                    </div>
                    <p>주간 인기 사진 소개</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_5.JPG">
                    </div>
                    <p>주방 관리와 효율적인 수납을 위한 정리</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_6.JPG">
                    </div>
                    <p>베이킹소다 어디까지 써봤니?</p>
                </a>
                <a href="#">
                    <div class="photo">
                        <img class="photograph" src="${pageContext.request.contextPath}/resources/image/tip_7.JPG">
                    </div>
                    <p>우리집 홈카페</p>
                </a>
            </div>

        </div>
<!-- section end-->
        <div class="footer">
            <div>COPYRIGHT © check-in All Right Reserved.</div>
        </div>
    </div>
<!-- footer end-->
</body>
</html>