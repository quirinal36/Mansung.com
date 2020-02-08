<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="popupWrap popup_selectShare_wrap">
	<div class="popup">
		<div class="popup_selectShare">
			<strong>공유</strong>
			<ul>
			    <li>
			        <a href="void:(0);">
			            <img src="/resources/img/comm/icon_kakaotalk.png" alt="icon"><br>
			            카카오톡
			        </a>
			    </li>
			    <li>
			        <a href="javascript:copyToShare();">
			            <img src="/resources/img/comm/icon_url.png" alt="icon"><br>
			            링크 복사
			        </a>
			    </li>
			</ul>
			<input type="hidden" value=""/>	
			<div class="bt_wrap">
			    <input type="button" value="닫기" class="bt1 bt_popupClose">
			</div>
        </div>
    </div>
</div>