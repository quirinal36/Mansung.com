<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="su" uri="/WEB-INF/tlds/customTags" %>
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
                    <div class="admin_wrap admin_store_list">
                        <div class="tit1">업체 목록</div>
                        <div class="bt_wrap">
							 <a href="<c:url value="/admin/store/add"/>" class="bt1 on" style="position: absolute; top: 0; right: 17px;">등록</a>
						</div>
                        <table class="tbl2">
							<colgroup>
								<col width="40%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
                            <thead>
                                <tr>
                                    <th><a href="javascript:void(0);">업체명</a></th>
                                    <th><a href="javascript:void(0);">조회수</a></th>
                                    <th><a href="javascript:void(0);">최근 조회수</a></th>
                                    <th><a href="javascript:void(0);">등록일</a></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="item">
                            		<tr>
										<td class="name"><a href="<c:url value="/admin/store/view/${item.id }"/>">${item.title }</a></td>
										<td>100</td>
										<td>15</td>
										<td><fmt:formatDate value="${item.wdate}" pattern="yyyy-MM-dd" /></td>
									</tr>
                            	</c:forEach>
								
                            </tbody>
						</table>
						
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>