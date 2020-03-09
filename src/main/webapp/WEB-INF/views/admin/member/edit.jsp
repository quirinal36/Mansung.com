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
                        <div class="tit1">수정</div>
                        <table class="tbl1">
                            <colgroup>
                                <col width="25%">
                                <col width="75%">
                            </colgroup>
                            <tbody>
                            	<tr>
                                    <th>등급</th>
                                    <td>
                                    	<select>
											<option>관리자</option>
											<option>업체</option>
											<option>일반</option>
                                    	</select>
                                    </td>
                                </tr>
                            	<tr>
                                    <th>수정권한</th>
                                    <td>
                                    	<input type="text" value="" placeholder="업체 id(숫자) 입력" class="ipt1">
                                    </td>
                                </tr>
                            	<tr>
                                    <th>이름</th>
                                    <td>유단아</td>
                                </tr>
                            	<tr>
                                    <th>활동명</th>
                                    <td><input type="text" value="" placeholder="활동명 입력" class="ipt1"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="bt_wrap">
                            <a href="#" class="bt1 on">수정</a>
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