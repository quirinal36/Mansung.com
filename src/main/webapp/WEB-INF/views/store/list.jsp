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
				<div id="contentsPrint" style="display: none;">
                    <!-- store list -->
					<div class="store_list">
                        <ul>
                        	<c:forEach items="${list }" var="store">
	                            <li>
	                                <div class="info">
	                                    <a href="javascript:void(0)" class="thumbnail" style="background-image: url(/resources/img/store/.png);">${store.title }</a>
	                                    <a href="<c:url value="/store/view/${store.id }"/>" class="name">${store.title }</a>
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
	                                <div class="bt_wrap">
	                                    <a href="<c:url value="/store/view/${store.id }"/>" class="bt_view">
	                                        <img src="/resources/img/comm/bt_view.png" alt="icon"> 상세
	                                    </a>
	                                    <a href="tel:0637142536" class="bt_call">
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
