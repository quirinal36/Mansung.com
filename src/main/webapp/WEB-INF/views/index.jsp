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
					<!-- index top : category -->
					<div class="idx_category">
						<a href="#">
							<span>icon</span>
							식당
						</a>
						<a href="#">
							<span>icon</span>
							카페
						</a>
						<a href="#">
							<span>icon</span>
							병원/약국
						</a>
						<a href="#">
							<span>icon</span>
							마트/편의점
						</a>
						<a href="#">
							<span>icon</span>
							미용실
						</a>
						<a href="#">
							<span>icon</span>
							학원
						</a>
						<a href="#">
							<span>icon</span>
							변호사
						</a>
						<a href="#">
							<span>icon</span>
							부동산
						</a>
                    </div>
                    <div class="bt_wrap">
                        <a href="http://naver.me/IgoZTYYM" target="_blank" class="bt4">업체등록·정정신청</a>
                    </div>
                    <!-- store list -->
					<div class="store_list">
                        <ul>
                            <li>
                                <div class="info">
                                    <a href="/store/view.html" class="thumbnail" style="background-image: url(/resources/img/store/1.png);">김밥이 맛있는 단아분식</a>
                                    <a href="/store/view.html" class="name">전주코딩학원</a>
                                    <div>063-714-2536 <input type="button" value="복사" class="bt2"></div>
                                    <div>만성중앙로 53-39 <input type="button" value="복사" class="bt2"></div>
                                </div>
                                <div class="bt_wrap">
                                    <a href="/store/view.html" class="bt_view">
                                        <img src="/resources/img/comm/bt_view.png" alt="icon">
                                        상세
                                    </a>
                                    <a href="tel:0637142536" class="bt_call">
                                        <img src="/resources/img/comm/bt_call.png" alt="icon">
                                        전화
                                    </a>
                                    <a href="javascript:void(0);" class="bt_map popup_selectMap_opener">
                                        <img src="/resources/img/comm/bt_map.png" alt="icon">
                                        지도
                                    </a>
                                    <a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
                                        <img src="/resources/img/comm/bt_share.png" alt="icon">
                                        공유
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="info">
                                    <a href="/store/view.html" class="thumbnail" style="background-image: url(/resources/img/store/1.png);">김밥이 맛있는 단아분식</a>
                                    <a href="/store/view.html" class="name">전주코딩학원</a>
                                    <div>063-714-2536 <input type="button" value="복사" class="bt2"></div>
                                    <div>만성중앙로 53-39 <input type="button" value="복사" class="bt2"></div>
                                </div>
                                <div class="bt_wrap">
                                    <a href="/store/view.html" class="bt_view">
                                        <img src="/resources/img/comm/bt_view.png" alt="icon">
                                        상세
                                    </a>
                                    <a href="tel:0637142536" class="bt_call">
                                        <img src="/resources/img/comm/bt_call.png" alt="icon">
                                        전화
                                    </a>
                                    <a href="javascript:void(0);" class="bt_map popup_selectMap_opener">
                                        <img src="/resources/img/comm/bt_map.png" alt="icon">
                                        지도
                                    </a>
                                    <a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
                                        <img src="/resources/img/comm/bt_share.png" alt="icon">
                                        공유
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="info">
                                    <a href="/store/view.html" class="thumbnail" style="background-image: url(/resources/img/store/1.png);">김밥이 맛있는 단아분식</a>
                                    <a href="/store/view.html" class="name">전주코딩학원</a>
                                    <div>063-714-2536 <input type="button" value="복사" class="bt2"></div>
                                    <div>만성중앙로 53-39 <input type="button" value="복사" class="bt2"></div>
                                </div>
                                <div class="bt_wrap">
                                    <a href="/store/view.html" class="bt_view">
                                        <img src="/resources/img/comm/bt_view.png" alt="icon">
                                        상세
                                    </a>
                                    <a href="tel:0637142536" class="bt_call">
                                        <img src="/resources/img/comm/bt_call.png" alt="icon">
                                        전화
                                    </a>
                                    <a href="javascript:void(0);" class="bt_map popup_selectMap_opener">
                                        <img src="/resources/img/comm/bt_map.png" alt="icon">
                                        지도
                                    </a>
                                    <a href="javascript:void(0);" class="bt_share popup_selectShare_opener">
                                        <img src="/resources/img/comm/bt_share.png" alt="icon">
                                        공유
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>
