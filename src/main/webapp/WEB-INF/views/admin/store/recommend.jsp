<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script>
        function moveUp(bt) {
            var $tr = $(bt).parent().parent();
	        $tr.prev().before($tr);
        }
        function moveDown(bt) {
            var $tr = $(bt).parent().parent();
	        $tr.next().after($tr);
        }
        function recommendDelete(bt) {
            alert("삭제하시겠습니까?");
            $(bt).closest("tr").remove();
        }
        $(function(){
        	$(".ipt1").focusout(function(item){
        		var obj = new Object();
        		$(this).parent().find("input").each(function(i, elem){
        			console.log($(elem).attr("name"));
        			console.log($(elem).val());
        			
        		});
        		
        		var url = "/admin/store/recommend/edit";
        		$.ajax({
        			url : url,
        			data: param,
            		type: "POST",
            		dataType: "json"
        		}).done(function(json){
        			
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
                		var num = json.recommend.id;
                		window.location.reload();
                		/*
                		$(".admin_recommend_wrap tbody")
                    	.append(
                    			$("<tr>")
                    			.append(
                    				$("<td>").html(num+1)
                    			).append(
                    				$("<td>")
                    					.append($("<input>").attr("type","text").attr("placeholder","설명 입력").addClass("ipt1"))
                    					.append($("<input>").attr("type","text").attr("placeholder","설명 입력").addClass("ipt1"))
                    					.append($("<input>").attr("type","text").attr("placeholder","설명 입력").addClass("ipt1"))
                    			).append(
                    				$("<td>")
                    					.append($("<input>").attr("type","button").attr("onclick","moveUp(this)").addClass("bt_up").val("위로"))
                    					.append($("<input>").attr("type","button").attr("onclick","moveDown(this)").addClass("bt_down").val("아래로"))
                    					.append($("<input>").attr("type","checkbox").attr("id","bt_private"+(num+1)).addClass("bt_private"))
                    					.append($("<label>").attr("for","bt_private"+(num+1)).html("비공개"))
                    					.append($("<input>").attr("type","button").attr("onclick","recommendDelete(this)").addClass("bt_del").val("삭제"))
                    			)
                    		);
                		*/
                	}
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
			                        <col width="10%">
			                        <col width="70%">
			                        <col width="30%">
			                    </colgroup>
			                    <thead>
			                        <tr>
			                            <th><a href="javascript:void(0);">등록번호</a></th>
			                            <th><a href="javascript:void(0);">제목</a></th>
			                            <th><a href="javascript:void(0);">설정</a></th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${list }" var="item">
			                    		<tr>
				                            <td>${item.id }</td>
				                            <td>
				                                <input type="text" placeholder="설명 입력" value="${item.title }" class="ipt1" name="title">
				                                <input type="text" placeholder="제목 입력" value="${item.subTitle }" class="ipt1 ipt_title" name="subtitle">
				                                <input type="text" placeholder="태그 입력" value="${item.query }" class="ipt1" name="query">
				                                <input type="hidden" name="id" value="${item.id }">
				                            </td>
				                            <td>
				                                <input type="button" value="위로" onclick="moveUp(this)" class="bt_up">
				                                <input type="button" value="아래로" onclick="moveDown(this)" class="bt_down">
				                                <input type="checkbox" id="bt_private1" class="bt_private">
				                                <label for="bt_private1">비공개</label>
				                                <input type="button" value="삭제" onclick="recommendDelete(this)" class="bt_del">
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