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
                                	<div>${store.categoryTitle }</div>
                                    <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a>
                                    <a href="javascript:void(0)" class="name">${store.title }</a>
                                    <c:if test="${fn:length(store.phone1) > 0 }">
                                    	<div>
                                    		<span>
                                    			${store.phone1 }
                                    		</span> 
                                    		<input type="button" value="복사" class="bt2" onclick="javascript:copyInnerHtml(this);">
                                    	</div>
                                    </c:if>
                                    <div>
                                    	<span>${fn:trim(store.address2) }<c:if test="${fn:length(store.address3) > 0 or fn:length(store.address4) > 0}">, </c:if>${fn:trim(store.address3) } ${fn:trim(store.address4) } ${fn:trim(store.address5) }</span> 
                                    	<input type="button" value="복사" class="bt2" onclick="javascript:copyInnerHtml(this);">
                                    </div>
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
		<c:import url="/inc/selectMap"></c:import>
		<c:import url="/inc/selectShare"></c:import>
	</div>	
</body>
</html>