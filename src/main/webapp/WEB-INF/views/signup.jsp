<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="wrap">
            <div class="pinkbox_right">
                <h1>REGISTER</h1>
                <form method="post" autocomplete="off">
               		<input type="hidden" id="checkId">
                    <div class="intbox">
                        <input type="text" id="id" name="id" required>
                        <label for="id">ID</label>
                    </div>
                    <span class="check_msg1">사용 가능한 아이디입니다.</span>
                    <span class="check_msg2">이미 사용 중인 아이디입니다.</span>
                    <div class="intbox">
                        <input type="password" id="pw" name="pw" required>
                        <label for="pw">PASSWORD</label>
                    </div>
                    <div class="intbox">
                        <input type="password" id="confirm_pw" required>
                        <label for="confirm_pw">CONFIRM PASSWORD</label>
                    </div>
                    <span class="check_msg3">비밀번호가 일치하지 않습니다.</span>
                    <div class="intbox">
                        <input type="text" id="email" name="email" required>
                        <label for="email">EMAIL</label>
                    </div>
                    <button class="button submit">SIGN UP</button>
                </form>
            </div>
            <div class="leftbox">
                <h2 class="title">check-in</h2>
                <img class="flower smaller" src="${pageContext.request.contextPath}/resources/image/signup_flower.jpg">
                <p class="account">have an account?</p>
                <button type="button" class="button" onclick="location.href='login'">LOGIN</button>
            </div>
        </div>
    </div>
    <script>
    let id = $('#id');
    let pw = $('#pw');
    let confirm = $('#confirm_pw');
    let email = $('#email');
    let btn = $('.submit');

    $(btn).on('click', function() {
        if($(id).val() == "") {
            $(id).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
            $('.check_msg1').css("display", "none");
			$('.check_msg2').css("display", "none");
        }
        else if($('#checkId').val() != "success"){
        	$(id).next('label').addClass('warning');
        	setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        	return false;
        }
        else if($(pw).val() == "") {
            $(pw).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        }
        else if($(confirm).val() == "") {
            $(confirm).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        }
        else if($(pw).val() != $(confirm).val()){
        	$(pw).next('label').addClass('warning');
        	$(confirm).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        	$('.check_msg3').css("display","inline-block");
        	setTimeout(function() {
        		$('.check_msg3').css("display","none")
            },1500);
        	return false;
        }
        else if($(email).val() == "") {
            $(email).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        }
    });

    $(id).on("propertychange change keyup paste input", function(){
		$.ajax({
			type : "POST",
			url : "checkId",
			data : {id : $(id).val()},
			success : function(result){
				if(result == "OK"){
					$('.check_msg1').css("display","inline-block");
					$('.check_msg2').css("display", "none");
					$('#checkId').val('success');
				} else {
					$('.check_msg2').css("display","inline-block");
					$('.check_msg1').css("display", "none");
					$('#checkId').val('fail');
				}
			}
		});
    });
    </script>
</body>
</html>