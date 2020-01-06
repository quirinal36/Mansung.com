$(function(){
	// 메뉴 닫기
	$("#gnb .bg").click(function(){
		$("#bt_gnb").attr("checked", false);
	});
	
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
	
	var msg = document.getElementById("msg-area");
	msg.innerHTML = "copied!";
	$(msg).addClass("on");
	setTimeout(function() {
		$(msg).removeClass("on");
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