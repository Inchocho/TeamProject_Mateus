<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	$(function () {
		var a = $('#password').val();
// 		alert(a);
		$('.submitbtn').click(function () {
			var b = $('#changePw').val();
			var c = $('#changePwC').val();
			
			if (a != b) {
				alert("비밀번호를 확인해주세요");
			}else if (b != c) {
				
			}
			
			else {
				formId.submit();
			}
		});
			
	});
	
</script>
</head>
<body>
	<h1>회원탈퇴</h1>
	${userDto.nickname}님 정말로 탈퇴하시겠습니까?<br>
	
	<form action="123" method="post" id="formId">
		<input type="hidden" value="${userDto.password}" id="password">
		<input type="text" value="" placeholder="비밀번호:" id="changePw"><br>
		<input type="text" value="" placeholder="비밀번호 확인:" id="changePwC"><br>
		<input type="button" value="탈퇴" class="submitbtn">
		<input type="button" value="취소">
	</form>
</body>
</html>