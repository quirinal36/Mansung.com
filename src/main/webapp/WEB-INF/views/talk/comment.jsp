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
				<input type="button" value="쓰기" class="bt_comment_write">
			</div>
			<div class="comment_area">
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type1">미미짱</a>
							<a href="#" class="writer">미미짱</a>
							저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ 저도 전주코딩학원 다녀용! ㅋㅋㅋㅋ
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
					<div class="reply">
						<div class="reply_item">
							<div class="cont">
							<a href="#" class="pImg type2">고수</a>
								<a href="#" class="writer">고수</a>
								저도 전주코딩학원 다녀용!
								<div class="eImg">
									<img src="/resources/img/emoticon/e14.png" alt="신난다">
								</div>
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
							<a href="#" class="pImg type3">그림천재</a>
								<a href="#" class="writer">그림천재</a>
								<div class="eImg">
									<img src="/resources/img/emoticon/e17.png" alt="신난다">
								</div>
							</div>
							<div class="info">
								<span class="date">2020-01-04 11:29:01</span>
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
							<a href="#" class="pImg type4">미미언니</a>
							<a href="#" class="writer">미미언니</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type5">쌉가능</a>
							<a href="#" class="writer">쌉가능</a>
								저도 전주코딩학원 다녀용!
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
							<a href="#" class="pImg type6">일러스트</a>
							<a href="#" class="writer">일러스트</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type7">5분컷</a>
							<a href="#" class="writer">5분컷</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type8">각성모드</a>
							<a href="#" class="writer">각성모드</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type9">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type10">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type11">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type12">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type13">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type14">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type15">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="item">
					<div class="original">
						<div class="cont">
							<a href="#" class="pImg type16">미미누나</a>
							<a href="#" class="writer">미미누나</a>
								저도 전주코딩학원 다녀용!
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
				<div class="emoticon_area">
					<div class="selected">
						<img src="/resources/img/emoticon/e1.gif" alt="이모티콘">
						<input type="button" value="선택 취소" class="bt_close">
					</div>
					<div class="list">
						<div>
							<ul>
								<li>
									<input type="checkbox" id="e1" name="emoticon">
									<label for="e1" onclick="eChk(this);"><img src="/resources/img/emoticon/e1.gif" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e2" name="emoticon">
									<label for="e2" onclick="eChk(this);"><img src="/resources/img/emoticon/e2.gif" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e3" name="emoticon">
									<label for="e3" onclick="eChk(this);"><img src="/resources/img/emoticon/e3.gif" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e4" name="emoticon">
									<label for="e4" onclick="eChk(this);"><img src="/resources/img/emoticon/e4.gif" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e5" name="emoticon">
									<label for="e5" onclick="eChk(this);"><img src="/resources/img/emoticon/e5.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e6" name="emoticon">
									<label for="e6" onclick="eChk(this);"><img src="/resources/img/emoticon/e6.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e7" name="emoticon">
									<label for="e7" onclick="eChk(this);"><img src="/resources/img/emoticon/e7.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e8" name="emoticon">
									<label for="e8" onclick="eChk(this);"><img src="/resources/img/emoticon/e8.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e9" name="emoticon">
									<label for="e9" onclick="eChk(this);"><img src="/resources/img/emoticon/e9.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e10" name="emoticon">
									<label for="e10" onclick="eChk(this);"><img src="/resources/img/emoticon/e10.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e11" name="emoticon">
									<label for="e11" onclick="eChk(this);"><img src="/resources/img/emoticon/e11.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e12" name="emoticon">
									<label for="e12" onclick="eChk(this);"><img src="/resources/img/emoticon/e12.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e13" name="emoticon">
									<label for="e13" onclick="eChk(this);"><img src="/resources/img/emoticon/e13.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e14" name="emoticon">
									<label for="e14" onclick="eChk(this);"><img src="/resources/img/emoticon/e14.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e15" name="emoticon">
									<label for="e15" onclick="eChk(this);"><img src="/resources/img/emoticon/e15.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e16" name="emoticon">
									<label for="e16" onclick="eChk(this);"><img src="/resources/img/emoticon/e16.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e17" name="emoticon">
									<label for="e17" onclick="eChk(this);"><img src="/resources/img/emoticon/e17.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e18" name="emoticon">
									<label for="e18" onclick="eChk(this);"><img src="/resources/img/emoticon/e18.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e19" name="emoticon">
									<label for="e19" onclick="eChk(this);"><img src="/resources/img/emoticon/e19.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e20" name="emoticon">
									<label for="e20" onclick="eChk(this);"><img src="/resources/img/emoticon/e20.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e21" name="emoticon">
									<label for="e21" onclick="eChk(this);"><img src="/resources/img/emoticon/e21.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e22" name="emoticon">
									<label for="e22" onclick="eChk(this);"><img src="/resources/img/emoticon/e22.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e23" name="emoticon">
									<label for="e23" onclick="eChk(this);"><img src="/resources/img/emoticon/e23.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e24" name="emoticon">
									<label for="e24" onclick="eChk(this);"><img src="/resources/img/emoticon/e24.png" alt="이모티콘"></label>
								</li>
								<li>
									<input type="checkbox" id="e25" name="emoticon">
									<label for="e25" onclick="eChk(this);"><img src="/resources/img/emoticon/e25.png" alt="이모티콘"></label>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="comment_write">
					<input type="text" placeholder="댓글 입력">
					<input type="button" class="bt_emoticon" value="선택" onclick="eList(this);">
					<input type="button" class="bt_submit" value="등록">
				</div>
			</div>
		</div>
	</div>	
</body>
</html>