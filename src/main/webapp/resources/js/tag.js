function addTag() {
	var num = $(".tags a").length;
	if( num < 10 ) {
		var txt = $("#ipt_tag").val();
		txt = txt.replace(/\s/gi, ""); // 모든 공백 제거
		txt = txt.replace(/,/g, ''); // 쉼표 제거
		
		// 공백이 아닐 때만 태그 생성	
		if(txt != "") {
			$(".tags").append(' <a href="javascript:void(0);">' + txt + ' <input type="button" value="삭제" onclick="deleteTag(this)"></a>');
			$("#ipt_tag").val("");
		}	
	}
}

$(function(){
	// 태그 입력창에서 엔터 눌렀을 때
	$("#ipt_tag").keyup(function(e){
		if(e.keyCode == 13){
			addTag();
		}
	});
	
    // 태그 누르면 검색하기
    $(".msg_tags a").click(function(){
    	var searchWord = $(this).html();
    	$(location).attr("href", "/index?query=" + searchWord);
    });
});

function deleteTag(bt) {
	$(bt).parent().remove();
}

/*
// 태그 입력창에서 스페이스바, 쉼표 눌렀을 때
$("#ipt_tag").keydown(function(e){
	// console.log(e.keyCode);
	if(e.keyCode == 32 || e.keyCode == 188){
		e.preventDefault();
		saveTag();
	}
});

// 태그 입력창에서 벗어났을 때
$("#ipt_tag").focusout(function(e){
	if(e.keyCode == 13){
		saveTag();
	}
});
*/