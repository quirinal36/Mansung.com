<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
	function submitEdit(bt){
		var url = $("#edit_form").attr("action");
		var param = $("#edit_form").serialize();
		console.log(param);
		
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			if(json.result > 0){
				alert("저장되었습니다.");
			}
		});
	}
	
	$(function(){
		$("#nickname").focus(function(){
			$(this).removeClass("error");
			$(this).find("+ .guide").html("");
		});		
		
		$("#nickname").focusout(function(){
			// 활동명이 공백일 때
			var name = $(this).val();
			var length = $(this).val().length;
			if( name == "" ) {
				$("#nickname").addClass("error");
				$("#nickname").find("+ .guide").html("활동명을 입력하세요.");
			}
		});
		
		// 닉네임이 8글자를 초과했을 때
		$("#nickname").keyup(function(){
			var name = $(this).val();
			var length = $(this).val().length;
			if( length > 8 ) {
				$(this).val(name.substring( 0, 8 ));
			}
		});
	});
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="member_wrap">
						<div class="name_set">
							<strong class="title">활동명</strong>
							<p>
								만성닷컴에서 활동하실 이름을 입력해주세요.<br>
								최대 8자까지 입력 가능하며 공백은 제외됩니다.
							</p>
							<form action="/member/edit" method="post" id="edit_form">
								<input type="text" placeholder="활동명 입력" class="ipt1" id="nickname" value="${user.nickname }" name="nickname" />
								<div class="guide"></div>
								<input type="hidden" name="id" value="${user.id }"/>
								<input type="hidden" name="kakaoId" value="${user.kakaoId }"/>
								<input type="button" value="저장" class="bt4" onclick="javascript:submitEdit(this);"/>
							</form>
						</div>
						<div class="pImg_set">
							<strong class="title">프로필 사진</strong>
							<div class="list">
								<form>
									<input type="radio" name="type" id="type1" checked>
									<label for="type1" class="pImg type1"><img src="/resources/img/member/p1.png"></label>
									<input type="radio" name="type" id="type2">
									<label for="type2" class="pImg type2"><img src="/resources/img/member/p2.png"></label>
									<input type="radio" name="type" id="type3">
									<label for="type3" class="pImg type3"><img src="/resources/img/member/p3.png"></label>
									<input type="radio" name="type" id="type4">
									<label for="type4" class="pImg type4"><img src="/resources/img/member/p4.png"></label>
									<input type="radio" name="type" id="type5">
									<label for="type5" class="pImg type5"><img src="/resources/img/member/p5.png"></label>
									<input type="radio" name="type" id="type6">
									<label for="type6" class="pImg type6"><img src="/resources/img/member/p6.png"></label>
									<input type="radio" name="type" id="type7">
									<label for="type7" class="pImg type7"><img src="/resources/img/member/p7.png"></label>
									<input type="radio" name="type" id="type8">
									<label for="type8" class="pImg type8"><img src="/resources/img/member/p8.png"></label>
									<input type="radio" name="type" id="type9">
									<label for="type9" class="pImg type9"><img src="/resources/img/member/p9.png"></label>
									<input type="radio" name="type" id="type10">
									<label for="type10" class="pImg type10"><img src="/resources/img/member/p10.png"></label>
									<input type="radio" name="type" id="type11">
									<label for="type11" class="pImg type11"><img src="/resources/img/member/p11.png"></label>
									<input type="radio" name="type" id="type12">
									<label for="type12" class="pImg type12"><img src="/resources/img/member/p12.png"></label>
									<input type="radio" name="type" id="type13">
									<label for="type13" class="pImg type13"><img src="/resources/img/member/p13.png"></label>
									<input type="radio" name="type" id="type14">
									<label for="type14" class="pImg type14"><img src="/resources/img/member/p14.png"></label>
									<input type="radio" name="type" id="type15">
									<label for="type15" class="pImg type15"><img src="/resources/img/member/p15.png"></label>
									<input type="radio" name="type" id="type16">
									<label for="type16" class="pImg type16"><img src="/resources/img/member/p16.png"></label>
								</form>
							</div>
							<input type="button" value="저장" class="bt4">
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
		<c:import url="/inc/login"></c:import>
	</div>	
</body>
</html>