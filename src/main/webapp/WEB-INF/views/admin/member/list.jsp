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
                    <div class="admin_wrap admin_store_list">
                        <div class="tit1">회원 목록</div>
                        <table class="tbl2">
							<colgroup>
								<col width="30%">
								<col width="40%">
								<col width="30%">
							</colgroup>
                            <thead>
                                <tr>
                                    <th><a href="javascript:void(0);">등급</a></th>
                                    <th><a href="javascript:void(0);">수정권한</a></th>
                                    <th><a href="javascript:void(0);">이름</a></th>
                                </tr>
                            </thead>
                            <tbody>
                           		<tr>
									<td>관리자</td>
									<td>전체</td>
									<td><a href="/admin/member/view">이형구</a></td>
								</tr>
                           		<tr>
									<td>업체</td>
									<td>전주코딩학원</td>
									<td><a href="/admin/member/view">유단아</a></td>
								</tr>
                           		<tr>
									<td>일반</td>
									<td>-</td>
									<td><a href="/admin/member/view">유믿음</a></td>
								</tr>
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