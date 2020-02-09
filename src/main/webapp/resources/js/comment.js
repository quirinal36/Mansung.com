var txtList = [
	"말은 마음의 초상이다.",
	"말은 행동의 거울이다.",
	"말을 많이 한다는 것과 잘 한다는 것은 별개이다.",
	"아름다운 말은 믿음직스럽다.",
	"훌륭한 말은 훌륭한 무기이다.",
	"관속에 들어가도 막말은 말라.",
	"발 없는 말이 천 리 간다.",
	"가는 말이 고와야 오는 말도 곱다.",
	"아 해 다르고 어 해 다르다.",
	"말은 꿀벌과 같아서 꿀과 침을 가졌다.",
	"말에 실수가 없는 자면 곧 온전한 사람이다.",
	"혀 아래 도끼 들었다."
]

function eChk(label) {
	var isChked = $(label).parent().find("input").is(":checked");
	if( isChked ) {
		$(".emoticon_area .selected").slideUp();
	} else {
		// 다른 이모티콘 선택해제
    	$(".emoticon_area .list input").prop("checked", false);
		// 선택한 이모티콘 표시
		var imgSrc = $(label).parent().find("input").prop("id");
		if( imgSrc == "e1" || imgSrc == "e2" || imgSrc == "e3" || imgSrc == "e4" ) {
			$(".emoticon_area .selected img").attr("src", "/resources/img/emoticon/" + imgSrc + ".gif");
		} else {
			$(".emoticon_area .selected img").attr("src", "/resources/img/emoticon/" + imgSrc + ".png");
		}
		// 선택된 이모티콘창 열림
		$(".emoticon_area .selected").slideDown();
	}
}

// 이모티콘 선택창 열림
var eListStatus = 0;
function eList(bt) {
	if(eListStatus == 0) {
		$(bt).addClass("open");
		$(".emoticon_area").show();
		eListStatus ++;
	} else {
		$(bt).removeClass("open");
		$(".emoticon_area").hide();
		eListStatus --;
    	$('.emoticon_area .list input').prop("checked", false);
		$(".emoticon_area .selected").hide();
	}
}

$(function(){
    // 댓글 작성 창 열기
    $(".bt_comment_write, .bt_reply").click(function(){
    	$(".comment_write_area").fadeIn();
    	var msgNum = Math.floor(Math.random() * txtList.length);
    	// 댓글 작성창 자동입력
    	var txtList_msg = txtList[msgNum];
    	$('.comment_write input[type="text"]').prop("placeholder", txtList_msg); 
    });
    
    // 댓글 작성 창 닫기, 작성내용 초기화
    $(".comment_write_area .bg").click(function(){
    	$(".comment_write_area").fadeOut(100);
    	setTimeout(function(){
    		$('.comment_write input[type="text"]').val("");
    	}, 100);
    });
    
    // 이모티콘 선택 해제
    $(".emoticon_area .bt_close").click(function(){
    	$(".emoticon_area .selected").slideUp();
    	$(".emoticon_area .list input").prop("checked", false);
    });
});