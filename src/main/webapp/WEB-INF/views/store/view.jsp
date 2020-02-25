<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
		// 지도 레이어 제거
		function removeMapLayer() {
			$(".mapLayer").hide();
		}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="store_list">
						<div class="item">
							<div class="info">
								<!-- <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a> -->
								<a href="<c:url value="/store/view/${store.id }"/>" class="name">${store.title } ${store.titleLocal }</a>
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
							<!-- 
							<c:if test="${store.wideBanner > 0}">
								<div class="banner_wrap imgType">
									<a href="#" target="_blank"><img src="${store.wideBannerUrl }" alt="${store.title }"></a>
								</div>
							</c:if>
							 -->
							 

							<c:if test="${store.bannerColor > 0 and fn:length(store.bannerText) gt 0}">
								<div class="banner_wrap txtType ${store.bannerColorTxt }">
									<a href="${store.textBannerLink}">${store.bannerText}</a>
								</div>
							</c:if>							 
							<!-- 이미지배너가 있을 때는 이미지배너 등록, 텍스트배너가 있을 때는 텍스트배너 등록, 중복 가능 -->
							<c:if test="${ store.wideBanner > 0 }">
								<div class="banner_wrap imgType">
									<a href="${store.wideBannerLink }"><img src="${store.wideBannerUrl }" alt="${store.title }"></a>
								</div>
							</c:if>
							<!-- 전화, 지도, 공유버튼 -->
							<div class="bt_wrap item3">
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
								<a href="#map" class="bt_map <!--popup_selectMap_opener-->">
									<img src="/resources/img/comm/bt_map.png" alt="icon"> 지도
								</a>
								<a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
									<img src="/resources/img/comm/bt_share.png" alt="icon"> 공유
								</a>
							</div>
						</div>
					</div>
					<div class="storeView">
						<div class="text">
						<c:if test="${fn:length(store.information) > 0 }">
							${fn:replace(store.information, newLineChar, "<br/>")}
						</c:if>
						<c:if test="${fn:length(store.storeMenu) > 0 }">
							<div>
								<strong>가격정보</strong>
								${fn:replace(store.storeMenu, newLineChar, "<br/>")}
							</div>
						</c:if>
						<c:if test="${fn:length(store.time) > 0 }">
							<div>
								<strong>영업시간</strong>
								${fn:replace(store.time, newLineChar, "<br/>")}
							</div>
						</c:if>
						<c:if test="${fn:length(store.website) > 0 }">
							<div>
							<strong>웹사이트</strong>
							<a href="${store.website }" target="_blank">${store.website }</a>
							</div>
						</c:if>
						<c:if test="${fn:length(store.blog) > 0 }">
							<div>
							<strong>블로그</strong>
							<a href="${store.blog }" target="_blank">${store.blog }</a>
							</div>
						</c:if>
						</div>
						<!-- 사진은 최대 3장까지 등록 가능 -->
						<c:forEach items="${detailImages }" var="item">
							<img src="${item.url }" alt="사진">
						</c:forEach>
					
						<!-- 지도 -->
						<div class="map_wrap">
							<div id="map" style="width:100%;height:350px;"></div>
							
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey }&libraries=services"></script>
							<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch('${store.address2 }', function(result, status) {
							
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
							
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});    
							</script>
							<div class="mapLayer" ondblclick="removeMapLayer();">
								두 번 탭하여 지도 이동
							</div>
						</div>
						<c:if test="${fn:length(tags) gt 0 }">
							<!-- 태그 -->
							<div class="tags_wrap">
								<div class="tags">
									<strong>태그</strong>
									<c:forEach items="${tags }" var="item">
										<a href="/?query=${item.name }">${item.name }</a>
									</c:forEach>
								</div>
								<input type="button" value="모두 보기" class="bt_more">
							</div>
						</c:if>
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