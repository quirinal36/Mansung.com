<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
	function submitEdit(){
		var url = $("#edit_form").attr("action");
		var param = $("#edit_form").serialize();
		console.log(param);
		
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			if(json.result > 0){
				alert("저장되었습니다.");
			}
		});
	}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="member_wrap name_set">
                        <strong class="title">활동명 설정</strong>
                        <p>
			                            만성닷컴에서 활동하실 이름을 입력해주세요.<br>
			                            최대 6자까지 입력 가능하며 공백은 제외됩니다.
                        </p>
                        <form action="/member/edit" method="post" id="edit_form">
                            <input type="text" placeholder="활동명 입력" class="ipt1" value="${user.nickname }" name="nickname"/>
                            <input type="hidden" name="id" value="${user.id }"/>
                            <input type="button" value="저장" class="bt4" onclick="javascript:submitEdit();"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>