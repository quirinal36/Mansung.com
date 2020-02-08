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
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="bt_wrap">
                        <a href="http://naver.me/IgoZTYYM" target="_blank" class="bt4 on">업체등록·정정신청</a>
                    </div>
					<!-- index top : category -->
					<div class="idx_category">
						<a href="/index?category=2" class="restaurant">
							<span>icon</span> 식당
						</a>
						<a href="/index?category=3" class="cafe">
							<span>icon</span> 카페·디저트
						</a>
						<a href="/index?category=4" class="hospital">
							<span>icon</span> 의료
						</a>
						<a href="/index?category=5" class="mart">
							<span>icon</span> 마트·쇼핑
						</a>
						<a href="/index?category=6" class="beauty">
							<span>icon</span> 미용·뷰티
						</a>
						<a href="/index?category=7" class="academy">
							<span>icon</span> 학원
						</a>
						<a href="/index?category=8" class="law">
							<span>icon</span> 법률
						</a>
						<a href="/index?category=9" class="estate">
							<span>icon</span> 부동산
						</a>
	                    <div class="idx_category_more">
							<a href="/index?category=11" class="construction">
								<span>icon</span> 건축·환경
							</a>
							<a href="/index?category=17" class="church">
								<span>icon</span> 교회
							</a>
							<a href="/index?category=15" class="bank">
								<span>icon</span> 금융
							</a>
							<a href="/index?category=10" class="organization">
								<span>icon</span> 기관·단체
							</a>
							<a href="/index?category=22" class="plant">
								<span>icon</span> 꽃·식물
							</a>
							<a href="/index?category=18" class="catholic">
								<span>icon</span> 성당
							</a>
							<a href="/index?category=21" class="tax">
								<span>icon</span> 세무·회계
							</a>
							<a href="/index?category=23" class="software">
								<span>icon</span> 소프트웨어
							</a>
							<a href="/index?category=24" class="stenograph">
								<span>icon</span> 속기
							</a>
							<a href="/index?category=13" class="kids">
								<span>icon</span> 어린이
							</a>
							<a href="/index?category=14" class="health">
								<span>icon</span> 운동·건강
							</a>
							<a href="/index?category=19" class="interior">
								<span>icon</span> 인테리어
							</a>
							<a href="/index?category=12" class="car">
								<span>icon</span> 자동차
							</a>
							<a href="/index?category=16" class="entertainment">
								<span>icon</span> 취미·오락
							</a>
							<a href="/index?category=20" class="fashion">
								<span>icon</span> 패션
							</a>
							<a href="/index?category=1" class="etc">
								<span>icon</span> 기타
							</a>
						</div>
	                    <div class="bt_wrap">
	                        <a href="javascript:void(0);" class="bt4 bt_cMore">카테고리 전체보기</a>
	                    </div>
						<!--
						<c:forEach items="${cateList }" var="category">
							<a href="<c:url value="/index?category=${category.id }"/>">
								<span>icon</span>
								${category.title }
							</a>
						</c:forEach>
						-->
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
                                <div class="image_wrap">
                                	<a href="#" target="_blank"><img src="/resources/img/banner/2.gif" alt="2020년 3월 자바 개강"></a>
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
