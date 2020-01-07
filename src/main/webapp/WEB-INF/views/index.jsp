<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="su" uri="/WEB-INF/tlds/customTags" %>
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
					<!-- 커뮤니티 view -->
					<div class="msg_wrap">
						<div class="item">
							<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
							<div class="msg">
								<div class="info">
									<a href="#">루루</a>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
								<p>
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
								</p>
								<div class="msg_tags">
									<a href="#">학원</a>
									<a href="#">코딩</a>
									<a href="#">4차산업혁명</a>
								</div>
								<!-- input type checkbox의 아이디는 msg + 글번호 형태가 되어야 함, label의 for도 동일 -->
								<div class="comments_wrap">
									<input type="checkbox" id="msg1_like" class="bt_msg_like">
									<label for="msg1_like">좋아요</label>
									<a href="#">댓글 쓰기</a>
									<div class="right">
										<!-- 차단/차단해제, 관리자만 노출 -->
										<div class="msg_out_wrap">
											<input type="checkbox" id="msg1_out" class="bt_msg_out">
											<label for="msg1_out"></label>
										</div>
										<!-- 불편해요/괜찮아요, 불편해요 숫자는 관리자만 노출 -->
										<div class="msg_hide_wrap">
											<input type="checkbox" id="msg1_hide" class="bt_msg_hide">
											<label for="msg1_hide"></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<a href="#" class="image" style="background-image: url(/resources/img/temp/1.png);">루루</a>
							<div class="msg">
								<div class="info">
									<a href="#">루루</a>
									<span class="date">2020-01-04 11:29:01 수정됨</span>
								</div>
								<p>
									나는 오늘 코딩학원에 갔다. 전주코딩학원 사랑해요.
								</p>
								<div class="msg_tags">
									<a href="#">학원</a>
									<a href="#">코딩</a>
									<a href="#">4차산업혁명</a>
								</div>
								<div class="comments_wrap">
									<input type="checkbox" id="msg2_like" class="bt_msg_like" checked>
									<label for="msg2_like">좋아요</label>
									<a href="#">댓글 2개</a>
									<div class="right">
										<!-- 차단/차단해제, 관리자만 노출 -->
										<div class="msg_out_wrap">
											<input type="checkbox" id="msg2_out" class="bt_msg_out" checked>
											<label for="msg2_out"></label>
										</div>
										<!-- 불편해요/괜찮아요 -->
										<div class="msg_hide_wrap">
											<input type="checkbox" id="msg2_hide" class="bt_msg_hide" checked>
											<label for="msg2_hide"></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- index top : category -->
					<div class="idx_category">
						<c:forEach items="${cateList }" var="category">
							<a href="<c:url value="/index?category=${category.id }"/>">
								<span>icon</span>
								${category.title }
							</a>
						</c:forEach>
                    </div>
                    <div class="bt_wrap">
                        <a href="http://naver.me/IgoZTYYM" target="_blank" class="bt4">업체등록·정정신청</a>
                    </div>
                    <!-- store list -->
					<div class="store_list">
                        <ul>
                        	<c:forEach items="${list }" var="store">
                            <li id="store-${store.id }">
                                <div class="info">
                                    <!-- <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a> -->
                                    <a href="<c:url value="/store/view/${store.id }"/>" class="name">${store.title }</a>
                                	<span class="category">${store.categoryTitle }</span>
                                     <c:if test="${fn:length(store.phone1) > 0 }">
                                    	<div>
                                    		<span>
                                    			${store.phone1 }
                                    		</span> 
                                    		<input type="button" value="복사" class="bt2" onclick="javascript:copyInnerHtml(this);">
                                    	</div>
                                    </c:if>
                                    <div>
                                    	<span>
	                                    	${fn:trim(store.address2) }<c:if test="${fn:length(store.address3) > 0 or fn:length(store.address4) > 0}">, </c:if>${fn:trim(store.address3) } ${fn:trim(store.address4) } ${fn:trim(store.address5) }
                                    	</span> 
                                    	<input type="button" value="복사" class="bt2" onclick="javascript:copyInnerHtml(this);">
                                    </div>
                                </div>
                                <div class="bt_wrap">
                                    <a href="<c:url value="/store/view/${store.id }"/>" class="bt_view">
                                        <img src="/resources/img/comm/bt_view.png" alt="icon"> 상세
                                    </a>
                                    <a href="tel:${store.phone1 }" class="bt_call">
                                        <img src="/resources/img/comm/bt_call.png" alt="icon"> 전화
                                    </a>
                                    <a href="javascript:void(0);" class="bt_map popup_selectMap_opener">
                                        <img src="/resources/img/comm/bt_map.png" alt="icon"> 지도
                                    </a>
                                    <a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
                                    	<c:set var="fullURL" value="${pageContext.request.requestURL }"></c:set>
                                    	<c:set var="pathURL" value="${pageContext.request.requestURI }"></c:set>
                                    	<c:set var="baseURL" value="${fn:replace(fullURL, pathURL, '')}"></c:set>
                                    	
                                    	<input type="hidden" value="<c:url value="${baseURL }/store/view/${store.id }"/>"/>
                                        <img src="/resources/img/comm/bt_share.png" alt="icon"> 공유
                                    </a>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
		<c:import url="/inc/selectMap"></c:import>
		<c:import url="/inc/selectShare"></c:import>
	</div>	
</body>
</html>
