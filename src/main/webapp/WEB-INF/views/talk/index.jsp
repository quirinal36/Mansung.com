<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="su" uri="/WEB-INF/tlds/customTags" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>">
	<script src="<c:url value="/resources/js/index.js"/>"></script>
	<script src="<c:url value="/resources/js/tag.js"/>"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<!-- 커뮤니티 view -->
					<div class="msg_wrap">
						<div class="item">
							<div class="top">
								<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
								<div class="info">
									<a href="#" class="writer">루루</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<p>
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
								</p>
								<div class="msg_tags">
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
									<span>좋아요 3</span>
									<a href="/talk/comment">댓글 쓰기</a>
								</div>
								<div class="right">
									<!-- 차단/차단해제, 관리자만 노출 -->
									<div class="msg_out_wrap">
										<input type="checkbox" id="msg1_out" class="bt_msg_out">
										<label for="msg1_out"></label>
									</div>
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_hide_wrap">
										<span>불편해요 1</span>
										<input type="checkbox" id="msg1_hide" class="bt_msg_hide">
										<label for="msg1_hide"></label>
									</div>
									<!-- 수정/삭제 -->
									<a href="/talk/edit" class="bt_edit">수정</a>
									<a href="#" class="bt_del">삭제</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="top">
								<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
								<div class="info">
									<a href="#" class="writer">루루</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<p>
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
								</p>
								<div class="msg_tags">
									<a href="#">학원</a>
									<a href="#">코딩</a>
									<a href="#">4차산업혁명</a>
								</div>
							</div>
							<!-- input type checkbox의 아이디는 msg + 글번호 형태가 되어야 함, label의 for도 동일 -->
							<div class="bottom_wrap">
								<div class="left">
									<input type="checkbox" id="msg2_like" class="bt_msg_like" checked>
									<label for="msg2_like">좋아요</label>
									<a href="/talk/comment">댓글 2개</a>
								</div>
								<div class="right">
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg2_hide" class="bt_msg_hide" checked>
										<label for="msg2_hide"></label>
									</div>
									<!-- 수정/삭제 -->
									<a href="/talk/edit" class="bt_edit">수정</a>
									<a href="#" class="bt_del">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>
