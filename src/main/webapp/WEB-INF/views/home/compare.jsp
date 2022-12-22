<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compare</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/compare.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src = "../js/compare.js"></script>
</head>


<body>
    <div class="wrap">
        <div class="header">
            <div>
                <h1>check-in</h1>
            </div>
            <ul class="nav">
                <li><a href="list">HOME</a></li>
                <li><a href="compare">COMPARE</a></li>
                <li><a href="../history/list">HISTORY</a></li>
                <li><a href="../tip">TIP</a></li>
                <li>${sessionScope.user.id} 님</li>
            	<li><a href="../logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
        <div class="section">
        	<div class="test"></div>
            <div class="contents">
                <form>
                    <select name="home" class="home">
                        <option value="" disabled selected>비교할 집을 선택하세요</option>
                        <c:forEach var="item" items="${list}">
                        	<option value="${item.code}">${item.name}</option>
                        </c:forEach>
                    </select>
                </form>
                <table class="table">
                    <tr>
                        <td>준공연월</td><td></td>
                        <td>공실기간</td><td></td>
                    </tr>
                    <tr>
                        <td>평수</td><td></td>
                        <td>층수</td><td></td>
                    </tr>
                    <tr>
                        <td>입주가능일</td><td></td>
                        <td>계약기간</td><td></td>

                    </tr>
                    <tr>
                        <td>전세/보증금</td><td></td>
                        <td>월세</td><td></td>
                    </tr>
                    <tr>
                        <td>관리비</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>관리비 포함</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>근처 교통편</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>편의시설</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>악성시설</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>옵션</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>보안</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>채광</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>방향</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>통풍</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>수압</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>물빠짐</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>난방/온수</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>단열/방음</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>곰팡이/해충</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>쓰레기</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>기타</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>특이사항</td><td colspan="3"></td>
                    </tr>
                </table>
            </div>

            <div class="contents_wrap">
                <div class="contents">
                    <form>
                        <select name="home" class="home">
                            <option value="" disabled selected>비교할 집을 선택하세요</option>
                            <c:forEach var="item" items="${list}">
                        		<option value="${item.code}">${item.name}</option>
                        	</c:forEach>
                        </select>
                    </form>
                    <table class="table">
                        <tr>
                            <td>준공연월</td><td></td>
                            <td>공실기간</td><td></td>
                        </tr>
                        <tr>
                            <td>평수</td><td></td>
                            <td>층수</td><td></td>
                        </tr>
                        <tr>
                            <td>입주가능일</td><td></td>
                            <td>계약기간</td><td></td>
    
                        </tr>
                        <tr>
                            <td>전세/보증금</td><td></td>
                            <td>월세</td><td></td>
                        </tr>
                        <tr>
                            <td>관리비</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>관리비 포함</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>근처 교통편</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>편의시설</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>악성시설</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>옵션</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>보안</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>채광</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>방향</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>통풍</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>수압</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>물빠짐</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>난방/온수</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>단열/방음</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>곰팡이/해충</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>쓰레기</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>기타</td><td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>특이사항</td><td colspan="3"></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="contents">
                <form>
                    <select name="home" class="home">
                        <option value="" disabled selected>비교할 집을 선택하세요</option>
                        <c:forEach var="item" items="${list}">
                        	<option value="${item.code}">${item.name}</option>
                        </c:forEach>
                    </select>
                </form>
                <table class="table">
                    <tr>
                        <td>준공연월</td><td></td>
                        <td>공실기간</td><td></td>
                    </tr>
                    <tr>
                        <td>평수</td><td></td>
                        <td>층수</td><td></td>
                    </tr>
                    <tr>
                        <td>입주가능일</td><td></td>
                        <td>계약기간</td><td></td>

                    </tr>
                    <tr>
                        <td>전세/보증금</td><td></td>
                        <td>월세</td><td></td>
                    </tr>
                    <tr>
                        <td>관리비</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>관리비 포함</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>근처 교통편</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>편의시설</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>악성시설</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>옵션</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>보안</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>채광</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>방향</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>통풍</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>수압</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>물빠짐</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>난방/온수</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>단열/방음</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>곰팡이/해충</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>쓰레기</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>기타</td><td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>특이사항</td><td colspan="3"></td>
                    </tr>
                </table>
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