<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script>
		// 로그인 레이어 출력
		$(function(){
			 loginOpen();
		});
	</script>
	<style>
		.search_wrap { display: none; }
		.loginPage {
			padding: 60px;
			border-top: 1px solid #eee;
			background: #f5f6f7;
			text-align: center;
		}
		.loginPage > a {
			display: inline-block;
			width: 80%;
			padding: 15px 0;
			border: 1px solid #eee;
			border-radius: 2px;
			background: #fff;
			font-size: 1.6rem;
			font-weight: 600;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="loginPage">
						<a href="javascript: void(0);" onclick="loginOpen();">카카오톡 로그인</a>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
		<c:import url="/inc/login"></c:import>
	</div>	
</body>
</html>
