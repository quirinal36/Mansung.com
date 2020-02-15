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
	
	if(confirm("저장하시겠습니까?")){
		var dataObj = {};
		$($("#adminEditForm").serializeArray()).each(function (i,field){
			dataObj[field.name] = field.value;
		});
		if(dataObj['priority'] == '' || dataObj['priority'] < 0){
			console.log("remove priority");
			$("#adminEditForm").find("input[name='priority']").remove();
		}
		if(dataObj['bannerText'] == ''){
			console.log("remove bannerColor");
			$("#adminEditForm").find("input[name='bannerColor']").remove();
			$("#adminEditForm").find("input[name='bannerText']").remove();
		}
		
		var url = $("#adminEditForm").attr("action");
		var param = $("#adminEditForm").serialize();
	
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
	if(confirm("저장하시겠습니까?")){
		
		var dataObj = {};
		$($("#admin-store-add-form").serializeArray()).each(function (i,field){
			dataObj[field.name] = field.value;
		});
		if(dataObj['priority'] == '' || dataObj['priority'] < 0){
			$("#admin-store-add-form").find("input[name='priority']").remove();
		}
		if(dataObj['bannerText'] == ''){
			$("#admin-store-add-form").find("input[name='bannerColor']").remove();
			$("#admin-store-add-form").find("input[name='bannerText']").remove();
		}
		
		var url = $("#admin-store-add-form").attr("action");
		var param = $("#admin-store-add-form").serialize();
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

function makeLI(file, name){
	return $("<li>")
		.append(
			$("<img>").attr("src", file.thumbnailUrl))
		.append(
			$("<input>")
				.attr("type","button").addClass("bt2").val("삭제")
				.attr("onclick", "delImageClick(this);"))
		.append(
			$("<input>")
				.attr("type","hidden").attr("name", name).val(file.id))
		.attr("id", file.id);
}

$(document).ready(function(){
	
	// 대표이미지
	$('#image-upload-btn').fileupload({
		imageCrop: true,
        dataType: 'json',
        done: function (e, data) {
        	var file = data.result.file;
        	
        	$("#rep-image").append(makeLI(file, 'representImage'));
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
        dropZone: $('#dropzone-img-rep')
	});
	// 상세이미지
	$('#image-upload-btn-det').fileupload({
		imageCrop: true,
        dataType: 'json',
        done: function (e, data) {
        	var file = data.result.file;
        	
        	$("#det-image").append(makeLI(file, 'detailImages'));
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
        dropZone: $('#dropzone-img-det')
	});
	$('#imageupload').fileupload({
    	imageCrop: true,
        dataType: 'json',
        done: function (e, data) {
        	var file = data.result.file;
        	$("#banner-li").append(makeLI(file, 'wideBanner'));
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