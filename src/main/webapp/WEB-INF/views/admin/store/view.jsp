<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="store_add">
                        <div class="tit1">상세보기</div>
                        <table class="tbl1">
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
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
                                    <td>${store.information }</td>
                                </tr>
                                <tr>
                                    <th>영업시간</th>
									<td>
										${store.time }
                                    </td>
								</tr>
								<tr></tr>
                                    <th>웹사이트</th>
                                    <td><a href="http://xn--o01bu84am0am2a97shmj.com" target="_blank">${store.website }</a></td>
                                </tr>
                                <tr>
                                    <th>블로그</th>
                                    <td><a href="https://blog.naver.com/code-ing" target="_blank">${store.blog }</a></td>
                                </tr>
                                <tr class="image">
                                    <th>썸네일</th>
                                    <td>
                                        <ul>
                                            <li>
                                                <a href="/resources/img/temp/1.png" target="_blank">/resources/img/temp/1.png</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr class="image">
                                    <th>상세이미지</th>
                                    <td>
                                        <ul>
                                            <li>
                                                <a href="/resources/img/temp/1.png" target="_blank">/resources/img/temp/1.png</a>
                                            </li>
                                            <li>
                                                <a href="/resources/img/temp/2.png" target="_blank">/resources/img/temp/2.png</a>
                                            </li>
                                            <li>
                                                <a href="/resources/img/temp/3.png" target="_blank">/resources/img/temp/3.png</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr class="image">
                                    <th>와이드 배너</th>
                                    <td>
                                        <ul>
                                            <li>
                                                <a href="/resources/img/temp/1.png" target="_blank">/resources/img/temp/1.png</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>키워드</th>
                                    <td>
										<div class="tags">
											<a href="#">김밥</a>
											<a href="#">떡볶이</a>
											<a href="#">쫄면</a>
											<a href="#">우동</a>
											<a href="#">돈까스</a>
											<a href="#">라면</a>
											<a href="#">오므라이스</a>
											<a href="#">돌솥비빔밥</a>
											<a href="#">된장찌개</a>
											<a href="#">볶음밥</a>
											<a href="#">잡채밥</a>
										</div>
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