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
                    <div class="member_wrap name_set">
                        <strong class="title">활동명 설정</strong>
                        <p>
                            만성닷컴에서 활동하실 이름을 입력해주세요.<br>
                            최대 6자까지 입력 가능하며 공백은 제외됩니다.
                        </p>
                        <form>
                            <input type="text" placeholder="활동명 입력" class="ipt1">
                            <input type="submit" value="저장" class="bt4">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/inc/footer"></c:import>
	</div>	
</body>
</html>