<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
Kakao.init('${apiKey}');
$(function(){
    // gnb 열기
    $(".menu_opener").click(function(){
        $(this).toggleClass("on");
    });
    
    $("#kakao-logout-btn").on('click', function(){
		Kakao.Auth.logout(function(){
			window.location.replace("/j_spring_security_logout");
		});
	});
    var accessToken = Kakao.Auth.getAccessToken();
});
function moveToLogin(){
	var url = "/member/login";
	window.location.replace(url);
}
</script>
<div id="headerWrap">
	<div id="msg-area">
	</div>
	<header>
	    <div id="header">
	    	<div class="top">
		        <h1 class="logo_wrap">
		            <a href="/">
		                <img src="/resources/img/comm/logo1${logo1 }.png" alt="만성닷컴${logo1 }">
		            </a>
		            <a href="/talk/">
		                <img src="/resources/img/comm/logo2${logo2 }.png" alt="만성인${logo2 }">
		            </a>
		        </h1>
		        <div class="icons">
		        	<!-- 글쓰기 버튼은 만성인에서만 보임 -->
		        	<a href="/talk/write" class="write"><img src="/resources/img/comm/bt_write.png" alt="글쓰기"></a>
		        	<c:choose>
		        		<c:when test="${empty user}">
		        		<!--
		        			<a href="javascript:return false;" onclick="javascript:moveToLogin();" class="login"><img src="/resources/img/comm/login.png" alt="로그인"></a>
		        		-->
		        			<a href="javascript:return false;" onclick="loginOpen();" class="login"><img src="/resources/img/comm/login.png" alt="로그인"></a>
		        		</c:when>
		        		<c:otherwise>
							<a href="<c:url value="/member/signup"/>" class="login"><img src="/resources/img/comm/login.png" alt="마이페이지"></a>		        		
		        		</c:otherwise>
					</c:choose>
		        </div>
		        <div id="gnb_wrap">
		            <input type="checkbox" id="bt_gnb">
		            <label for="bt_gnb">메뉴</label>
		            <div id="gnb">
		            	<div class="bg"></div>
		                <nav>
		                    <ul>
		                        <li><a href="/about">만성닷컴 소개</a></li>
		                        <li><a href="http://naver.me/IgoZTYYM" target="_blank">업체등록·정정신청</a></li>
		                        <li><a href="/guide">만성닷컴 이용안내</a></li>
		                        <li><a href="http://pf.kakao.com/_gxkyjxb" target="_blank">문의하기</a></li>
		                        <sec:authorize access="hasRole('ROLE_ADMIN')">
		                        	<li><a href="<c:url value="/admin/store"/>">관리자</a></li>
		                        </sec:authorize>
		                        <sec:authorize access="isAuthenticated()">
		                        	<li><a href="#" id="kakao-logout-btn">로그아웃</a></li>
		                        </sec:authorize>
		                    </ul>
		                </nav>
		            </div>
		        </div>
		    </div>
		    <c:choose>
		    	<c:when test="${fn:length(logo2) gt 0}">
				    <!-- 만성닷컴 검색창 -->
					<div class="search_wrap type1">
						<form action="/index">
							<input type="text" placeholder="검색어 입력" value="" name="query" id="header_search_txt">
							<input type="button" value="검색" onclick="javascript:search(this);">
						</form>
					</div>
				</c:when>
				<c:otherwise>
				    <!-- 만성인 검색창 -->
					<div class="search_wrap type2">
						<form action="/index">
							<input type="text" placeholder="검색어 입력" value="" name="query" id="header_search_txt">
							<input type="button" value="검색" onclick="javascript:search(this);">
						</form>
					</div>
				</c:otherwise>
			</c:choose>
	    </div>
	</header>
</div>