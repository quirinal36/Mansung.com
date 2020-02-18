<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="su" uri="/WEB-INF/tlds/customTags" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script src="<c:url value="/resources/js/tag.js"/>"></script>
	<script>
	function msg_area_height() {
		var bodyHeight = $(window).height();
		$(".talk_wrap .msg_area").height(bodyHeight - 56 - 109);
	}
	$(function(){
		msg_area_height();
	});
	
	$(window).resize(function(){
		msg_area_height();
	});
	</script>
</head>
<body>
	<div id="wrap">
		<div class="talk_wrap">
			<div class="top">
				<div>
					<a href="javascript:history.back();" class="bt_prev"><img src="/resources/img/comm/bt_prev.png" alt="이전"></a>
					<strong>수정</strong>
					<a href="#" class="bt_write">완료</a>
				</div>
			</div>
			<div class="msg_area">
				<textarea placeholder="오늘 만성동의 날씨는 어떤가요?">나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.</textarea>
			</div>
			<div class="tag_area">
				<div class="add">
					<input type="text" placeholder="태그 입력(최대 10개)" id="ipt_tag" class="ipt1">
					<input type="button" value="추가" onclick="addTag();">
				</div>
				<div class="preview">
					<strong>태그 미리보기</strong>
					<div class="tags">
						<a href="javascript:void(0);">전주 <input type="button" value="삭제" onclick="deleteTag(this)"></a>
						<a href="javascript:void(0);">코딩 <input type="button" value="삭제" onclick="deleteTag(this)"></a>
						<a href="javascript:void(0);">학원 <input type="button" value="삭제" onclick="deleteTag(this)"></a>
						<a href="javascript:void(0);">전주코딩학원 <input type="button" value="삭제" onclick="deleteTag(this)"></a>
						<a href="javascript:void(0);">이형구 <input type="button" value="삭제" onclick="deleteTag(this)"></a>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
