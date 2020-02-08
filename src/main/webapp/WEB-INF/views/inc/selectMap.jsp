<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="popupWrap popup_selectMap_wrap">
    <div class="popup">
        <div class="popup_selectMap">
        	<strong>지도</strong>
			<ul>
			    <li>
			        <a href="javascript:void(0);" onclick="alert('구글 지도에는 만성동이 등록되어 있지 않습니다.'); return false;">
			            <img src="/resources/img/comm/icon_googlemap.png" alt="icon"><br>
			            구글 지도
			        </a>
			    </li>
			    <li>
			        <a href="http://naver.me/xZm7IHkU" target="_blank">
			            <img src="/resources/img/comm/icon_navermap.png" alt="icon"><br>
			            네이버 지도
			        </a>
			    </li>
			    <li>
			        <a href="#" target="_blank">
			            <img src="/resources/img/comm/icon_kakaonav.png" alt="icon"><br>
			            카카오 내비
			        </a>
			    </li>
			    <li>
			        <a href="http://kko.to/4Lsom3uj0" target="_blank">
			            <img src="/resources/img/comm/icon_kakaomap.png" alt="icon"><br>
			            카카오맵
			        </a>
			    </li>
			    <li>
			        <a href="#" target="_blank">
			            <img src="/resources/img/comm/icon_tmap.png" alt="icon"><br>
			            티맵
			        </a>
			    </li>
			</ul>
			<div class="bt_wrap">
			    <input type="button" value="닫기" class="bt1 bt_popupClose">
			</div>
        </div>
    </div>
</div>