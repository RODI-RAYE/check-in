<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
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
                
                <c:if test="${sessionScope.user == null}">
                	<li><a href="login">LOGIN</a></li>
                	<li><a href="signup">SIGNUP</a></li>
                </c:if>
                
                <c:if test="${sessionScope.user != null}">
                	<li>${sessionScope.user.id} 님</li>
                	<li><a href="logout">LOGOUT</a></li>
                </c:if>
                
            </ul>
        </div>
        <hr>
<!-- header end-->
        <div class="section">
            <div class="section_header">
                <h1><span>check-in</span> 과 함께<br>편리하게 집을 구하세요</h1>
                <span class="button1"><a href="signup">시작하기</a></span>
                <div><a href="login">이미 계정이 있으신가요? 로그인</a></div>
            </div>
            <div>
                <div class="imac_odd">
                    <img src="${pageContext.request.contextPath}/resources/image/index_mac.png">
                    <div class="screen_odd">
                        <div class="viewport_odd" style="background-image:url('${pageContext.request.contextPath}/resources/image/index_main.jpg');"></div>
                    </div>
                </div>
                <div class="contents1">
                    <div class="title">기록하기</div>
                    <div>내가 찾아본 집을 편하게 둘러보세요<br>더 이상 어느 집인지 헷갈리지 마세요</div>
                </div>
            </div>
            <div>
                <div class="contents2">
                    <div class="title">비교하기</div>
                    <div>최대 3개의 집을 한눈에 비교하세요<br>꼼꼼히 살피며 집을 구별하세요</div>
                </div>
                <div class="imac_even">
                    <img src="${pageContext.request.contextPath}/resources/image/index_mac.png">
                    <div class="screen_even">
                        <div class="viewport_even" style="background-image:url('${pageContext.request.contextPath}/resources/image/index_compare.jpg');"></div>
                    </div>
                </div>
            </div>
            <div>
                <div class="imac_odd">
                    <img src="${pageContext.request.contextPath}/resources/image/index_mac.png">
                    <div class="screen_odd">
                        <div class="viewport_odd" style="background-image:url('${pageContext.request.contextPath}/resources/image/index_history.jpg');"></div>
                    </div>
                </div>
                <div class="contents3">
                    <div class="title">저장하기</div>
                    <div>지금까지 살았던 집들을 보관하세요<br>집의 아쉬운 점을 기록하고 참고하세요</div>
                </div>
            </div>
            <div>
                <div class="contents4">
                    <div class="title">생활 팁</div>
                    <div>알아 두면 유용한 정보를 찾아보세요<br>정보는 언젠가 도움이 될 것입니다</div>
                </div>
                <div class="imac_even">
                    <img src="${pageContext.request.contextPath}/resources/image/index_mac.png">
                    <div class="screen_even">
                        <div class="viewport_even" style="background-image:url('${pageContext.request.contextPath}/resources/image/index_tip.jpg');"></div>
                    </div>
                </div>
            </div>
            <div class="button2">
                <span><a href="signup">시작하기</a></span>
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