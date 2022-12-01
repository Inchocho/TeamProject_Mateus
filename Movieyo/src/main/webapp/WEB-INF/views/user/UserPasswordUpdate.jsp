<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	#div{
	border: 1px solid black;
	width: 450px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function pageMoveBeforeFnc(userNo){
		location.href = 'one.do?userNo=' + userNo;
	}
	
		function asd() {
			var a = $('#password').val();
			var b = $('#passwordC').val();
			var c = $('#changePw').val();
			var d = $('#changePwC').val();
			
// 			alert(a);
// 			alert(b);

			if (a != b) {
				alert('현재비밀번호를 확인해주세요');
			}else if (c != d) {
				alert('비밀번호가 일치하지 않습니다');
			}else {
				submitFormObj = document.getElementById('submitForm');
				alert('비밀번호 변경성공');
				submitForm.submit();
				
			}
		
		}
			
		
	
			
		
		
</script>
</head>
<body>
	
	<jsp:include page="../Header.jsp"/>
	
	<div id="div">
		<h1>비밀번호 변경</h1><br>
		<form action="./passwordUpdateCtr.do" method="post" id="submitForm">
			<input type="hidden" name='userNo'
			value='${userDto.userNo}' readonly="readonly"><br>
			<!-- 비밀번호 변경확인 로직을 위한 hidden값 패스워드 -->
			<input type="hidden" value="${userDto.password}" id="password">
			현재 비밀번호  : <input type="password" placeholder="현재비밀번호:" id="passwordC"><br>
			변경할비밀번호: <input type="password" name="password" placeholder="변경할 비밀번호:" id="changePw"><br>
			비밀 번호확인  : <input type="password" placeholder="비밀번호 재확인:" id="changePwC"><br>
			<input type='hidden' name='nickname' id='memberName'value='${userDto.nickname}'>
			<input type='hidden' name='userName' id='memberName'value='${userDto.userName}'>
			<input type='hidden' name='userAdmin' value="${userDto.userAdmin}">
			
			<input type="button" value="변경하기" onclick="asd();" id="qwe">
			<input type="button" value="취소" onclick='pageMoveBeforeFnc(${userDto.userNo});'>
		</form>
	</div>
</body>
</html>