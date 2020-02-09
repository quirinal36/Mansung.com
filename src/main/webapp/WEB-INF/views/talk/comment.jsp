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
	<script src="<c:url value="/resources/js/comment.js"/>"></script>
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
					<div class="emoticon_area">
						<div class="selected">
							<img src="/resources/img/emoticon/e1.png" alt="이모티콘">
						</div>
						<div class="list">
							<div>
								<ul>
									<li>
										<input type="radio" id="e1" name="emoticon">
										<label for="e1"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e2" name="emoticon">
										<label for="e2"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e3" name="emoticon">
										<label for="e3"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e4" name="emoticon">
										<label for="e4"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e5" name="emoticon">
										<label for="e5"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e6" name="emoticon">
										<label for="e6"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e7" name="emoticon">
										<label for="e7"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e8" name="emoticon">
										<label for="e8"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e9" name="emoticon">
										<label for="e9"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e10" name="emoticon">
										<label for="e10"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e11" name="emoticon">
										<label for="e11"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e12" name="emoticon">
										<label for="e12"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e13" name="emoticon">
										<label for="e13"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e14" name="emoticon">
										<label for="e14"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e15" name="emoticon">
										<label for="e15"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e16" name="emoticon">
										<label for="e16"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e17" name="emoticon">
										<label for="e17"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e18" name="emoticon">
										<label for="e18"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e19" name="emoticon">
										<label for="e19"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
									<li>
										<input type="radio" id="e20" name="emoticon">
										<label for="e20"><img src="/resources/img/emoticon/e1.png" alt="이모티콘"></label>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<input type="text" placeholder="">
					<input type="button" class="bt_emoticon" value="선택">
					<input type="button" class="bt_submit" value="등록">
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
