<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <form class="section" method="post" enctype="multipart/form-data">
            <div class="contents1">
                <input type="text" name="name" placeholder="집 이름을 입력해주세요" required>
            </div>
            <div class="contents2">
                <div id="map" style="width:300px; height:300px;"></div>
                <div>
                	<input id="lat" type="hidden" name="lat" value="37.566678088831694">
                	<input id="lng" type="hidden" name="lng" value="126.97841102373792">
                </div>
                <table>
                    <tr>
                        <td>주소</td>
                        <td colspan="7"><input id="address" type="text" name="address"><button id="button" type="button" onclick="search()">search</button></td>
                    </tr>
                    <tr>
                        <td>준공연월</td>
                        <td><input type="text" name="build"></td>
                        <td>공실 기간</td>
                        <td><input type="text" name="vacancy"></td>
                        <td>평수</td>
                        <td><input type="text" name="meter"></td>
                        <td>층수</td>
                        <td><input type="text" name="floor"></td>
                    </tr>
                    <tr>
                        <td>입주 가능일</td>
                        <td><input type="text" name="move"></td>
                        <td>계약 기간</td>
                        <td><input type="text" name="contract"></td>
                        <td>중개인 이름</td>
                        <td><input type="text" name="agent"></td>
                        <td>연락처</td>
                        <td><input type="text" name="tel"></td>
                    </tr>
                    <tr>
                        <td>전세/보증금</td>
                        <td><input type="text" name="deposit"></td>
                        <td>월세</td>
                        <td><input type="text" name="month"></td>
                        <td>관리비</td>
                        <td colspan="4">
                            <input type="text" name="cost">
                        </td>
                    </tr>
                    <tr>
                        <td>관리비 포함</td>
                        <td colspan="7">
                            <label class="check"><input type="checkbox" name="manage" value="가스"><span class="icon"></span>가스</label>
                            <label class="check"><input type="checkbox" name="manage" value="전기"><span class="icon"></span>전기</label>
                            <label class="check"><input type="checkbox" name="manage" value="수도"><span class="icon"></span>수도</label>
                            <label class="check"><input type="checkbox" name="manage" value="인터넷"><span class="icon"></span>인터넷</label>
                            <label class="check"><input type="checkbox" name="manage" value="청소"><span class="icon"></span>청소</label>
                            <label class="check"><input type="checkbox" name="manage" value="엘리베이터"><span class="icon"></span>엘리베이터</label>
                            <label class="check"><input type="checkbox" name="manage" value="주차"><span class="icon"></span>주차</label>
                        </td>
                    </tr>
                    <tr>
                        <td>근처 교통편</td>
                        <td colspan="7">
                            <label>지하철역 도보</label>
                            <input type="text" name="trans1">
                            <label>버스정류장 도보</label>
                            <input type="text" name="trans2">
                            <label>통근시간 약</label>
                            <input type="text" name="trans3">
                        </td>
                    </tr>
                    <tr>
                        <td>편의시설</td>
                        <td colspan="7">
                            <label>(반경 1km)</label>
                            <label class="check"><input type="checkbox" name="good" value="공원"><span class="icon"></span>공원</label>
                            <label class="check"><input type="checkbox" name="good" value="마트"><span class="icon"></span>마트</label>
                            <label class="check"><input type="checkbox" name="good" value="병원"><span class="icon"></span>병원</label>
                            <label class="check"><input type="checkbox" name="good" value="약국"><span class="icon"></span>약국</label>
                            <label class="check"><input type="checkbox" name="good" value="은행"><span class="icon"></span>은행</label>
                            <label class="check"><input type="checkbox" name="good" value="카페"><span class="icon"></span>카페</label>
                            <label class="check"><input type="checkbox" name="good" value="편의점"><span class="icon"></span>편의점</label>
                        </td>
                    </tr>
                    <tr>
                        <td>악성시설</td>
                        <td colspan="7">
                            <label>(반경 30m)</label>
                            <label class="check"><input type="checkbox" name="bad" value="공원"><span class="icon"></span>공원</label>
                            <label class="check"><input type="checkbox" name="bad" value="모텔"><span class="icon"></span>모텔</label>
                            <label class="check"><input type="checkbox" name="bad" value="술집"><span class="icon"></span>술집</label>
                            <label class="check"><input type="checkbox" name="bad" value="유흥가"><span class="icon"></span>유흥가</label>
                            <label class="check"><input type="checkbox" name="bad" value="음식점"><span class="icon"></span>음식점</label>
                            <label class="check"><input type="checkbox" name="bad" value="편의점"><span class="icon"></span>편의점</label>
                            <label class="check"><input type="checkbox" name="bad" value="흡연구역"><span class="icon"></span>흡연구역</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="contents3">
                <table>
                    <tr>
                        <td>옵션</td>
                        <td colspan="4">
                            <label class="check"><input type="checkbox" name="option" value="TV"><span class="icon"></span>TV</label>
                            <label class="check"><input type="checkbox" name="option" value="에어컨"><span class="icon"></span>에어컨</label>
                            <label class="check"><input type="checkbox" name="option" value="침대"><span class="icon"></span>침대</label>
                            <label class="check"><input type="checkbox" name="option" value="옷장"><span class="icon"></span>옷장</label>
                            <label class="check"><input type="checkbox" name="option" value="식탁"><span class="icon"></span>식탁</label>
                            <label class="check"><input type="checkbox" name="option" value="냉장고"><span class="icon"></span>냉장고</label>
                            <label class="check"><input type="checkbox" name="option" value="인덕션"><span class="icon"></span>인덕션</label>
                            <label class="check"><input type="checkbox" name="option" value="가스레인지"><span class="icon"></span>가스레인지</label>
                            <label class="check"><input type="checkbox" name="option" value="전자레인지"><span class="icon"></span>전자레인지</label>
                            <label class="check"><input type="checkbox" name="option" value="세탁기"><span class="icon"></span>세탁기</label>
                            <label class="check"><input type="checkbox" name="option" value="신발장"><span class="icon"></span>신발장</label>
                        </td>
                    </tr>
                    <tr>
                        <td>보안</td>
                        <td colspan="4">
                            <label class="check"><input type="checkbox" name="safe" value="CCTV"><span class="icon"></span>CCTV</label>
                            <label class="check"><input type="checkbox" name="safe" value="공동현관 잠금장치"><span class="icon"></span>공동현관 잠금장치</label>
                            <label class="check"><input type="checkbox" name="safe" value="현관 도어락"><span class="icon"></span>현관 도어락</label>
                            <label class="check"><input type="checkbox" name="safe" value="현관 이중잠금장치"><span class="icon"></span>현관 이중잠금장치</label>
                            <label class="check"><input type="checkbox" name="safe" value="인터폰"><span class="icon"></span>인터폰</label>
                            <label class="check"><input type="checkbox" name="safe" value="방범창"><span class="icon"></span>방범창</label>
                            <label class="check"><input type="checkbox" name="safe" value="경비실"><span class="icon"></span>경비실</label>
                            <label class="check"><input type="checkbox" name="safe" value="택배 보관장소"><span class="icon"></span>택배 보관장소</label>
                            <label class="check"><input type="checkbox" name="safe" value="가로등"><span class="icon"></span>가로등</label>
                        </td>
                    </tr>
                    <tr>
                        <td>채광</td>
                        <td>
                            <label class="check"><input type="radio" name="light" value="매우 좋다"><span class="icon"></span>매우 좋음</label>
                            <label class="check"><input type="radio" name="light" value="좋음"><span class="icon"></span>좋음</label>
                            <label class="check"><input type="radio" name="light" value="보통"><span class="icon"></span>보통</label>
                            <label class="check"><input type="radio" name="light" value="나쁨"><span class="icon"></span>나쁨</label>
                            <label class="check"><input type="radio" name="light" value="매우 나쁨"><span class="icon"></span>매우 나쁨</label>
                        </td>
                        <td>난방/온수</td>
                        <td>
                            <label class="check"><input type="checkbox" name="heat" value="중앙난방"><span class="icon"></span>중앙난방</label>
                            <label class="check"><input type="checkbox" name="heat" value="개별난방"><span class="icon"></span>개별난방</label>
                            <label class="check"><input type="checkbox" name="heat" value="도시가스"><span class="icon"></span>도시가스</label>
                            <label class="check"><input type="checkbox" name="heat" value="LPG"><span class="icon"></span>LPG</label>
                            <label class="check"><input type="checkbox" name="heat" value="심야전기"><span class="icon"></span>심야전기</label>
                            <label class="check"><input type="checkbox" name="heat" value="기름"><span class="icon"></span>기름</label>
                        </td>
                    </tr>
                    <tr>
                        <td>방향</td>
                        <td>
                            <label class="check"><input type="radio" name="way" value="남향"><span class="icon"></span>남향</label>
                            <label class="check"><input type="radio" name="way" value="동향"><span class="icon"></span>동향</label>
                            <label class="check"><input type="radio" name="way" value="서향"><span class="icon"></span>서향</label>
                            <label class="check"><input type="radio" name="way" value="북향"><span class="icon"></span>북향</label>
                        </td>
                        <td>단열/방음</td>
                        <td>
                            <label>(벽 소리)</label>
                            <label class="check"><input type="checkbox" name="sound" value="단단한소리"><span class="icon"></span>단단한소리</label>
                            <label class="check"><input type="checkbox" name="sound" value="텅빈 소리"><span class="icon"></span>텅빈 소리</label>
                            <label class="check"><input type="checkbox" name="sound" value="중문"><span class="icon"></span>중문</label>
                            <label class="check"><input type="checkbox" name="sound" value="이중창"><span class="icon"></span>이중창</label>
                            <label class="check"><input type="checkbox" name="sound" value="외풍"><span class="icon"></span>외풍</label>
                        </td>
                    </tr>
                    <tr>
                        <td>통풍</td>
                        <td>
                            <label class="check"><input type="checkbox" name="wind" value="맞바람 구조"><span class="icon"></span>맞바람 구조</label>
                            <label class="check"><input type="checkbox" name="wind" value="화장실 창문"><span class="icon"></span>화장실 창문</label>
                            <label class="check"><input type="checkbox" name="wind" value="화장실 환풍기"><span class="icon"></span>화장실 환풍기</label>
                        </td>
                        <td>곰팡이/해충</td>
                        <td>
                            <label class="check"><input type="checkbox" name="mold" value="곰팡이"><span class="icon"></span>곰팡이</label>
                            <label class="check"><input type="checkbox" name="mold" value="결로현상"><span class="icon"></span>결로현상</label>
                            <label class="check"><input type="checkbox" name="mold" value="누수흔적"><span class="icon"></span>누수흔적</label>
                            <label class="check"><input type="checkbox" name="mold" value="방충망"><span class="icon"></span>방충망</label>
                            <label class="check"><input type="checkbox" name="mold" value="가구 밑/뒤 벌레"><span class="icon"></span>가구 밑/뒤 벌레</label>
                        </td>
                    </tr>
                    <tr>
                        <td>수압</td>
                        <td>
                            <label class="check"><input type="checkbox" name="water" value="싱크대"><span class="icon"></span>싱크대</label>
                            <label class="check"><input type="checkbox" name="water" value="세면대"><span class="icon"></span>세면대</label>
                            <label class="check"><input type="checkbox" name="water" value="샤워기"><span class="icon"></span>샤워기</label>
                            <label class="check"><input type="checkbox" name="water" value="변기"><span class="icon"></span>변기</label>
                        </td>
                        <td>쓰레기</td>
                        <td>
                            종량제 <input type="text" name="trash1" placeholder="배출장소">
                            분리수거 <input type="text" name="trash2" placeholder="배출장소">
                            음식물 <input type="text" name="trash3"placeholder="배출장소">
                        </td>
                    </tr>
                    <tr>
                        <td>물빠짐</td>
                        <td>
                            <label class="check"><input type="checkbox" name="drip" value="싱크대"><span class="icon"></span>싱크대</label>
                            <label class="check"><input type="checkbox" name="drip" value="세면대"><span class="icon"></span>세면대</label>
                            <label class="check"><input type="checkbox" name="drip" value="화장실 바닥"><span class="icon"></span>화장실 바닥</label>
                        </td>
                        <td>기타</td>
                        <td>
                            <label class="check"><input type="checkbox" name="etc" value="관리업체"><span class="icon"></span>관리업체</label>
                            <label class="check"><input type="checkbox" name="etc" value="반려동물"><span class="icon"></span>반려동물</label>
                            <label class="check"><input type="checkbox" name="etc" value="흡연금지"><span class="icon"></span>흡연금지</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label>특이사항</label></td>
                        <td colspan="3"><textarea class="memo" name="memo"></textarea></td>
                    </tr>               
                </table>
            </div>
            <div class="contents4">
                <label for="photo"><i class="fas fa-plus"></i></label>
                <input type="file" name="photo" id="photo" accept=".jpg, .png, .gif" style="display:none;" multiple>
        		<div id="preview">
        			<div id="one"><img src="${pageContext.request.contextPath}/resources/image/form_no image.jpg"></div>                   
                </div>
			</div>
                <!-- Swiper
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper" id="preview">
						<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/image/preview image.png"></div>
						<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/image/preview image.png"></div>
						<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/image/preview image.png"></div>
					</div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div> -->
                <div class="button">
                   <span><button>등록</button></span>
                    <span><a href="list">취소</a></span>
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
        	center: new kakao.maps.LatLng(37.566678088831694, 126.97841102373792), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
    	};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
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
        	$('#preview').empty();
			        	
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