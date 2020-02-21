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
				
					<c:if test="${empty storeInfo.query }">
						<!-- 코로나 관련 -->
						<div class="virus_wrap">
							<div class="banner">
								<a href="#" target="_blank">
									<img src="http://www.jeonju.go.kr/planweb/upload/402880863251923e01325193a7480005/popup/thumbnail/3a987738-2360-41af-b44a-c64234e95084.jpg" alt="신종코로나바이러스감증 예방행동수칙">
								</a>
							</div>
							<div class="menus">
								<a href="http://jeonju.go.kr/corona/#tab1" target="_blank">전주시<br> 재난안전대책본부</a>
								<a href="http://jeonju.go.kr/corona/#tab2" target="_blank">예방행동수칙</a>
								<a href="http://jeonju.go.kr/corona/#tab3" target="_blank">선별진료소 현황</a>
							</div>
							<div class="menus">
								<a href="http://jeonju.go.kr/corona/#tab4" target="_blank">대응소식</a>
								<a href="http://jeonju.go.kr/corona/#tab5" target="_blank">확진환자 이동경로</a>
								<a href="http://jeonju.go.kr/corona/#tab6" target="_blank">자주 묻는 질문</a>
							</div>
						</div>
						
						<div class="suggest">
							<a href="/?query=배달">
								<span>밖에 나가기 조심스러우시죠?</span>
								<b>우리동네 배달 가능한 식당·마트</b>
							</a>
							<a href="/?query=마스크" onclick="alert('재고문의 후 방문하세요.')">
								<span>미리미리 구비하세요</span>
								<b>만성동 마스크 파는 곳</b>
							</a>
						</div>
						<!-- index category -->
						<div class="idx_category">
							<ul>
								<li>
									<a href="/index?category=2" class="restaurant">
										<span>icon</span> 식당
									</a>
								</li>
								<li>
									<a href="/index?category=3" class="cafe">
										<span>icon</span> 카페·디저트
									</a>
								</li>
								<li>
									<a href="/index?category=4" class="hospital">
										<span>icon</span> 의료
									</a>
								</li>
								<li>
									<a href="/index?category=5" class="mart">
										<span>icon</span> 마트·쇼핑
									</a>
								</li>
								<li>
									<a href="/index?category=6" class="beauty">
										<span>icon</span> 미용·뷰티
									</a>
								</li>
								<li>
									<a href="/index?category=7" class="academy">
										<span>icon</span> 학원
									</a>
								</li>
								<li>
									<a href="/index?category=8" class="law">
										<span>icon</span> 법률
									</a>
								</li>
								<li>
									<a href="/index?category=9" class="estate">
										<span>icon</span> 부동산
									</a>
								</li>
							</ul>
							<!-- 숨은 카테고리 -->
							<div class="idx_category_more">
								<ul>
									<li>
										<a href="/index?category=11" class="construction">
											<span>icon</span> 건축·환경
										</a>
									</li>
									<li>
										<a href="/index?category=17" class="church">
											<span>icon</span> 교회
										</a>
									</li>
									<li>
										<a href="/index?category=15" class="bank">
											<span>icon</span> 금융
										</a>
									</li>
									<li>
										<a href="/index?category=10" class="organization">
											<span>icon</span> 기관·단체
										</a>
									</li>
									<li>
										<a href="/index?category=22" class="plant">
											<span>icon</span> 꽃·식물
										</a>
									</li>
									<li>
										<a href="/index?category=18" class="catholic">
											<span>icon</span> 성당
										</a>
									</li>
									<li>
										<a href="/index?category=21" class="tax">
											<span>icon</span> 세무·회계
										</a>
									</li>
									<li>
										<a href="/index?category=23" class="software">
											<span>icon</span> 소프트웨어
										</a>
									</li>
									<li>
										<a href="/index?category=24" class="stenograph">
											<span>icon</span> 속기
										</a>
									</li>
									<li>
										<a href="/index?category=13" class="kids">
											<span>icon</span> 어린이
										</a>
									</li>
									<li>
										<a href="/index?category=14" class="health">
											<span>icon</span> 운동·건강
										</a>
									</li>
									<li>
										<a href="/index?category=19" class="interior">
											<span>icon</span> 인테리어
										</a>
									</li>
									<li>
										<a href="/index?category=12" class="car">
											<span>icon</span> 자동차
										</a>
									</li>
									<li>
										<a href="/index?category=16" class="entertainment">
											<span>icon</span> 취미·오락
										</a>
									</li>
									<li>
										<a href="/index?category=20" class="fashion">
											<span>icon</span> 패션
										</a>
									</li>
									<li>
										<a href="/index?category=1" class="etc">
											<span>icon</span> 기타
										</a>
									</li>
								</ul>
							</div>
							<div class="bt_wrap">
								<a href="javascript:void(0);" class="bt4 bt_cMore">카테고리 전체보기 <img src="/resources/img/comm/arrow_down.png" alt="아이콘"></a>
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
					</c:if>
					<div class="bt_wrap">
						<a href="http://pf.kakao.com/_gxkyjxb" target="_blank" class="bt4 on">업체등록·정정신청</a>
					</div>
					<!-- store list -->
					<div class="store_list">
						<c:if test="${fn:length(list) eq 0}">
							<div id="noResult">
								<img src="/resources/img/emoticon/e14.png" alt="(머쓱)">
								검색결과가 없습니다.
							</div>
						</c:if>
						<c:forEach items="${list }" var="store">
						<div id="store-${store.id }" class="item">
							<div class="info">
								<!-- <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a> -->
								<a href="<c:url value="/store/view/${store.id }"/>" class="name">${store.title }</a>
								<span class="category">${store.categoryTitle }</span>
								 <c:if test="${fn:length(store.phone1) > 0 }">
									<div>
										<span>
											${store.phone1 }
										</span> 
										<input type="button" value="복사" class="bt2" onclick="javascript:copyPhoneMsg(this);">
									</div>
								</c:if>
								<div>
									<span>
										${fn:trim(store.address2) }<c:if test="${fn:length(store.address3) > 0 or fn:length(store.address4) > 0}">, </c:if>${fn:trim(store.address3) } ${fn:trim(store.address4) } ${fn:trim(store.address5) }
									</span> 
									<input type="button" value="복사" class="bt2" onclick="javascript:copyAddressMsg(this);">
								</div>
							</div>
							<!-- 이미지배너가 있을 때는 이미지배너 등록, 텍스트배너가 있을 때는 텍스트배너 등록, 중복 가능 -->
							<c:if test="${store.bannerColor > 0 and fn:length(store.bannerText) gt 0}">
								<div class="banner_wrap txtType ${store.bannerColorTxt }">
									<a href="${store.bannerColor}">${store.bannerText}</a>
								</div>
							</c:if>
							<c:if test="${ store.wideBanner > 0 }">
								<div class="banner_wrap imgType">
									<a href="#" target="_blank"><img src="${store.wideBannerUrl }" alt="${store.title }"></a>
								</div>
							</c:if>
							<div class="bt_wrap">
								<a href="<c:url value="/store/view/${store.id }"/>" class="bt_view">
									<img src="/resources/img/comm/bt_view.png" alt="icon"> 상세
								</a>
								<c:choose>
									<c:when test="${fn:length(store.phone1) gt 0 }">
										<a href="tel:${store.phone1 }" class="bt_call">
											<img src="/resources/img/comm/bt_call.png" alt="icon"> 전화
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0);" onclick="alert('등록된 전화번호가 없습니다.')" class="bt_call">
											<img src="/resources/img/comm/bt_call.png" alt="icon"> 전화
										</a>
									</c:otherwise>
								</c:choose>
								<a href="<c:url value="/store/view/${store.id }#map"/>" class="bt_map <!--popup_selectMap_opener-->">
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
						</div>
						</c:forEach>
						<div class="user_guide">
							<img src="/resources/img/emoticon/e12.png" alt="따봉">
							<p>만성닷컴에 아직 적용되지 않은<br> 유익한 정보를 알려주세요.</p>
							<a href="http://pf.kakao.com/_gxkyjxb" target="_blank">만성닷컴 카카오톡 채널</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
		<c:import url="/inc/login"></c:import>
		<c:import url="/inc/selectMap"></c:import>
		<c:import url="/inc/selectShare"></c:import>
	</div>	
</body>
</html>
