<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/83d190ca68.js" crossorigin="anonymous"></script>

    <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    
    <!-- map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3283bae1d9b50abce41528f72518dc1&libraries=services"></script>
        
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div>
                <h1>check-in</h1>
            </div>
            <ul class="nav">
                <li><a href="../list">HOME</a></li>
                <li><a href="../compare">COMPARE</a></li>
                <li><a href="../../history/list">HISTORY</a></li>
                <li><a href="../../tip">TIP</a></li>
                <li>${sessionScope.user.id} 님</li>
            	<li><a href="../../logout">LOGOUT</a></li>
            </ul>
        </div>
        <hr>
<!-- header end-->
        <form class="section" method="post" enctype="multipart/form-data">
            <div class="contents1">
                <input type="text" name="name" value="${item.name}">
                <div>
                    <a href="../delete/${item.code}"><i class="fas fa-times"></i></a>
                </div>
            </div>
            <div class="contents2">
                <div id="map" style="width:300px; height:300px;"></div>
                <div>
                	<input id="lat" type="hidden" name="lat" value="${item.lat}">
                	<input id="lng" type="hidden" name="lng" value="${item.lng}">
                </div>
                <table>
                    <tr>
                        <td>주소</td>
                        <td colspan="7"><input id="address" type="text" name="address" value="${item.address}"><button id="button" type="button" onclick="search()">search</button></td>
                    </tr>
                    <tr>
                        <td>준공연월</td>
                        <td><input type="text" name="build" value="${item.build}"></td>
                        <td>공실 기간</td>
                        <td><input type="text" name="vacancy" value="${item.vacancy}"></td>
                        <td>평수</td>
                        <td><input type="text" name="meter" value="${item.meter}"></td>
                        <td>층수</td>
                        <td><input type="text" name="floor" value="${item.floor}"></td>
                    </tr>
                    <tr>
                        <td>입주 가능일</td>
                        <td><input type="text" name="move" value="${item.move}"></td>
                        <td>계약 기간</td>
                        <td><input type="text" name="contract" value="${item.contract}"></td>
                        <td>중개인 이름</td>
                        <td><input type="text" name="agent" value="${item.agent}"></td>
                        <td>연락처</td>
                        <td><input type="text" name="tel" value="${item.tel}"></td>
                    </tr>
                    <tr>
                        <td>전세/보증금</td>
                        <td><input type="text" name="deposit" value="${item.deposit}"></td>
                        <td>월세</td>
                        <td><input type="text" name="month" value="${item.month}"></td>
                        <td>관리비</td>
                        <td colspan="4">
                            <input type="text" name="cost" value="${item.cost}">
                        </td>
                    </tr>
                    <tr>
                        <td>관리비 포함</td>
                        <td colspan="7">
                            <label class="check"><input type="checkbox" name="manage" value="가스" <c:if test="${fn:contains(item.manage, '가스')}">checked</c:if> ><span class="icon"></span>가스</label>
                            <label class="check"><input type="checkbox" name="manage" value="전기" <c:if test="${fn:contains(item.manage, '전기')}">checked</c:if> ><span class="icon"></span>전기</label>
                            <label class="check"><input type="checkbox" name="manage" value="수도" <c:if test="${fn:contains(item.manage, '수도')}">checked</c:if> ><span class="icon"></span>수도</label>
                            <label class="check"><input type="checkbox" name="manage" value="인터넷" <c:if test="${fn:contains(item.manage, '인터넷')}">checked</c:if> ><span class="icon"></span>인터넷</label>
                            <label class="check"><input type="checkbox" name="manage" value="청소" <c:if test="${fn:contains(item.manage, '청소')}">checked</c:if> ><span class="icon"></span>청소</label>
                            <label class="check"><input type="checkbox" name="manage" value="엘리베이터" <c:if test="${fn:contains(item.manage, '엘리베이터')}">checked</c:if> ><span class="icon"></span>엘리베이터</label>
                            <label class="check"><input type="checkbox" name="manage" value="주차" <c:if test="${fn:contains(item.manage, '주차')}">checked</c:if> ><span class="icon"></span>주차</label>
                        </td>
                    </tr>
                    <tr>
                        <td>근처 교통편</td>
                        <td colspan="7">
                            <label>지하철역 도보</label>
                            <input type="text" name="trans1" value="${item.trans1}">
                            <label>버스정류장 도보</label>
                            <input type="text" name="trans2" value="${item.trans2}">
                            <label>통근시간 약</label>
                            <input type="text" name="trans3" value="${item.trans3}">
                        </td>
                    </tr>
                    <tr>
                        <td>편의시설</td>
                        <td colspan="7">
                            <label>(반경 1km)</label>
                            <label class="check"><input type="checkbox" name="good" value="공원" <c:if test="${fn:contains(item.good, '공원')}">checked</c:if> ><span class="icon"></span>공원</label>
                            <label class="check"><input type="checkbox" name="good" value="마트" <c:if test="${fn:contains(item.good, '마트')}">checked</c:if> ><span class="icon"></span>마트</label>
                            <label class="check"><input type="checkbox" name="good" value="병원" <c:if test="${fn:contains(item.good, '병원')}">checked</c:if> ><span class="icon"></span>병원</label>
                            <label class="check"><input type="checkbox" name="good" value="약국" <c:if test="${fn:contains(item.good, '약국')}">checked</c:if> ><span class="icon"></span>약국</label>
                            <label class="check"><input type="checkbox" name="good" value="은행" <c:if test="${fn:contains(item.good, '은행')}">checked</c:if> ><span class="icon"></span>은행</label>
                            <label class="check"><input type="checkbox" name="good" value="카페" <c:if test="${fn:contains(item.good, '카페')}">checked</c:if> ><span class="icon"></span>카페</label>
                            <label class="check"><input type="checkbox" name="good" value="편의점" <c:if test="${fn:contains(item.good, '편의점')}">checked</c:if> ><span class="icon"></span>편의점</label>
                        </td>
                    </tr>
                    <tr>
                        <td>악성시설</td>
                        <td colspan="7">
                            <label>(반경 30m)</label>
                            <label class="check"><input type="checkbox" name="bad" value="공원" <c:if test="${fn:contains(item.bad, '공원')}">checked</c:if> ><span class="icon"></span>공원</label>
                            <label class="check"><input type="checkbox" name="bad" value="모텔" <c:if test="${fn:contains(item.bad, '모텔')}">checked</c:if> ><span class="icon"></span>모텔</label>
                            <label class="check"><input type="checkbox" name="bad" value="술집" <c:if test="${fn:contains(item.bad, '술집')}">checked</c:if> ><span class="icon"></span>술집</label>
                            <label class="check"><input type="checkbox" name="bad" value="유흥가" <c:if test="${fn:contains(item.bad, '유흥가')}">checked</c:if> ><span class="icon"></span>유흥가</label>
                            <label class="check"><input type="checkbox" name="bad" value="음식점" <c:if test="${fn:contains(item.bad, '음식점')}">checked</c:if> ><span class="icon"></span>음식점</label>
                            <label class="check"><input type="checkbox" name="bad" value="편의점" <c:if test="${fn:contains(item.bad, '편의점')}">checked</c:if> ><span class="icon"></span>편의점</label>
                            <label class="check"><input type="checkbox" name="bad" value="흡연구역" <c:if test="${fn:contains(item.bad, '흡연구역')}">checked</c:if> ><span class="icon"></span>흡연구역</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="contents3">
                <table>
                    <tr>
                        <td>옵션</td>
                        <td colspan="4">
                            <label class="check"><input type="checkbox" name="option" value="TV" <c:if test="${fn:contains(item.option, 'TV')}">checked</c:if> ><span class="icon"></span>TV</label>
                            <label class="check"><input type="checkbox" name="option" value="에어컨" <c:if test="${fn:contains(item.option, '에어컨')}">checked</c:if> ><span class="icon"></span>에어컨</label>
                            <label class="check"><input type="checkbox" name="option" value="침대" <c:if test="${fn:contains(item.option, '침대')}">checked</c:if> ><span class="icon"></span>침대</label>
                            <label class="check"><input type="checkbox" name="option" value="옷장" <c:if test="${fn:contains(item.option, '옷장')}">checked</c:if> ><span class="icon"></span>옷장</label>
                            <label class="check"><input type="checkbox" name="option" value="식탁" <c:if test="${fn:contains(item.option, '식탁')}">checked</c:if> ><span class="icon"></span>식탁</label>
                            <label class="check"><input type="checkbox" name="option" value="냉장고" <c:if test="${fn:contains(item.option, '냉장고')}">checked</c:if> ><span class="icon"></span>냉장고</label>
                            <label class="check"><input type="checkbox" name="option" value="인덕션" <c:if test="${fn:contains(item.option, '인덕션')}">checked</c:if> ><span class="icon"></span>인덕션</label>
                            <label class="check"><input type="checkbox" name="option" value="가스레인지" <c:if test="${fn:contains(item.option, '가스레인지')}">checked</c:if> ><span class="icon"></span>가스레인지</label>
                            <label class="check"><input type="checkbox" name="option" value="전자레인지" <c:if test="${fn:contains(item.option, '전자레인지')}">checked</c:if> ><span class="icon"></span>전자레인지</label>
                            <label class="check"><input type="checkbox" name="option" value="세탁기" <c:if test="${fn:contains(item.option, '세탁기')}">checked</c:if> ><span class="icon"></span>세탁기</label>
                            <label class="check"><input type="checkbox" name="option" value="신발장" <c:if test="${fn:contains(item.option, '신발장')}">checked</c:if> ><span class="icon"></span>신발장</label>
                        </td>
                    </tr>
                    <tr>
                        <td>보안</td>
                        <td colspan="4">
                            <label class="check"><input type="checkbox" name="safe" value="CCTV" <c:if test="${fn:contains(item.safe, 'CCTV')}">checked</c:if> ><span class="icon"></span>CCTV</label>
                            <label class="check"><input type="checkbox" name="safe" value="공동현관 잠금장치" <c:if test="${fn:contains(item.safe, '공동현관 잠금장치')}">checked</c:if> ><span class="icon"></span>공동현관 잠금장치</label>
                            <label class="check"><input type="checkbox" name="safe" value="현관 도어락" <c:if test="${fn:contains(item.safe, '현관 도어락')}">checked</c:if> ><span class="icon"></span>현관 도어락</label>
                            <label class="check"><input type="checkbox" name="safe" value="현관 이중잠금장치" <c:if test="${fn:contains(item.safe, '현관 이중잠금장치')}">checked</c:if> ><span class="icon"></span>현관 이중잠금장치</label>
                            <label class="check"><input type="checkbox" name="safe" value="인터폰" <c:if test="${fn:contains(item.safe, '인터폰')}">checked</c:if> ><span class="icon"></span>인터폰</label>
                            <label class="check"><input type="checkbox" name="safe" value="방범창" <c:if test="${fn:contains(item.safe, '방범창')}">checked</c:if> ><span class="icon"></span>방범창</label>
                            <label class="check"><input type="checkbox" name="safe" value="경비실" <c:if test="${fn:contains(item.safe, '경비실')}">checked</c:if> ><span class="icon"></span>경비실</label>
                            <label class="check"><input type="checkbox" name="safe" value="택배 보관장소" <c:if test="${fn:contains(item.safe, '택배 보관장소')}">checked</c:if> ><span class="icon"></span>택배 보관장소</label>
                            <label class="check"><input type="checkbox" name="safe" value="가로등" <c:if test="${fn:contains(item.safe, '가로등')}">checked</c:if> ><span class="icon"></span>가로등</label>
                        </td>
                    </tr>
                    <tr>
                        <td>채광</td>
                        <td>
                            <label class="check"><input type="radio" name="light" value="매우 좋다" <c:if test="${fn:contains(item.light, '매우 좋다')}">checked</c:if> ><span class="icon"></span>매우 좋음</label>
                            <label class="check"><input type="radio" name="light" value="좋음" <c:if test="${fn:contains(item.light, '좋음')}">checked</c:if> ><span class="icon"></span>좋음</label>
                            <label class="check"><input type="radio" name="light" value="보통" <c:if test="${fn:contains(item.light, '보통')}">checked</c:if> ><span class="icon"></span>보통</label>
                            <label class="check"><input type="radio" name="light" value="나쁨" <c:if test="${fn:contains(item.light, '나쁨')}">checked</c:if> ><span class="icon"></span>나쁨</label>
                            <label class="check"><input type="radio" name="light" value="매우 나쁨" <c:if test="${fn:contains(item.light, '매우 나쁨')}">checked</c:if> ><span class="icon"></span>매우 나쁨</label>
                        </td>
                        <td>난방/온수</td>
                        <td>
                            <label class="check"><input type="checkbox" name="heat" value="중앙난방" <c:if test="${fn:contains(item.heat, '중앙난방')}">checked</c:if> ><span class="icon"></span>중앙난방</label>
                            <label class="check"><input type="checkbox" name="heat" value="개별난방" <c:if test="${fn:contains(item.heat, '개별난방')}">checked</c:if> ><span class="icon"></span>개별난방</label>
                            <label class="check"><input type="checkbox" name="heat" value="도시가스" <c:if test="${fn:contains(item.heat, '도시가스')}">checked</c:if> ><span class="icon"></span>도시가스</label>
                            <label class="check"><input type="checkbox" name="heat" value="LPG" <c:if test="${fn:contains(item.heat, 'LPG')}">checked</c:if> ><span class="icon"></span>LPG</label>
                            <label class="check"><input type="checkbox" name="heat" value="심야전기" <c:if test="${fn:contains(item.heat, '심야전기')}">checked</c:if> ><span class="icon"></span>심야전기</label>
                            <label class="check"><input type="checkbox" name="heat" value="기름" <c:if test="${fn:contains(item.heat, '기름')}">checked</c:if> ><span class="icon"></span>기름</label>
                        </td>
                    </tr>
                    <tr>
                        <td>방향</td>
                        <td>
                            <label class="check"><input type="radio" name="way" value="남향" <c:if test="${fn:contains(item.way, '남향')}">checked</c:if> ><span class="icon"></span>남향</label>
                            <label class="check"><input type="radio" name="way" value="동향" <c:if test="${fn:contains(item.way, '동향')}">checked</c:if> ><span class="icon"></span>동향</label>
                            <label class="check"><input type="radio" name="way" value="서향" <c:if test="${fn:contains(item.way, '서향')}">checked</c:if> ><span class="icon"></span>서향</label>
                            <label class="check"><input type="radio" name="way" value="북향" <c:if test="${fn:contains(item.way, '북향')}">checked</c:if> ><span class="icon"></span>북향</label>
                        </td>
                        <td>단열/방음</td>
                        <td>
                            <label>(벽 소리)</label>
                            <label class="check"><input type="checkbox" name="sound" value="단단한소리" <c:if test="${fn:contains(item.sound, '단단한소리')}">checked</c:if> ><span class="icon"></span>단단한소리</label>
                            <label class="check"><input type="checkbox" name="sound" value="텅빈 소리" <c:if test="${fn:contains(item.sound, '텅빈 소리')}">checked</c:if> ><span class="icon"></span>텅빈 소리</label>
                            <label class="check"><input type="checkbox" name="sound" value="중문" <c:if test="${fn:contains(item.sound, '중문')}">checked</c:if> ><span class="icon"></span>중문</label>
                            <label class="check"><input type="checkbox" name="sound" value="이중창" <c:if test="${fn:contains(item.sound, '이중창')}">checked</c:if> ><span class="icon"></span>이중창</label>
                            <label class="check"><input type="checkbox" name="sound" value="외풍" <c:if test="${fn:contains(item.sound, '외풍')}">checked</c:if> ><span class="icon"></span>외풍</label>
                        </td>
                    </tr>
                    <tr>
                        <td>통풍</td>
                        <td>
                            <label class="check"><input type="checkbox" name="wind" value="맞바람 구조" <c:if test="${fn:contains(item.wind, '맞바람 구조')}">checked</c:if> ><span class="icon"></span>맞바람 구조</label>
                            <label class="check"><input type="checkbox" name="wind" value="화장실 창문" <c:if test="${fn:contains(item.wind, '화장실 창문')}">checked</c:if> ><span class="icon"></span>화장실 창문</label>
                            <label class="check"><input type="checkbox" name="wind" value="화장실 환풍기" <c:if test="${fn:contains(item.wind, '화장실 환풍기')}">checked</c:if> ><span class="icon"></span>화장실 환풍기</label>
                        </td>
                        <td>곰팡이/해충</td>
                        <td>
                            <label class="check"><input type="checkbox" name="mold" value="곰팡이" <c:if test="${fn:contains(item.mold, '곰팡이')}">checked</c:if> ><span class="icon"></span>곰팡이</label>
                            <label class="check"><input type="checkbox" name="mold" value="결로현상" <c:if test="${fn:contains(item.mold, '결로현상')}">checked</c:if> ><span class="icon"></span>결로현상</label>
                            <label class="check"><input type="checkbox" name="mold" value="누수흔적" <c:if test="${fn:contains(item.mold, '누수흔적')}">checked</c:if> ><span class="icon"></span>누수흔적</label>
                            <label class="check"><input type="checkbox" name="mold" value="방충망" <c:if test="${fn:contains(item.mold, '방충망')}">checked</c:if> ><span class="icon"></span>방충망</label>
                            <label class="check"><input type="checkbox" name="mold" value="가구 밑/뒤 벌레" <c:if test="${fn:contains(item.mold, '가구 밑/뒤 벌레')}">checked</c:if> ><span class="icon"></span>가구 밑/뒤 벌레</label>
                        </td>
                    </tr>
                    <tr>
                        <td>수압</td>
                        <td>
                            <label class="check"><input type="checkbox" name="water" value="싱크대" <c:if test="${fn:contains(item.water, '싱크대')}">checked</c:if> ><span class="icon"></span>싱크대</label>
                            <label class="check"><input type="checkbox" name="water" value="세면대" <c:if test="${fn:contains(item.water, '세면대')}">checked</c:if> ><span class="icon"></span>세면대</label>
                            <label class="check"><input type="checkbox" name="water" value="샤워기" <c:if test="${fn:contains(item.water, '샤워기')}">checked</c:if> ><span class="icon"></span>샤워기</label>
                            <label class="check"><input type="checkbox" name="water" value="변기" <c:if test="${fn:contains(item.water, '변기')}">checked</c:if> ><span class="icon"></span>변기</label>
                        </td>
                        <td>쓰레기</td>
                        <td>
                            종량제 <input type="text" name="trash1" value="${item.trash1}">
                            분리수거 <input type="text" name="trash2" value="${item.trash2}">
                            음식물 <input type="text" name="trash3" value="${item.trash3}">
                        </td>
                    </tr>
                    <tr>
                        <td>물빠짐</td>
                        <td>
                            <label class="check"><input type="checkbox" name="drip" value="싱크대" <c:if test="${fn:contains(item.drip, '싱크대')}">checked</c:if> ><span class="icon"></span>싱크대</label>
                            <label class="check"><input type="checkbox" name="drip" value="세면대" <c:if test="${fn:contains(item.drip, '세면대')}">checked</c:if> ><span class="icon"></span>세면대</label>
                            <label class="check"><input type="checkbox" name="drip" value="화장실 바닥" <c:if test="${fn:contains(item.drip, '화장실 바닥')}">checked</c:if> ><span class="icon"></span>화장실 바닥</label>
                        </td>
                        <td>기타</td>
                        <td>
                            <label class="check"><input type="checkbox" name="etc" value="관리업체" <c:if test="${fn:contains(item.etc, '관리업체')}">checked</c:if> ><span class="icon"></span>관리업체</label>
                            <label class="check"><input type="checkbox" name="etc" value="반려동물" <c:if test="${fn:contains(item.etc, '반려동물')}">checked</c:if> ><span class="icon"></span>반려동물</label>
                            <label class="check"><input type="checkbox" name="etc" value="흡연금지" <c:if test="${fn:contains(item.etc, '흡연금지')}">checked</c:if> ><span class="icon"></span>흡연금지</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label>특이사항</label></td>
                        <td colspan="3"><textarea class="memo" name="memo">${item.memo}</textarea></td>
                    </tr>               
                </table>
            </div>
            <div class="contents4">
                <label for="photo"><i class="fas fa-plus"></i></label>
                <input type="file" name="photo" id="photo" accept=".jpg, .png, .gif" style="display:none;" multiple>
        		<div id="preview">
               		<c:if test="${empty item.images.get(0).uuid}">
						<div id="one"><img src="${pageContext.request.contextPath}/resources/image/form_no image.jpg"></div>
					</c:if>
					<c:if test="${not empty item.images.get(0).uuid}">
						<c:forEach var="image" items="${item.images}">
							<div class="item"><img src="/upload/${image.uuid}_${image.filename}"/><span><i class="fas fa-times"></i></span></div>
						</c:forEach>
					</c:if>
        		</div>
                <!-- Swiper 
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                      	<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/image/preview image.png"></div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div> -->
                <div class="button">
                    <span><button>수정</button></span>
                    <span><a href="../list">취소</a></span>
                </div>
            </div>
        </form>
<!-- section end-->
        <div class="footer">
            <div>COPYRIGHT © check-in All Right Reserved.</div>
        </div>
    </div>
<!-- footer end-->
	<script>
		<!-- map API -->
		var lat = document.getElementById('lat').value;
		var lng = document.getElementById('lng').value;
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    	mapOption = {
	        	center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
	        	level: 3 // 지도의 확대 레벨
	    	};  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(lat, lng);
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		function search() {
			var search = document.getElementById('address').value;
			geocoder.addressSearch(search , function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			    if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
		            	map: map,
			            position: coords
			        });
			        
			        document.getElementById('lat').value=result[0].y;
			        document.getElementById('lng').value=result[0].x;
			        
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		}
	
	    $(document).ready(function (event) {
	    	<!--Initialize Swiper-->
	        var swiper = new Swiper(".mySwiper", {
	        slidesPerView: 3,
	        spaceBetween: 30,
	        slidesPerGroup: 3,
	        loop: true,
	        loopFillGroupWithBlank: true,
	        pagination: {
	            el: ".swiper-pagination",
	            clickable: true
	        },
	        navigation: {
	            nextEl: ".swiper-button-next",
	            prevEl: ".swiper-button-prev"
	        }
	    });
	        
	        autosize($(".memo"));
	        
	        <!--Image Upload-->
	        var content_files = new Array();
	        
	        $("#photo").change(function (event) {
				        	
	            var files = event.target.files;
	            var arr = Array.prototype.slice.call(files);
	            
	            for(var i=0; i<files.length; i++){
	            	if(!checkFile(files[i].name, files[i].size)) {
	            		return false;
	            	}
	            }
	            
	            console.log(arr);
	            preview(arr);
	            
			}) // .change END
		}); // .ready END

		function checkFile(file, fileSize) {
		   	var regex = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
	     	var maxSize = 10485760; // 10MB
	      	
	      	if(!file.match(regex)){
	      		alert('이미지 파일만 올려주세요');
	      		$("input[type='file']").val("");
	      		return false;
	      	}
	      	
	      	if(fileSize >= maxSize) {
	      		alert('10MB 미만의 이미지 파일을 올려주세요');
	      		$("input[type='file']").val("");
	      		return false;
	      	}
	      	return true;
		} // checkFile END
	      
		function preview(arr) {
			var index = 0;
			arr.forEach(function(f) {
		        if (f.type.match('image.*')) {
		        	var reader = new FileReader();
		        	reader.onload = function (event) {
		           		const image = event.target.result;
		                var img = '<div class="item"><img src="' + image + '"/>';
		                img += '<span onclick="deleteImg('+index+')" id="img'+index+'"><i class="fas fa-times"></i></span></div>';
		                $(img).appendTo('#preview');
		                index++;
					}
					reader.readAsDataURL(f);
				}
			});
			
		} // preview END
		
		function deleteImg(index) {
	        console.log(index);
	        
	        var img_id = "#img"+index;
	        $(img_id).parent().remove();
	        
	    } // deleteImg END
	</script>
</body>
</html>