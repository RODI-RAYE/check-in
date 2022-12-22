<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="wrap">
            <div class="pinkbox_left">
                <h1>SIGN IN</h1>
                <c:if test="${msg != null}">
                	<div class="msg">${msg}</div>
                </c:if>
                <form class="more-padding" method="post" autocomplete="off">
                    <div class="intbox">
                        <input type="text" id="id" name="id" required>
                        <label for="id">ID</label>
                    </div>
                    <div class="intbox">
                        <input type="password" id="pw" name="pw" required>
                        <label for="pw">PASSWORD</label>
                    </div>
                    <!-- <div class="checkbox">
                        <input type="checkbox" id="remember"/><label for="remember">remember me</label>
                    </div> -->
                    <button class="button submit">LOGIN</button>
                </form>
            </div>
            <div class="rightbox">
                <h2 class="title">check-in</h2>
                <img class="flower" src="${pageContext.request.contextPath}/resources/image/login_flower.jpg" />
                <p>don't have an account?</p>
                <button type="button" class="button" onclick="location.href='signup'">SIGN UP</button>
            </div>
        </div>
    </div>

    <script>
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('.submit');

        $(btn).on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                },1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                },1500);
            }
        });
    </script>
</body>
</html>