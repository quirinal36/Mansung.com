$(function(){
	/// Header
	// 메뉴 닫기
	$("#gnb .bg").click(function(){
		$("#bt_gnb").attr("checked", false);
	});
	
	$("#header_search_txt").focus(function(){
		$("#header_search_txt").val("");
	});
	

	// 업체 상세보기 페이지(/store/view)의 태그 전체보기 기능
	var tags_height = $(".tags_wrap").height();
	console.log(tags_height);
	if( tags_height > 70 ) {
		$(".tags_wrap").addClass("over");
	}
	$(".tags_wrap .bt_more").click(function(){
		$(".tags_wrap").removeClass("over");
	});
	
	// 대화주제 자동입력
	var talkList = [
		"오늘 만성동의 날씨는 어떤가요?",
		"내가 만성동에서 가장 좋아하는 곳은?",
		"갑자기 생각나는 음식이 있나요?",
		"서로에게 힘이 되는 글을 작성해주세요."
	]
	var autoWordNum = Math.floor(Math.random() * talkList.length);
	var talkListMsg = talkList[autoWordNum];
	$(".talk_wrap .msg_area textarea").prop("placeholder", talkListMsg);

	
	/// Contents
    // 지도 선택
    $(".popup_selectMap_opener").click(function(){
        $(".popup_selectMap_wrap").css("display","table");
    });
    
    // 공유방법 선택
    $(".popup_selectShare_opener").click(function(e){
    	var shareURL = $(this).find("input").val();
    	$(".popup_selectShare_wrap").find("input[type='hidden']").val(shareURL);
        $(".popup_selectShare_wrap").css("display","table");
    });
    
    // 만성톡 긴 글 전체보기
    $(".msg_wrap .bt_more").click(function(){
    	$(this).hide();
    	$(this).parent().find("p").addClass("on");
    });
    
    // 만성인 불편해요, 괜찮아요
    $(".bt_msg_hide + label").each(function(index, item){
        if ($(item).parent().find("input").is(":checked") == true){
        	$(item).html("괜찮아요");
        	$(this).closest(".item").find(".msg").hide();
    	} else{
        	$(item).html("불편해요");
    	}
    });
    
    // 불편해요, 괜찮아요
    $(".bt_msg_hide + label").click(function(){
    	if ($(this).parent().find("input").is(":checked") == true) {
    		$(this).html("불편해요");
        	$(this).closest(".item").find(".msg").slideDown();
    	} else {
    		$(this).html("괜찮아요");
        	$(this).closest(".item").find(".msg").slideUp();
    	}
    }); 
    
    // 차단, 차단 해제
    $(".bt_msg_out + label").each(function(index, item){
        if ($(item).parent().find("input").is(":checked") == true){
        	$(item).html("차단 해제");
    	} else{
        	$(item).html("차단");
    	}
    });
    
    $(".bt_msg_out + label").click(function(){
    	if ($(this).parent().find("input").is(":checked") == true) {
    		$(this).html("차단");
    	} else {
    		$(this).html("차단 해제");
    	}
    });
    
    // 팝업 닫기
    $(".bt_popupClose").click(function(){
        $(".popupWrap").fadeOut();
    });
});




/**
 * 클립보드 복사 (전화번호/주소)
 * 
 * @param button
 * @returns
 */
function copyInnerHtml(button){
	var div = button.parentNode.getElementsByTagName("span")[0];
	var text = div.innerHTML.trim();
	
	copyIntoClipboard(text);
	/*
	var msg = document.getElementById("msg-area");
	msg.innerHTML = "copied!";
	$(msg).addClass("on");
	setTimeout(function() {
		$(msg).removeClass("on");
	}, 1000);
	*/
	// 주석 부분 제이쿼리로 수정함
	$("#msg-area").html("<span>복사 완료!</span>").fadeIn(200);
	setTimeout(function() {
		$("#msg-area").fadeOut(200);
	}, 1000);
}

function copyPhoneMsg(button) {
	var div = button.parentNode.getElementsByTagName("span")[0];
	var text = div.innerHTML.trim();
	
	copyIntoClipboard(text);
	$("#msg-area").html("<span>전화번호가 복사되었습니다.</span>").fadeIn(200);
	setTimeout(function() {
		$("#msg-area").fadeOut(200);
	}, 1000);
}

function copyAddressMsg(button) {
	var div = button.parentNode.getElementsByTagName("span")[0];
	var text = div.innerHTML.trim();
	
	copyIntoClipboard(text);
	$("#msg-area").html("<span>주소가 복사되었습니다.</span>").fadeIn(200);
	setTimeout(function() {
		$("#msg-area").fadeOut(200);
	}, 1000);
}

function copyToShare(){
	var input = document.getElementsByClassName("popup_selectShare_wrap")[0].getElementsByTagName("input")[0];
	copyIntoClipboard(input.value);
}

function copyIntoClipboard(text){
	var tempElem = document.createElement("input");
	tempElem.value = text;
	document.body.appendChild(tempElem);
	tempElem.select();
	document.execCommand("copy");
	
	document.body.removeChild(tempElem);
}

function search(elem){
	$(elem).closest("form").submit();
}

// Login
function loginOpen() {
	var text = [
		"행복한 여행의<br> 가장 큰 준비물은<br> 	가벼운 마음이다.<br> <span>- 생텍쥐페리</span>",
		"인생에서 실패한 사람 중 다수는<br> 성공을 목전에 두고도 모른 채<br> 포기한 이들이다.<br> <span>- 에디슨</span>"
	]
	
	var num = Math.floor(Math.random() * 2 + 1);
	console.log("num : " + num);
	
	$("#login_wrap .txt_wrap").html(text[num-1]);
	
	
	$("#login_wrap .bg").css("background-image", "url(/resources/img/member/login_bg" + num + ".jpg)");
	$("#login_wrap").show().animate({
		top: "0"
	}, 200 );
	$("#fixedBanner").hide();
}

function loginClose() {
	$("#login_wrap").animate({
		top: "100%"
	}, 200 );
	setTimeout(function(){
		$("#login_wrap").hide();
	}, 200);
	$("#fixedBanner").show();
}