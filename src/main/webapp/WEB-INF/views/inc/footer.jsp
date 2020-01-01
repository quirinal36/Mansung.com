<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(window).scroll(function(){
    // 하단 고정배너
    var top = $(window).scrollTop();
    // console.log(top);
    if(top > 100) {
        $("#fixedBanner").addClass("hide");
    } else {
        $("#fixedBanner").removeClass("hide");
    }
});
</script>
<div id="footerWrap">
	<footer>
	    <div id="footer">
	        ⓒ 전주코딩학원.
	    </div>
	</footer>
	
	<div id="fixedBanner">
	    <a href="https://blog.naver.com/code-ing/221741335660" target="_blank" style="background: #8f81bc;">
	        <img src="/resources/img/temp/2.png" alt="배너">
	    </a>
	</div>
</div>