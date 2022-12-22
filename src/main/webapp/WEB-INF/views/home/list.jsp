<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/83d190ca68.js" crossorigin="anonymous"></script>

    <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
</head>
<body>
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
        <div class="search">
            <form method="GET">
                <input type="text" name="keyword" placeholder="search">
                <button><i class="fas fa-search"></i></button>
            </form>
        </div>
        <a href="add"><i class="fas fa-plus icon"></i></a>
    </div>
	<c:if test="${list.size() < 1}">
		<div id="msg">
			<p>등록된 집이 없습니다<br></p>			
			<p><i class="fas fa-plus"></i> 를 눌러 추가해 주세요</p>
		</div>
    </c:if>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
        	<c:forEach var="item" items="${list}">
        		<div class="swiper-slide">
	            	<div class="product"><a href="update/${item.code}">
	            	
						<c:if test="${empty item.images.get(0).uuid}">
                        	<img class="photograph" src="${pageContext.request.contextPath}/resources/image/list_no image.png">
                        </c:if>
                        
						<c:if test="${not empty item.images.get(0).uuid}" >
							<img class="photograph" src="/upload/${item.images.get(0).uuid}_${item.images.get(0).filename}">
						</c:if>						
						
	                  <!-- <img class="photograph" src="/upload/${image.uuid}_${image.filename}" alt=""> -->
	                  <p class="date"><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm"/></p>
	                  <p class="name">${item.name}</p>
	                </a></div>
             	</div>
        	</c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
        <div class="swiper-pagination"></div>
<!-- section end-->
    <div class="footer">
        <div>COPYRIGHT © check-in All Right Reserved.</div>
    </div>
<!-- footer end-->
<!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        grid: {
          rows: 2,
        },
        spaceBetween: 30,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
        }
      });
    </script>
    <style>
    @font-face {
        font-family: 'BLACKJAR';
        src: url(${pageContext.request.contextPath}/resources/font/BLACKJAR.TTF) format('truetype');
    }

    /* reset */

    * {
        font-family: 'Noto Sans KR', sans-serif;
        color: #000;
        padding: 0px;
        margin: 0px;
        list-style: none;
        text-decoration: none;
        border-collapse: collapse;
    }

    /* header */

    .header {
        width: 1200px;
        height: auto;
        margin: auto;
    }
    .header > div > h1 {
        font-family: 'BLACKJAR';
        font-size: 40px;
        text-align: center;
    }
    .nav {
        display: flex;
        margin-top: 20px;
    }
    .nav > li:nth-child(n+1):nth-child(-n+4) {
        margin-right: 70px;
    }
    .nav > li:nth-child(5) {
        margin-left: auto;
    }
    .nav > li:last-child {
        margin-left: 70px;
    }
    hr {
        width: 100%;
        margin: 10px;
    }

    /* section */

    .section {
        display: flex;
        width: 1200px;
        margin: 80px auto 50px;
    }
    .icon{
        font-size: 25px;
        line-height: 40px;
    }
    .search {
        border-radius: 5px;
        background: #F6F6F6;
        margin: auto;
    }
    .search > form > input {
        font-size: 20px;
        width: 400px;
        height: 40px;
        border: 0;
        background: #F6F6F6;
        padding-left: 10px;
        margin-left: 5px;
        outline: none;
    }
    .search i {
        font-size: 20px;
        margin: 10px;
    }

    /* swiper */

    html, body {
        height: 100%;
        margin: auto;
    }
    .swiper {
        width: 67%;
        height: 70%;
    }
    .swiper-slide {
        text-align: center;
        height: calc((100% - 30px) / 2);
        display:flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
        justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
	    align-items: center;
    }
    .swiper-slide img {
        display: block;
        width: 400px;
        height: 250px;
        margin: auto;
        object-fit: cover;
    }
    .date {
        font-size: 16px;
    }
    .name {
        font-size: 24px;
        font-weight: 600;
    }
    .swiper-pagination {
        position: relative;
        margin-top: 50px;
    }
    #msg {
    	text-align: center;
    	margin-top: 100px;
	}
	#msg p {
		font-size: 24px;
		margin: 10px;
	}
	button {
		border: none;
	}
    
    /* footer */

    .footer {
        text-align: center;
        line-height: 150px;
        width: 100%;
        height: 150px;
        background-color: #B1B1B1;
        margin-top: 100px;
    }
    </style>
  </body>
</html>