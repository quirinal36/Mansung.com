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
					<!-- 내용 시작 -->
					
					<!-- 나의 프로필일 때 -->
					<div class="tab_wrap type2 item4">
						<a href="#" class="on">내 글에 댓글</a>
						<a href="#">좋아하는 글</a>
						<a href="#">내가 쓴 글</a>
						<a href="#" class="on">내가 쓴 댓글</a>
					</div>
					<!-- 다른 사용자의 프로필일 때 -->
					<div class="tab_wrap type2 item3">
						<a href="#">작성한 글</a>
						<a href="#" class="on">작성한 댓글</a>
						<a href="#">좋아하는 글</a>
					</div>
					<div class="comment_area">
						<div class="item">
							<div class="original">
								<div class="cont">
									<a href="#" class="pImg type1">김아재</a>
									<a href="#" class="writer">김아재</a>
									반성문은 영어로 글로벌~
									<div class="eImg">
										<img src="/resources/img/emoticon/e9.png" alt="신난다">
									</div>
								</div>
								<div class="info">
									<span class="date">2020-01-04 11:29:01</span>
									<div class="right">
										<a href="#" class="bt_original">원문</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="original">
								<div class="cont">
									<a href="#" class="pImg type1">김아재</a>
									<a href="#" class="writer">김아재</a>
									반성문은 영어로 글로벌~
								</div>
								<div class="info">
									<span class="date">2020-01-04 11:29:01 비밀글 수정됨</span>
									<div class="right">
										<a href="#" class="bt_original">원문</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 나의 프로필일 때 -->
					<div class="tab_wrap type2 item4">
						<a href="#">내 글에 댓글</a>
						<a href="#" class="on">좋아하는 글</a>
						<a href="#" class="on">내가 쓴 글</a>
						<a href="#">내가 쓴 댓글</a>
					</div>
					<!-- 다른 사용자의 프로필일 때 -->
					<div class="tab_wrap type2 item3">
						<a href="#" class="on">작성한 글</a>
						<a href="#">작성한 댓글</a>
						<a href="#" class="on">좋아하는 글</a>
					</div>
					<div class="msg_wrap">
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type1">박아저씨</a>
								<div class="info">
									<a href="#" class="writer">박아저씨</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<div class="txt">
									<div>
										<p>
											지금은 아재개그 타임!!
										</p>
									</div>
								</div>
								<div class="tags">
									<a href="#">아재개그</a>
									<a href="#">심심</a>
								</div>
							</div>
							<!-- input type checkbox의 아이디는 msg + 글번호 형태가 되어야 함, label의 for도 동일 -->
							<div class="bottom_wrap">
								<div class="left">
									<input type="checkbox" id="msg1_like" class="bt_msg_like" checked>
									<label for="msg1_like">좋아요</label>
									<!-- 좋아요 갯수는 관리자만 노출 -->
									<span>3</span>
									<a href="/talk/comment">댓글 2</a>
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
									<!-- 수정/삭제 -->
									<a href="/talk/edit" class="bt_edit">수정</a>
									<input type="button" value="삭제" class="bt_del">
									<input type="button" value="공유" class="bt_share">
								</div>
							</div>
						</div>
					</div>
					<!-- 내용 끝 -->
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
		<c:import url="/inc/login"></c:import>
	</div>	
</body>
</html>