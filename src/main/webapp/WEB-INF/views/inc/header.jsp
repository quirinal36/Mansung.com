<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(function(){
    // gnb 열기
    $(".menu_opener").click(function(){
        $(this).toggleClass("on");
    });
});
</script>
<div id="headerWrap">
	<div id="msg-area">
	</div>
	<header>
	    <div id="header">
	    	<div class="top">
		        <h1 class="logo_wrap">
		            <a href="/">
		                <img src="/resources/img/comm/logo.png" alt="만성닷컴">
		            </a>
		            <a href="/">
		                <img src="/resources/img/comm/logo2_off.png" alt="만성인">
		            </a>
		        </h1>
		        <div class="login_wrap">
		            <a href="<c:url value="/member/login"/>" class="login"><img src="/resources/img/comm/login.png" alt="로그인"></a>
		            <!--
		            <a href="#" class="logout"><img src="/resources/img/comm/logout.png" alt="로그아웃"></a>
		            -->
		        </div>
		        <div id="gnb_wrap">
		            <input type="checkbox" id="bt_gnb">
		            <label for="bt_gnb">메뉴</label>
		            <div id="gnb">
		            	<div class="bg"></div>
		                <nav>
		                    <ul>
		                        <li><a href="#">만성닷컴 소개</a></li>
		                        <li><a href="#">업체등록·정정신청</a></li>
		                        <li><a href="#">만성닷컴 이용안내</a></li>
		                        <li><a href="#">문의하기</a></li>
		                        <li><a href="<c:url value="/admin/store"/>">관리자</a></li>
		                        <li><a href="#">로그아웃</a></li>
		                    </ul>
		                </nav>
		            </div>
		        </div>
		    </div>
	        <div class="search_wrap">
	            <input type="text" placeholder="검색어 입력" value="학원" onFocus="this.value='';return true;">
	            <input type="button" value="검색">
	        </div>
	        <!--
	        <div id="gnbWrap">
	            <a href="javascript:void(0)" class="menu_opener">
	                <span class="line1">메뉴</span>
	                <span class="line2"></span>
	                <span class="line3"></span>
	            </a>
	            <div id="gnb">
	                <nav>
	                    <ul>
	                        <li><a href="#">만성닷컴 소개</a></li>
	                        <li><a href="#">업체등록·정정신청</a></li>
	                        <li><a href="#">만성닷컴 이용안내</a></li>
	                        <li><a href="#">문의하기</a></li>
	                    </ul>
	                </nav>
	                <a href="/login.html">관리자 로그인</a>
	                <a href="/admin/search/dashboard.html">검색관리</a>
	                <a href="/admin/store/list.html">업체관리</a>
	                <a href="#">로그아웃</a>
	            </div>
	        </div>
	        <div class="search">
	            <form>
	                <input type="text" placeholder="코딩">
	                <input type="submit" value="검색">
	            </form>
	        </div>
	        -->
	    </div>
	</header>
</div>