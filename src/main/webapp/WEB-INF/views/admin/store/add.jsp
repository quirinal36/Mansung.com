<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script src="<c:url value="/resources/js/jquery.ui.widget.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.iframe-transport.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.fileupload.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/store.js"/>"></script>
	<script src="<c:url value="/resources/js/tag.js"/>"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="admin_wrap admin_store_add">
                        <div class="tit1">등록</div>
                        <form id="admin-store-add-form" action="<c:url value="/admin/store/add"/>">
	                        <table class="tbl1">
	                            <colgroup>
	                                <col width="25%">
	                                <col width="75%">
	                            </colgroup>
	                            <tbody>
	                            	<tr>
	                                    <th>카테고리</th>
	                                    <td>
	                                    	<select name="category">
	                                    		<option value="1">기타</option>
	                                    		<c:forEach items="${cateList }" var="cate">
                                    				<c:if test="${cate.id gt 1}">
                                    					<option value="${cate.id }">${cate.title }</option>
                                    				</c:if>
	                                    		</c:forEach>
	                                    	</select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>업체명</th>
	                                    <td><input type="text" placeholder="업체명 입력" class="ipt1" name="title"></td>
	                                </tr>
	                                <tr>
	                                    <th>지점명</th>
	                                    <td><input type="text" placeholder="지점명 입력" class="ipt1" name="titleLocal"></td>
	                                </tr>
	                                <tr>
	                                    <th>지역명</th>
	                                    <td>
	                                        <input type="text" value="전북 전주시 덕진구" placeholder="주소 입력" class="ipt1" name="address1">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>도로명</th>
	                                    <td>
	                                        <input type="text" placeholder="주소 입력" class="ipt1" name="address2">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>건물명</th>
	                                    <td>
	                                        <input type="text" placeholder="주소 입력" class="ipt1" name="address3">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>층</th>
	                                    <td>
	                                        <input type="text" placeholder="주소 입력" class="ipt1" name="address4">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>지번주소</th>
	                                    <td>
	                                        <input type="text" placeholder="주소 입력" class="ipt1" name="address5">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>X좌표</th>
	                                    <td>
	                                        <input type="text" placeholder="X좌표 입력" class="ipt1" name="xPosition">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>Y좌표</th>
	                                    <td>
	                                        <input type="text" placeholder="Y좌표 입력" class="ipt1" name="yPosition">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>전화번호</th>
	                                    <td><input type="text" placeholder="전화번호 입력" class="ipt1" name="phone1"></td>
	                                </tr>
	                                <tr>
	                                    <th>소개</th>
	                                    <td>
	                                        <textarea placeholder="소개 입력" class="ipt1" name="information"></textarea>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>메뉴</th>
	                                    <td>
	                                        <textarea placeholder="메뉴 입력" class="ipt1" name="storeMenu"></textarea>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>영업시간</th>
	                                    <td>
	                                        <textarea placeholder="영업시간 입력" class="ipt1" name="time"></textarea>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>웹사이트</th>
	                                    <td>
	                                        <input type="text" placeholder="웹사이트 주소 입력" class="ipt1" name="website">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>블로그</th>
	                                    <td>
	                                        <input type="text" placeholder="블로그 주소 입력" class="ipt1" name="blog">
	                                    </td>
	                                </tr>
	                                <tr class="image">
	                                    <th>대표이미지</th>
	                                    <td id="dropzone-img-rep">
	                                        <input id="image-upload-btn" type="file" accept="image/*" data-url="<c:url value="/upload/sized/image"/>">
	                                        <div id="progress_rep_image" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
										        <div class="progress-bar" style="width: 0%;" ></div>
										    </div>
	                                        <ul id="rep-image">
	                                        	
	                                        </ul>
	                                    </td>
	                                </tr>
	                                <tr class="image">
	                                    <th>상세이미지</th>
	                                    <td id="dropzone-img-det">
	                                        <input id="image-upload-btn-det" type="file" accept="image/*" data-url="<c:url value="/upload/image"/>">
	                                        <div id="progress_det_image" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
										        <div class="progress-bar" style="width: 0%;" ></div>
										    </div>
	                                        <ul id="det-image">
	                                            
	                                        </ul>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>태그</th>
	                                    <td>
											<div class="tag_area">
												<div class="add">
													<input type="text" placeholder="태그 입력(최대 10개)" id="ipt_tag" class="ipt1">
													<input type="button" value="추가" onclick="addTag();">
												</div>
												<div class="preview">
													<strong>태그 미리보기</strong>
													<div class="tags">
								
													</div>
												</div>
											</div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>텍스트 광고</th>
	                                    <td>
	                                    	<div class="colorSelect">
		                                    	<select name="bannerColor">
		                                    		<option value="1">① cadetblue</option>
		                                    		<option value="2">② cornflowerblue</option>
		                                    		<option value="3">③ steelblue</option>
		                                    		<option value="4">④ mediumpurple</option>
		                                    	</select>
		                                    	<div class="list">
		                                    		<span class="cadetblue">1</span>
		                                    		<span class="cornflowerblue">2</span>
		                                    		<span class="steelblue">3</span>
		                                    		<span class="mediumpurple">4</span>
		                                    	</div>
	                                    	</div>
	                                    	<input type="text" value="" placeholder="문구 입력" class="ipt1 mt-5" name="bannerText">
	                                    </td>
	                                </tr>
	                                <tr>
	                                	<th>텍스트 광고 링크</th>
	                                	<td>
	                                		<input type="text" name="textBannerLink" placeholder="링크 입력" class="ipt1"/>
	                                	</td>
	                                </tr>
	                                <tr class="image">
	                                    <th>이미지 광고</th>
	                                    <td id="dropzone-img">
	                                        <input id="imageupload" type="file" accept="image/*" data-url="<c:url value="/upload/image"/>" value="사진 등록">
	                                        <div id="progress_img" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
										        <div class="progress-bar" style="width: 0%;" ></div>
										    </div>
	                                        <ul id="banner-li">
	                                           
	                                        </ul>
	                                    </td>
	                                </tr>
	                                <tr>
	                                	<th>이미지 광고 링크</th>
	                                	<td>
	                                		<input type="text" name="wideBannerLink" placeholder="링크 입력" class="ipt1"/>
	                                	</td>
	                                </tr>
	                            	<tr>
	                                    <th>메인 노출순서</th>
	                                    <td><input type="number" value="" placeholder="노출순서 입력" class="ipt1" name="priority"></td>
	                                </tr>
	                                <tr>
	                                	<th>관리자 메모</th>
	                                	<td>
	                                		<textarea placeholder="메모 입력" class="ipt1" name="adminMemo"></textarea>
	                                	</td>
	                                </tr>
	                            </tbody>
	                        </table>
                        </form>
                        <div class="bt_wrap">
                            <a href="javascript:submitStore();" class="bt1 on">등록</a>
                            <a href="javascript:history.back();" class="bt1">취소</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>