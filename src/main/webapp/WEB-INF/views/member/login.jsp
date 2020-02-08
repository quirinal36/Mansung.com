<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="member_wrap">
                        <strong class="title">로그인</strong>
                        <p>
                            만성닷컴에 로그인하시면<br>
                            더 많은 서비스를 이용하실 수 있습니다.
                        </p>
                        <a class="bt4 bt_kakao" id="kakao-login-btn">카카오톡으로 로그인</a>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/inc/footer"></c:import>
	</div>	
</body>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('${apiKey}');
	
	Kakao.Auth.createLoginButton({ 
		container : '#kakao-login-btn',
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
</script>
</html>