function addTag() {
	var num = $(".tags a").length;
	if( num < 100 ) {
		var txt = $("#ipt_tag").val();
		txt = txt.replace(/\s/gi, ""); // 모든 공백 제거
		txt = txt.replace(/,/g, ''); // 쉼표 제거
		
		// 공백이 아닐 때만 태그 생성	
		if(txt != "") {
			console.log(txt);
			$.ajax({
				url : "/admin/store/tag",
				data: "tagName="+txt,
				type: "POST",
				dataType: "json"
			}).done(function(json){
				$(".tags").append(
						$("<a>").attr("href","javascript:return false;").text(txt)
							.append( $("<input>").attr("type", "button").val("삭제").attr("onclick", "javascript:deleteTag(this)") )
							.append( $("<input>").attr("type", "hidden").attr("name","tagId").val(json.id) )
						);
			});
			// $(".tags").append(' <a href="javascript:void(0);">' + txt + ' <input type="button" value="삭제" onclick="deleteTag(this)"></a>');
			
			$("#ipt_tag").val("");
		}	
	}
}

// 페이지 가장 하단으로 스크롤
function scrollBottom() {
	$('html, body').scrollTop( $(document).height() );
}

$(function(){
	// 태그 입력창에서 엔터 눌렀을 때
	$("#ipt_tag").keyup(function(e){
		if(e.keyCode == 13){
			addTag();
			scrollBottom();
		}
	});
	
    // 태그 누르면 검색하기
    $(".msg_tags a").click(function(){
    	var searchWord = $(this).html();
    	$(location).attr("href", "/index?query=" + searchWord);
    });
});

function deleteTag(bt) {
	var storeId = $("#adminEditForm").find("input[name='id']").val();
	
	if(storeId > 0){
		var tagId = $(bt).parent().find("input[name='tagId']").val();
		
		var url = "/admin/store/tag/delete";
		var param = "hashId="+tagId +"&storeId="+storeId;
		console.log(url);
		console.log(param);
		
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			$(bt).parent().remove();
		});
	}else{
		$(bt).parent().remove();
	}
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