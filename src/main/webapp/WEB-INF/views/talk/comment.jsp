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
	<script src="<c:url value="/resources/js/reply.js"/>"></script>
</head>
<body>
	<div id="wrap">
		<div class="talk_wrap">
			<div class="top">
				<a href="javascript:history.back();" class="bt_prev"><img src="/resources/img/comm/bt_prev.png" alt="이전"></a>
				<strong>댓글</strong>
				<a href="#" class="bt_comment_write">쓰기</a>
			</div>
			<div class="comment_area">
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
							<a href="#" class="writer">루루</a>
							저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ
						</div>
						<div class="info">
							<span class="date">2020-01-04 11:29:01 수정됨</span>
							<div class="right">
								<a href="/talk/edit" class="bt_edit">수정</a>
								<a href="#" class="bt_del">삭제</a>
								<a href="#" class="bt_reply">답글</a>
							</div>
						</div>
					</div>
					<div class="reply">
						<div class="reply_item">
							<div class="cont">
								<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
								<a href="#" class="writer">루루</a>
								저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ
							</div>
							<div class="info">
								<span class="date">2020-01-04 11:29:01 수정됨</span>
								<div class="right">
									<a href="/talk/edit" class="bt_edit">수정</a>
									<a href="#" class="bt_del">삭제</a>
								</div>
							</div>
						</div>
						<div class="reply_item">
							<div class="cont">
								<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
								<a href="#" class="writer">루루</a>
								저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ
							</div>
							<div class="info">
								<span class="date">2020-01-04 11:29:01 수정됨</span>
								<div class="right">
									<a href="/talk/edit" class="bt_edit">수정</a>
									<a href="#" class="bt_del">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
							<a href="#" class="writer">루루</a>
							저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ
						</div>
						<div class="info">
							<span class="date">2020-01-04 11:29:01 수정됨</span>
							<div class="right">
								<a href="/talk/edit" class="bt_edit">수정</a>
								<a href="#" class="bt_del">삭제</a>
								<a href="#" class="bt_reply">답글</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="comment_write_area">
				<div class="bg"></div>
				<div class="comment_write">
					<input type="text" placeholder="">
					<input type="button" value="등록">
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
