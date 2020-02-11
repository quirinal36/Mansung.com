function delImageClick(btn){
	var id = $(btn).parent().find("input[type='hidden']").val();
	var url = "/upload/delete";
	var param = "id="+id;

	$.ajax({
		url : url,
		data: param,
		type: "POST",
		dataType: "json"
	}).done(function(json){
		$(btn).parent().remove();				
	});
}
function editConfirm(){
	var url = $("#adminEditForm").attr("action");
	var param = $("#adminEditForm").serialize();
	
	if(confirm("저장하시겠습니까?")){
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			if(json.result > 0){
				alert("수정되었습니다.");
				window.location.replace("/admin/store/list");
			}
		});
	}
}
function submitStore(){
	var url = $("form").attr("action");
	var param = $("form").serialize();
	
	if(confirm("저장하시겠습니까?")){
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			if(json.result > 0){
				alert("등록되었습니다.");
				window.location.replace("/admin/store/list");
			}
		});
	}
}
$(document).ready(function(){
	$('#imageupload').fileupload({
    	imageCrop: true,
        dataType: 'json',
        done: function (e, data) {
        	var file = data.result.file;
        	console.log(file);
        	$("#banner-li").append(
        			$("<li>").append(
        				$("<img>").attr("src", file.thumbnailUrl)		
        			).append(
        				$("<input>")
        					.attr("type","button").addClass("bt2").val("삭제")
        					.attr("onclick", "delImageClick(this);")
        				
        			).append(
        				$("<input>")
        					.attr("type","hidden").attr("name", "wideBanner").val(file.id)
        			).attr("id", file.id)
        	);
        },
        progressall: function (e, data) {
        	var progress = parseInt(data.loaded / data.total * 100, 10);
            
            $('#progress_img .progress-bar').css(
                'width',
                progress + '%'
            );
            if(progress == 100){
            	$('#progress_img .progress-bar').css('width','0');
            }
        },
        dropZone: $('#dropzone-img')
	});
        
});