<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div id="container">
				<div id="contentsPrint">
                    <div class="admin_wrap admin_store_add">
                        <div class="tit1">상세보기</div>
                        <table class="tbl1">
                            <colgroup>
                                <col width="25%">
                                <col width="75%">
                            </colgroup>
                            <tbody>
                            	<tr>
                                    <th>분류</th>
                                    <td>${store.categoryTitle }</td>
                                </tr>
                                <tr>
                                    <th>업체명</th>
                                    <td>${store.title }</td>
                                </tr>
                                <tr>
                                    <th>지점명</th>
                                    <td>${store.titleLocal }</td>
                                </tr>
                                <tr>
                                    <th>지역명</th>
                                    <td>${store.address1 }</td>
                                </tr>
                                <tr>
                                    <th>도로명</th>
                                    <td>${store.address2 }</td>
                                </tr>
                                <tr>
                                    <th>건물명</th>
                                    <td>${store.address3 }</td>
                                </tr>
                                <tr>
                                    <th>층</th>
                                    <td>${store.address4 }</td>
                                </tr>
                                <tr>
                                    <th>지번주소</th>
                                    <td>${store.address5 }</td>
                                </tr>
                                <tr>
                                    <th>X좌표</th>
                                    <td>${store.XPosition }</td>
                                </tr>
                                <tr>
                                    <th>Y좌표</th>
                                    <td>${store.YPosition }</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>${store.phone1 }</td>
                                </tr>
                                <tr>
                                    <th>소개</th>
                                    <td>${fn:replace(store.information, newLineChar, "<br/>")}</td>
                                </tr>
                                <tr>
                                    <th>메뉴</th>
                                    <td>${fn:replace(store.storeMenu, newLineChar, "<br/>")}</td>
                                </tr>
                                <tr>
                                    <th>영업시간</th>
									<td>
										${fn:replace(store.time, newLineChar, "<br/>")}
                                    </td>
								</tr>
								<tr>
                                    <th>웹사이트</th>
                                    <td><a href="http://xn--o01bu84am0am2a97shmj.com" target="_blank">${store.website }</a></td>
                                </tr>
                                <tr>
                                    <th>블로그</th>
                                    <td><a href="https://blog.naver.com/code-ing" target="_blank">${store.blog }</a></td>
                                </tr>
                                <tr class="image">
                                    <th>대표이미지</th>
                                    <td>
                                        <ul>
                                            <li>
                                                <a href="${store.representImageUrl }" target="_blank">${store.representImageUrl }</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr class="image">
                                    <th>상세이미지</th>
                                    <td>
                                        <ul>
                                        	<c:forEach items="${detailImages }" var="item">
	                                        	<li>
	                                                <a href="${item.thumbnailUrl }" target="_blank">${item.thumbnailUrl }</a>
	                                            </li>
                                        	</c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>텍스트 광고</th>
                                    <td>
                                    	${store.bannerText}
                                    </td>
                                </tr>
                                <tr>
                                	<th>텍스트 광고 링크</th>
                                	<td>
                                		${store.textBannerLink }
                                	</td>
                                </tr>
                                <tr class="image">
                                    <th>이미지 광고</th>
                                    <td>
                                        <ul>
                                        	<c:if test="${not empty wideBanner }">
	                                            <li>
	                                                <img src="${wideBanner.url }">
	                                            </li>
                                            </c:if>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이미지 광고 링크</th>
                                    <td>${store.wideBannerLink }</td>
                                </tr>
                                <tr>
                                    <th>태그</th>
                                    <td>
										<div class="tags">
											<c:forEach items="${tags }" var="item">
												<a href="#">${item.name }</a>
											</c:forEach>
											
										</div>
                                    </td>
                                </tr>
                            	<tr>
                                    <th>메인 노출순서</th>
                                    <td>
                                    	${store.priority }
                                    </td>
                                </tr>
                            	<tr>
                                    <th>관리자 메모</th>
                                    <td>
                                    	${store.adminMemo }
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="bt_wrap">
                            <a href="<c:url value="/admin/store/edit/${store.id }"/>" class="bt1 on">수정</a>
                            <a href="<c:url value="/admin/store/list"/>" class="bt1">목록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>