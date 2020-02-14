<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="canonical" href="http://www.xn--lz2b88k.com">
	<meta name="apple-mobile-web-app-title" content="만성닷컴">
	<meta name="robots" content="index,follow">
	<title>만성닷컴 로그인</title>
	<link rel="stylesheet" href="/resources/css/login.css">
	<script src="<c:url value="/resources/js/jquery-1.12.1.min.js"/>"></script>
</head>
<body>
    <div class="login_wrap">
        <div class="bg"></div>
    	<a href="/" class="bt_back"><img src="/resources/img/comm/bt_back.png" alt="이전"></a>
        <div class="txt_wrap">
            행복한 여행의<br>
            가장 큰 준비물은<br>
            가벼운 마음이다.<br>
            <span>- 생텍쥐페리</span>
        </div>
        <div class="bt_login_wrap">
            <a href="#" onclick="login();">카카오톡<br> 로그인</a>
        </div>
    </div>
</body>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('${apiKey}');
	
	function login(){
		Kakao.Auth.login({ 
			success : function(authObj) {
				var url = "/member/signup";
				var param = JSON.stringify(authObj);
				console.log(authObj);
				
				$.ajax({
					url : url,
					data: param,
					type: "POST",
					dataType: "json",
					contentType: 'application/json; charset=utf-8'
				}).done(function(json){
					console.log(json);
					
					if(json.id > 0){
						window.location.replace("/member/login");
					}
				});
			},
			fail : function(err) {
				alert("로그인에 실패했습니다.");
			}
		});
	}
</script>
</html>