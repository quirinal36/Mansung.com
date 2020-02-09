$(function(){
/// Header
	// 메뉴 닫기
	$("#gnb .bg").click(function(){
		$("#bt_gnb").attr("checked", false);
	});
	
	// 검색어 자동입력
	var autoWordList = ["코딩", "분식", "치킨", "세탁소", "미용실", "변호사", "부동산"];
	var autoWordNum = Math.floor(Math.random() * autoWordList.length);
	var autoWord = autoWordList[autoWordNum];
	$("#header_search_txt").val(autoWord);
	$("#header_search_txt").focus(function(){
		$("#header_search_txt").val("");
	});
	
	// 대화주제 자동입력
	var talkList = [
		"오늘 만성동의 날씨는 어떤가요?",
		"내가 만성동에서 가장 좋아하는 곳은?",
		"갑자기 생각나는 음식이 있나요?",
		"서로에게 힘이 되는 글을 작성해주세요."
	]
	var talkListMsg = talkList[autoWordNum];
	$(".talk_write_wrap .msg_area textarea").prop("placeholder", talkListMsg);
	
	
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
    
    // 만성인 불편해요, 괜찮아요
    $(".bt_msg_hide + label").each(function(index, item){
        if ($(item).parent().find("input").is(":checked") == true){
        	$(item).html("괜찮아요");
    	} else{
        	$(item).html("불편해요");
    	}
    });
    
    // 불편해요, 괜찮아요
    $(".bt_msg_hide + label").click(function(){
    	if ($(this).parent().find("input").is(":checked") == true) {
    		$(this).html("불편해요");
    	} else {
    		$(this).html("괜찮아요");
    	}
    }); 
    // 만성인 차단, 차단 해제
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
	$("#msg-area").html("복사 완료!").slideDown();
	setTimeout(function() {
		$("#msg-area").slideUp();
	}, 2000);
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