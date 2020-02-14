<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="store_list">
						<ul>
							<li>
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
								<!-- 
								<c:if test="${store.wideBanner > 0}">
									<div class="banner_wrap imgType">
										<a href="#" target="_blank"><img src="${store.wideBannerUrl }" alt="${store.title }"></a>
									</div>
								</c:if>
								 -->
								 
								 
								<!-- 이미지배너가 있을 때는 이미지배너 등록, 텍스트배너가 있을 때는 텍스트배너 등록, 중복 가능 -->
								<c:choose>
									<c:when test="${ store.wideBanner > 0 }">
										<div class="banner_wrap imgType">
											<a href="#" target="_blank"><img src="${store.wideBannerUrl }" alt="${store.title }"></a>
										</div>
										<div class="banner_wrap txtType cornflowerblue">
											<a href="#">전주코딩학원 학생이 EBS 뉴스에 나왔어요!</a>
										</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>

								<!--
								<div class="banner_wrap txtType cadetblue">
									<a href="#">만성닷컴 배너 무료 등록기간 운영안내</a>
								</div>
								<div class="banner_wrap txtType cornflowerblue">
									<a href="#">만성닷컴 배너 무료 등록기간 운영안내1</a>
								</div>
								<div class="banner_wrap txtType steelblue">
									<a href="#">만성닷컴 배너 무료 등록기간 운영안내4</a>
								</div>
								<div class="banner_wrap txtType mediumpurple">
									<a href="#">만성닷컴 배너 무료 등록기간 운영안내14</a>
								</div>
								-->
								<div class="bt_wrap item3">
									<a href="tel:${store.phone1 }" class="bt_call">
										<img src="/resources/img/comm/bt_call.png" alt="icon"> 전화
									</a>
									<a href="#map" class="bt_map <!--popup_selectMap_opener-->">
										<img src="/resources/img/comm/bt_map.png" alt="icon"> 지도
									</a>
									<a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
										<img src="/resources/img/comm/bt_share.png" alt="icon"> 공유
									</a>
								</div>
							</li>
						</ul>
					</div>
					<div class="storeView">
						<div class="text">
							<c:if test="${fn:length(store.information) > 0 }">
														${store.information }
													</c:if>
													<c:if test="${fn:length(store.time) > 0 }">
							<div>
							<strong>영업시간</strong>
															${store.time }
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
						<img src="/resources/img/store/1_1.png" alt="사진">
						<img src="/resources/img/store/1_1.png" alt="사진">
						
					
						<!-- 지도 -->
						<div id="map" style="width:100%; height:260px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey }"></script>
						<script>
						// 지도를 표시할 div
						var mapContainer = document.getElementById('map'),
						mapOption = { 
								// 지도의 중심좌표
						center: new kakao.maps.LatLng(35.8432606491606, 127.07736177400625),
							// 지도의 확대 레벨
						level: 4
						};
						
						// 지도 생성
						var map = new kakao.maps.Map(mapContainer, mapOption);
						
						var imageSrc = '/resources/img/comm/marker.png',
						imageSize = new kakao.maps.Size(24, 24),
							// 마커 이미지 좌표
						imageOption = {offset: new kakao.maps.Point(12, 24)};
						  
						// 마커 이미지
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
							// 마커 위치
						markerPosition = new kakao.maps.LatLng(35.8432606491606, 127.07736177400625);
						
						// 마커 생성
						var marker = new kakao.maps.Marker({
						position: markerPosition, 
						image: markerImage
						});
						
						// 마커 표시
						marker.setMap(map);  
						
						
						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
						
						// 클릭한 위도, 경도 정보를 가져옵니다 
						var latlng = mouseEvent.latLng;
						
						var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
						message += '경도는 ' + latlng.getLng() + ' 입니다';
						
						var resultDiv = document.getElementById('result'); 
						resultDiv.innerHTML = message;
						
						});
						</script>
						<p id="result" style="font-size: 1.6rem;"></p>

						<!-- 태그 -->
						<div class="tags">
							<strong>태그</strong>
							<c:forEach items="${tags }" var="item">
								<a href="#">${item.name }</a>
							</c:forEach>
						</div>
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