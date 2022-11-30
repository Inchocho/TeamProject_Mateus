<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	#div{
	border: 1px solid black;
	width: 250px;
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
			번호: <input type="hidden" name='userNo'
			value='${userDto.userNo}' readonly="readonly"><br>
			비밀번호: <input type="text" value="${userDto.password}" id="password">
			<input type="password" placeholder="현재비밀번호:" id="passwordC"><br>
			<input type="password" name="password" placeholder="변경할 비밀번호:" id="changePw"><br>
			<input type="password" placeholder="비밀번호 재확인:" id="changePwC"><br>
			
			<input type="button" value="변경하기" onclick="asd();" id="qwe">
			<input type="button" value="취소" onclick='pageMoveBeforeFnc(${userDto.userNo});'>
		</form>
	</div>
</body>
</html>