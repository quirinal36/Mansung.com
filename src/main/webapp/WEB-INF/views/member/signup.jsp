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
	
	
	
	// 프로필 이미지 세로길이 1:1 비율로 조정
	function pImgheight() {
		var pImg_width = $(".pImg").width();
		$(".pImg").height(pImg_width);
	}
	
	$(function(){
		pImgheight();
	});
	
	$(window).resize(function(){
		pImgheight();
	});
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="tab_wrap item3">
						<a href="#" class="on">내 글에 댓글</a>
						<a href="#">좋아하는 글</a>
						<a href="#">내가 쓴 글</a>
					</div>
					<div class="mypage_feed_wrap">
						<div class="comment_area">
							<div class="item">
								<div class="original">
									<div class="cont">
										<a href="#" class="pImg type1">내가 쓴 댓글</a>
										<a href="#" class="writer">내가 쓴 댓글</a>
										내가 쓴 댓글 / 내 글에 댓글
										<div class="eImg">
											<img src="/resources/img/emoticon/e4.gif" alt="신난다">
										</div>
									</div>
									<div class="info">
										<span class="date">2020-01-04 11:29:01</span>
										<div class="right">
											<a href="/talk/edit" class="bt_edit">수정</a>
											<a href="#" class="bt_del">삭제</a>
											<a href="#" class="bt_reply">답글</a>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="original">
									<div class="cont">
										<a href="#" class="pImg type5">내가 쓴 답글</a>
										<a href="#" class="writer">내가 쓴 답글</a>
										내가 쓴 답글 / 내 글에 답글
									</div>
									<div class="info">
										<span class="date">2020-01-04 11:29:01 비밀글 수정됨</span>
										<div class="right">
											<a href="/talk/edit" class="bt_edit">수정</a>
											<a href="#" class="bt_del">삭제</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="msg_wrap">
							<div class="item">
								<div class="top">
									<a href="#" class="image pImg type1">내가 쓴 글</a>
									<div class="info">
										<a href="#" class="writer">내가 쓴 글</a><br>
										<span class="date">2020-01-04 11:29:01 수정됨</span>
									</div>
								</div>
								<div class="msg">
									<p>
										내가 쓴 글 / 내가 좋아하는 글
									</p>
									<div class="tags">
										<a href="#">학원</a>
										<a href="#">코딩</a>
										<a href="#">4차산업혁명</a>
									</div>
								</div>
								<!-- input type checkbox의 아이디는 msg + 글번호 형태가 되어야 함, label의 for도 동일 -->
								<div class="bottom_wrap">
									<div class="left">
										<input type="checkbox" id="msg1_like" class="bt_msg_like">
										<label for="msg1_like">좋아요</label>
										<!-- 좋아요 갯수는 관리자만 노출 -->
										<span>3</span>
										<a href="/talk/comment">댓글 쓰기</a>
									</div>
									<div class="right">
										<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
										<div class="msg_hide_wrap">
											<span class="msg_hide_count">1</span>
											<input type="checkbox" id="msg1_hide" class="bt_msg_hide">
											<label for="msg1_hide"></label>
										</div>
										<!-- 차단/차단해제, 관리자만 노출 -->
										<div class="msg_out_wrap">
											<input type="checkbox" id="msg1_out" class="bt_msg_out">
											<label for="msg1_out"></label>
										</div>
										<!-- 수정/삭제/공유 -->
										<a href="/talk/edit" class="bt_edit">수정</a>
										<input type="button" value="삭제" class="bt_del">
										<input type="button" value="공유" class="bt_share">
									</div>
								</div>
							</div>
						</div>
					</div>
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
									<label for="type1" class="pImg type1">type1</label>
									<input type="radio" name="type" id="type2">
									<label for="type2" class="pImg type2">type2</label>
									<input type="radio" name="type" id="type3">
									<label for="type3" class="pImg type3">type3</label>
									<input type="radio" name="type" id="type4">
									<label for="type4" class="pImg type4">type4</label>
									<input type="radio" name="type" id="type5">
									<label for="type5" class="pImg type5">type5</label>
									<input type="radio" name="type" id="type6">
									<label for="type6" class="pImg type6">type6</label>
									<input type="radio" name="type" id="type7">
									<label for="type7" class="pImg type7">type7</label>
									<input type="radio" name="type" id="type8">
									<label for="type8" class="pImg type8">type8</label>
									<input type="radio" name="type" id="type9">
									<label for="type9" class="pImg type9">type9</label>
									<input type="radio" name="type" id="type10">
									<label for="type10" class="pImg type10">type10</label>
									<input type="radio" name="type" id="type11">
									<label for="type11" class="pImg type11">type11</label>
									<input type="radio" name="type" id="type12">
									<label for="type12" class="pImg type12">type12</label>
									<input type="radio" name="type" id="type13">
									<label for="type13" class="pImg type13">type13</label>
									<input type="radio" name="type" id="type14">
									<label for="type14" class="pImg type14">type14</label>
									<input type="radio" name="type" id="type15">
									<label for="type15" class="pImg type15">type15</label>
									<input type="radio" name="type" id="type16">
									<label for="type16" class="pImg type16">type16</label>
								</form>
							</div>
							<input type="button" value="저장" class="bt4">
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>