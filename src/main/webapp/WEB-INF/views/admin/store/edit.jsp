<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
		function editConfirm(){
			var url = $("form").attr("action");
			var param = $("form").serialize();
			
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
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="store_add">
                        <div class="tit1">수정</div>
                        <form action="<c:url value="/admin/store/edit"/>">
	                        <table class="tbl1">
	                            <colgroup>
	                                <col width="20%">
	                                <col width="80%">
	                            </colgroup>
	                            <tbody>
	                                <tr>
	                                    <th>업체명</th>
	                                    <td><input type="text" value="${store.title }" placeholder="업체명 입력" class="ipt1"></td>
	                                </tr>
	                                <tr>
	                                    <th>주소</th>
	                                    <td>
	                                        <input type="text" value="${store.address1 } ${store.address2 } ${store.address3 }" placeholder="주소 입력" class="ipt1">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>X좌표</th>
	                                    <td>
	                                        <input type="text" value="${store.XPosition }" placeholder="X좌표 입력" class="ipt1">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>Y좌표</th>
	                                    <td>
	                                        <input type="text" value="${store.YPosition }" placeholder="Y좌표 입력" class="ipt1">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>전화번호</th>
	                                    <td><input type="text" value="${store.phone1 }" placeholder="전화번호 입력" class="ipt1"></td>
	                                </tr>
	                                <tr>
	                                    <th>소개</th>
	                                    <td>
	                                        <textarea placeholder="소개 입력" class="ipt1">${store.information }</textarea>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>영업시간</th>
	                                    <td>
	                                        <textarea placeholder="영업시간 입력" class="ipt1">${store.time }</textarea>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>웹사이트</th>
	                                    <td>
	                                        <input type="text" value="${store.website }" placeholder="웹사이트 주소 입력" class="ipt1">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>블로그</th>
	                                    <td>
	                                        <input type="text" value="${store.blog }" placeholder="블로그 주소 입력" class="ipt1">
	                                    </td>
	                                </tr>
	                                <tr class="image">
	                                    <th>썸네일</th>
	                                    <td>
	                                        <input type="button" value="사진 등록" class="bt2">
	                                        <ul>
	                                            <li>
	                                                <a href="/resources/img/temp/1.png" target="_blank">/resources/img/temp/1.png</a>
	                                                <input type="button" value="삭제" class="bt2">
	                                            </li>
	                                        </ul>
	                                    </td>
	                                </tr>
	                                <tr class="image">
	                                    <th>상세이미지</th>
	                                    <td>
	                                        <input type="button" value="사진 등록" class="bt2">
	                                        <ul>
	                                            <li>
	                                                <a href="/resources/img/temp/1.png" target="_blank">/resources/img/temp/1.png</a>
	                                                <input type="button" value="삭제" class="bt2">
	                                            </li>
	                                            <li>
	                                                <a href="/resources/img/temp/2.png" target="_blank">/resources/img/temp/2.png</a>
	                                                <input type="button" value="삭제" class="bt2">
	                                            </li>
	                                            <li>
	                                                <a href="/resources/img/temp/3.png" target="_blank">/resources/img/temp/3.png</a>
	                                                <input type="button" value="삭제" class="bt2">
	                                            </li>
	                                        </ul>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>키워드</th>
	                                    <td>
	                                        <input type="text" placeholder="키워드 입력" class="ipt1">
	                                        <div class="tags">
	                                            <a href="#">김밥 <input type="button" value="삭제"></a>
	                                            <a href="#">떡볶이 <input type="button" value="삭제"></a>
	                                            <a href="#">쫄면 <input type="button" value="삭제"></a>
	                                            <a href="#">우동 <input type="button" value="삭제"></a>
	                                            <a href="#">돈까스 <input type="button" value="삭제"></a>
	                                            <a href="#">라면 <input type="button" value="삭제"></a>
	                                            <a href="#">오므라이스 <input type="button" value="삭제"></a>
	                                            <a href="#">돌솥비빔밥 <input type="button" value="삭제"></a>
	                                            <a href="#">된장찌개 <input type="button" value="삭제"></a>
	                                            <a href="#">볶음밥 <input type="button" value="삭제"></a>
	                                            <a href="#">잡채밥 <input type="button" value="삭제"></a>
	                                        </div>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
                        </form>
                        <div class="bt_wrap">
                            <a href="javascript:editConfirm();" class="bt1 on">수정</a>
                            <a href="<c:url value="/admin/store"/>" class="bt1">취소</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>