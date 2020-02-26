<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script>
        function moveUp(bt) {
            var $tr = $(bt).closest("tr");
            
            var bOrder = $tr.prev().find("input[name='recOrder']").val();
            var bId = $tr.prev().find("input[name='id']").val();
            var bVisible = $tr.prev().find("input[name='visible']").val();
            var cOrder = $tr.find("input[name='recOrder']").val();
            var cId = $tr.find("input[name='id']").val();
            var cVisible = $tr.find("input[name='visible']").val();
            
			if(bId > 0 && bId != 'undefined'){	        
		        var url = "/admin/store/recommend/edit";
		        var param = "id="+bId +"&recOrder="+cOrder+"&visible="+cVisible;
		        $.ajax({
		        	url : url,
	            	data: param,
	            	type: "POST",
	            	dataType: "json"
		        }).done(function(){
		        	param = "id="+cId +"&recOrder="+bOrder+"&visible="+bVisible;
		        	$.ajax({
		        		url : url,
		            	data: param,
		            	type: "POST",
		            	dataType: "json"
		        	}).done(function(){
		        		$tr.prev().before($tr);
		        	});
		        });
			}
        }
        function moveDown(bt) {
            var $tr = $(bt).closest("tr");
            
            var nOrder = $tr.next().find("input[name='recOrder']").val();
            var nId = $tr.next().find("input[name='id']").val();
            var nVisible = $tr.next().find("input[name='visible']").val();
            var cOrder = $tr.find("input[name='recOrder']").val();
            var cId = $tr.find("input[name='id']").val();
            var cVisible = $tr.find("input[name='visible']").val();
            
            if(nId > 0 && nId != 'undefined'){	        
		        var url = "/admin/store/recommend/edit";
		        var param = "id="+nId +"&recOrder="+cOrder+"&visible="+cVisible;
		        $.ajax({
		        	url : url,
	            	data: param,
	            	type: "POST",
	            	dataType: "json"
		        }).done(function(){
		        	param = "id="+cId +"&recOrder="+nOrder+"&visible="+nVisible;
		        	$.ajax({
		        		url : url,
		            	data: param,
		            	type: "POST",
		            	dataType: "json"
		        	}).done(function(){
		        		$tr.next().after($tr);
		        	});
		        });
			}
        }
        function recommendDelete(bt) {
        	var id = $(bt).parent().find("input[name='id']").val();
            if(confirm("삭제하시겠습니까?")){
	            var url = "/admin/store/recommend/delete";
	            var param = "id="+id;
	            
	            $.ajax({
	            	url : url,
	            	data: param,
	            	type: "POST",
	            	dataType: "json"
	            }).done(function(json){
	            	if(json.result > 0){
	            		$(bt).closest("tr").remove();
	            	}
	            });
            }
        }
        $(function(){
        	$(".ipt1").focusout(function(item){
        		var param = "";
        		$(this).closest("tr").find("input").each(function(i, elem){
        			param = param +"&"+ $(elem).attr("name") +"=" + $(elem).val(); 
        		});
        		
        		var url = "/admin/store/recommend/edit";
        		$.ajax({
        			url : url,
        			data: param,
            		type: "POST",
            		dataType: "json"
        		}).done(function(json){
        			if(json.result > 0 && json.filled == true){
        				$("#bt_private"+json.recommend.id).removeAttr("disabled");
        			}
        		});
        	});
            $(".bt_recommend_add").click(function(){
                // 현재 추천 갯수
                var url = "/admin/store/recommend/add";
                
                $.ajax({
                	url : url,
            		type: "POST",
            		dataType: "json"
                }).done(function(json){
                	if(json.result > 0){
                		window.location.reload();
                	}
                });
            });
            $(".bt_private").change(function(e){
            	var isChecked = $(this).is(":checked") ? 0 : 1;
            	var id = $(this).parent().find("input[name='id']").val();
            	
            	var url = "/admin/store/recommend/edit";
            	var param = "id="+id +"&visible="+isChecked;
        		$.ajax({
        			url : url,
        			data: param,
            		type: "POST",
            		dataType: "json"
        		}).done(function(json){
        			
        		});
            });
        });
    </script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
					<div class="admin_wrap admin_recommend_wrap">
			            <div class="tit1">추천 카테고리 관리</div>
			            <form>
			                <table class="tbl2">
			                    <colgroup>
			                        <col width="20%">
			                        <col width="50%">
			                        <col width="30%"> 
			                    </colgroup>
			                    <thead>
			                        <tr>
			                            <th><a href="javascript:void(0);">등록일</a></th>
			                            <th><a href="javascript:void(0);">제목</a></th>
			                            <th><a href="javascript:void(0);">설정</a></th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${list }" var="item">
			                    		<tr>
				                            <td><fmt:formatDate value="${item.wdate }" pattern="yyyy-MM-dd"/></td>
				                            <td>
				                                <input type="text" placeholder="설명 입력" value="${item.subTitle }" class="ipt1" name="subTitle">
				                                <input type="text" placeholder="제목 입력" value="${item.title }" class="ipt1 ipt_title" name="title">
				                                <input type="text" placeholder="태그 입력" value="${item.query }" class="ipt1" name="query">
				                                <input type="hidden" name="id" value="${item.id }">
				                            </td>
				                            <td>
				                                <input type="button" value="위로" onclick="moveUp(this)" class="bt_up">
				                                <input type="button" value="아래로" onclick="moveDown(this)" class="bt_down">
				                                <input type="checkbox" id="bt_private${item.id }" class="bt_private"
				                                	<c:if test="${fn:length(item.title) eq 0 and fn:length(item.subTitle) eq 0 and fn:length(item.query) eq 0 }">disabled='disabled'</c:if> 
				                                	<c:if test="${item.visible eq 0}">checked='checked'</c:if>
				                                >
			                                	<label for="bt_private${item.id }">비공개</label>
				                                <input type="button" value="삭제" onclick="recommendDelete(this)" class="bt_del">
				                                <input type="hidden" name="visible" value="${item.visible }">
				                                <input type="hidden" name="recOrder" value="${item.recOrder }">
				                                <input type="hidden" name="id" value="${item.id }">
				                            </td>
				                        </tr>
			                    	</c:forEach>
			                    	<!-- 
			                        <tr>
			                            <td>1</td>
			                            <td>
			                                <input type="text" placeholder="설명 입력" value="밖에 나가기 조심스러우시죠?" class="ipt1">
			                                <input type="text" placeholder="제목 입력" value="우리동네 배달 가능한 식당/마트" class="ipt1 ipt_title">
			                                <input type="text" placeholder="태그 입력" value="" class="ipt1">
			                            </td>
			                            <td>
			                                <input type="button" value="위로" onclick="moveUp(this)" class="bt_up">
			                                <input type="button" value="아래로" onclick="moveDown(this)" class="bt_down">
			                                <input type="checkbox" id="bt_private1" class="bt_private">
			                                <label for="bt_private1">비공개</label>
			                                <input type="button" value="삭제" onclick="recommendDelete(this)" class="bt_del">
			                            </td>
			                        </tr>
			                        <tr>
			                            <td>2</td>
			                            <td>
			                                <input type="text" placeholder="설명 입력" class="ipt1">
			                                <input type="text" placeholder="제목 입력" class="ipt1 ipt_title">
			                                <input type="text" placeholder="태그 입력" value="" class="ipt1">
			                            </td>
			                            <td>
			                                <input type="button" value="위로" onclick="moveUp(this)" class="bt_up">
			                                <input type="button" value="아래로" onclick="moveDown(this)" class="bt_down">
			                                <input type="checkbox" id="bt_private2" class="bt_private">
			                                <label for="bt_private2">비공개</label>
			                                <input type="button" value="삭제" onclick="recommendDelete(this)" class="bt_del">
			                            </td>
			                        </tr>
			                         -->
			                    </tbody>
			                </table>
			                <div class="bt_wrap">
			                    <input type="button" value="추가" class="bt1 on bt_recommend_add">
			                </div>
			            </form>
			        </div>
                </div>
            </div>
        </div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>