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
								<a href="#" class="image pImg type1">루루</a>
								<div class="info">
									<a href="#" class="writer">관리자가 볼 때</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<p>
									아래 항목은 관리자만 볼 수 있음<br>
									- 좋아요 갯수<br>
									- 불편해요 갯수<br>
									- 차단 버튼
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
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type2">루루</a>
								<div class="info">
									<a href="#" class="writer">글쓴이 본인이 볼 때</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<p>
									작성자 본인일 경우 수정/삭제 버튼 노출
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
									<input type="checkbox" id="msg2_like" class="bt_msg_like">
									<label for="msg2_like">좋아요</label>
									<a href="/talk/comment">댓글 쓰기</a>
								</div>
								<div class="right">
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg2_hide" class="bt_msg_hide">
										<label for="msg2_hide"></label>
									</div>
									<!-- 수정/삭제 -->
									<a href="/talk/edit" class="bt_edit">수정</a>
									<input type="button" value="삭제" class="bt_del">
									<input type="button" value="공유" class="bt_share">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type3">루루</a>
								<div class="info">
									<a href="#" class="writer">다른 사람이 볼 때 - 기본값</a><br>
									<span class="date">2020-01-04 11:29:01</span>
								</div>
							</div>
							<div class="msg">
								<p>
									수정 이력이 없을 때 : 작성일 옆에 [수정됨] 표시 없음<br>
									좋아요 누르기 전 : 하트가 회색으로 보임<br>
									등록된 댓글이 없을 때 : [댓글 쓰기]로 보임<br>
									불편해요 누르기 전 : [불편해요] 버튼 노출<br>
									등록한 태그가 없을 때 : div.tags 자체가 안보임
								</p>
							</div>
							<!-- input type checkbox의 아이디는 msg + 글번호 형태가 되어야 함, label의 for도 동일 -->
							<div class="bottom_wrap">
								<div class="left">
									<input type="checkbox" id="msg3_like" class="bt_msg_like">
									<label for="msg3_like">좋아요</label>
									<a href="/talk/comment">댓글 쓰기</a>
								</div>
								<div class="right">
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg3_hide" class="bt_msg_hide">
										<label for="msg3_hide"></label>
									</div>
									<input type="button" value="공유" class="bt_share">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type4">루루</a>
								<div class="info">
									<a href="#" class="writer">다른 사람이 볼 때 - 활성화</a><br>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
							</div>
							<div class="msg">
								<p>
									수정 이력이 있을 때 : 작성일 옆에 [수정됨] 표시<br>
									좋아요 누른 상태 : 하트가 파란색으로 보임<br>
									등록된 댓글이 있을 때 : [댓글 2] 형식으로 보임<br>
									불편해요 누른 상태 : [괜찮아요] 버튼 노출<br>
									등록한 태그가 없을 때 : div.tags가 보임
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
									<input type="checkbox" id="msg4_like" class="bt_msg_like" checked>
									<label for="msg4_like">좋아요</label>
									<a href="/talk/comment">댓글 2</a>
								</div>
								<div class="right">
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg4_hide" class="bt_msg_hide">
										<label for="msg4_hide"></label>
									</div>
									<input type="button" value="공유" class="bt_share">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type5">루루</a>
								<div class="info">
									<a href="#" class="writer">차단된 글</a><br>
									<span class="date">2020-01-04 11:29:01</span>
								</div>
							</div>
							<div class="msg">
								<p>
									관리자가 차단하거나 불편해요가 20개 이상이면 차단됨 상태로 변경됨<br>
									차단된 글은 댓글 페이지도 접근 불가<br>
									차단된 글은 작성자와 관리자만 볼 수 있음
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
									<input type="checkbox" id="msg5_like" class="bt_msg_like">
									<label for="msg5_like">좋아요</label>
									<a href="/talk/comment">댓글 쓰기</a>
								</div>
								<div class="right">
									<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
									<div class="msg_out_wrap">
										<span>차단됨</span>
									</div>
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg5_hide" class="bt_msg_hide">
										<label for="msg5_hide"></label>
									</div>
									<input type="button" value="공유" class="bt_share">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="top">
								<a href="#" class="image pImg type6">루루</a>
								<div class="info">
									<a href="#" class="writer">불편해요 누른 글</a><br>
									<span class="date">2020-01-04 11:29:01</span>
								</div>
							</div>
							<div class="msg hide">
								<p>
									불편해요 누르면 해당 글의 div.msg가 hide됨
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
									<input type="checkbox" id="msg6_like" class="bt_msg_like">
									<label for="msg6_like">좋아요</label>
									<a href="/talk/comment">댓글 쓰기</a>
								</div>
								<div class="right">
									<div class="msg_hide_wrap">
										<input type="checkbox" id="msg6_hide" class="bt_msg_hide" checked>
										<label for="msg6_hide"></label>
									</div>
									<input type="button" value="공유" class="bt_share">
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
