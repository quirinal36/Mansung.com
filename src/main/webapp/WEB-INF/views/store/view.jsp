<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="store_list">
                        <ul>
                            <li>
                                <div class="info">
                                    <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a>
                                    <a href="javascript:void(0)" class="name">${store.title }</a>
                                    <div>${store.phone1 } <input type="button" value="복사" class="bt2"></div>
                                    <div>${store.address2 }, ${store.address4 } <input type="button" value="복사" class="bt2"></div>
                                </div>
                                <div class="bt_wrap item3">
                                    <a href="tel:${store.phone1 }" class="bt_call">
                                        <img src="/resources/img/comm/bt_call.png" alt="icon"> 전화
                                    </a>
                                    <a href="javascript:void(0);" class="bt_map popup_selectMap_opener">
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
							${store.information }
                            <div>
                                <strong>영업시간</strong>
								${store.time }
                            </div>
                            <div>
                                <strong>웹사이트</strong>
                                <a href="${store.website }" target="_blank">${store.website }</a>
                            </div>
                            <div>
                                <strong>블로그</strong>
                                <a href="${store.blog }" target="_blank">${store.blog }</a>
                            </div>
                        </div>
                        <!--
                        <img src="/resources/img/store/1_1.png" alt="사진">
                        <img src="/resources/img/store/1_1.png" alt="사진">
                        <img src="/resources/img/store/1_1.png" alt="사진">
                        <div class="tags">
                            <strong>관련 태그</strong>
                            <a href="#">김밥</a>
                            <a href="#">떡볶이</a>
                            <a href="#">쫄면</a>
                            <a href="#">우동</a>
                            <a href="#">돈까스</a>
                            <a href="#">라면</a>
                            <a href="#">오므라이스</a>
                            <a href="#">돌솥비빔밥</a>
                            <a href="#">된장찌개</a>
                            <a href="#">볶음밥</a>
                            <a href="#">잡채밥</a>
                        </div>
                        -->
                    </div>
                </div>
            </div>
        </div>
         <c:import url="/inc/footer"></c:import>
        <div id="popupWrap" class="popup_selectMap_wrap">
            <div class="popup">
                <div class="popup_selectMap"></div>
            </div>
        </div>
        <div id="popupWrap" class="popup_selectShare_wrap">
            <div class="popup">
                <div class="popup_selectShare"></div>
            </div>
        </div>
	</div>	
</body>
</html>