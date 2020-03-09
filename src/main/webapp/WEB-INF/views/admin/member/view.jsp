<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <div class="admin_wrap admin_store_add">
                        <div class="tit1">상세보기</div>
                        <table class="tbl1">
                            <colgroup>
                                <col width="25%">
                                <col width="75%">
                            </colgroup>
                            <tbody>
                            	<tr>
                                    <th>등급</th>
                                    <td>업체</td>
                                </tr>
                            	<tr>
                                    <th>수정권한</th>
                                    <td>전주코딩학원</td>
                                </tr>
                            	<tr>
                                    <th>이름</th>
                                    <td>유단아</td>
                                </tr>
                            	<tr>
                                    <th>활동명</th>
                                    <td>로나맘</td>
                                </tr>
                            	<tr>
                                    <th>마지막 로그인</th>
                                    <td>2020-03-09 19:15</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="bt_wrap">
                            <a href="<c:url value="/admin/member/edit"/>" class="bt1 on">수정</a>
                            <a href="<c:url value="/admin/member"/>" class="bt1">목록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>